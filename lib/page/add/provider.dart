import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foods_assistant/bean/result.dart';
import 'package:foods_assistant/db/data/food.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

const int resultErrorCodeCreateDateOverflowDays = 11;
const int resultErrorCodeOverDate = 20;
const int resultErrorCodeOverDateOverflowDays = 21;
const int resultErrorCodeSafeDays = 30;
const int resultErrorCodeSafeDaysOverflowDays = 31;

@riverpod
class CreateNewFood extends _$CreateNewFood {
  @override
  DataResult<Foods> build() {
    debugPrint('构建了一个新的Foods');
    return DataResult.success(Foods());
  }

  void updateFoods(Foods food) {
    // state = food;
  }

  void updateName(String? name) {
    state = state.copyWith(
      code: RESULT_SUCCESS_CODE,
      callData: (data) => data?.copyWith(name: name),
    );
  }

  void updateCreateDate(DateTime date) {
    var currentData = state.requiredData;
    DateTime? overDate = currentData.overDate;
    int? safeDays = currentData.safeDays;

    //在重新计算有效期时，要对其进行一次检查
    bool checkSafeDays(int? days) {
      //safeDays，它不能超过9999天
      if (days != null && days > 9999) {
        ///这是不允许的，时间太长了。
        state = state.copyWith(
            code: resultErrorCodeCreateDateOverflowDays, msg: '你看看这保质期太久了吧');
        return false;
      }
      return true;
    }

    if (overDate == null && safeDays != null) {
      //有有效天数，没有过期时间，计算过期时间
      overDate = date.add(Duration(days: safeDays));
    }

    if (overDate != null && safeDays == null) {
      //有过期日期，没有有效天数，计算有效天数
      //判断设置的生产日期是否在过期时间之前,如果时间越界，将过期时间清空
      if (overDate.isAfter(date)) {
        var inDays = overDate.difference(date).inDays;
        //还要判断一个内容，就是safeDays，它不能超过9999天
        if (!checkSafeDays(inDays)) {
          return;
        }
        safeDays = inDays;
      } else {
        //时间越界，创建时间优先
        overDate = null;
        safeDays = null;
      }
    }

    if (overDate != null && safeDays != null) {
      //如果两个数据都不为null,重新计算结束过期日期和有效天数。
      if (overDate.isAfter(date)) {
        //优先通过日期计算有效天数
        var inDays = overDate.difference(date).inDays;
        if (!checkSafeDays(inDays)) {
          return;
        }
        safeDays = inDays;
      } else {
        //重新通过有效日推算过期时间
        overDate = date.add(Duration(days: safeDays));
      }
    }

    state = state.copyWith(
      code: RESULT_SUCCESS_CODE,
      callData: (data) => data?.copyWith(
        createDate: date,
        overDate: overDate,
        safeDays: safeDays,
      ),
    );
  }

  void updateOverDate(DateTime date) {
    var requiredData = state.requiredData;
    if (requiredData.createDate != null) {
      if (date.isAfter(requiredData.createDate!)) {
        //设置了创建时间，并且保质期大于生产日期
        var safeDays = date.difference(requiredData.createDate!).inDays;

        //还要判断一个内容，就是safeDays，它不能超过9999天
        if (safeDays > 9999) {
          ///这是不允许的，时间太长了。
          state = state.copyWith(
              code: resultErrorCodeOverDateOverflowDays, msg: '咱自己都活不了那么久');
          return;
        }

        //更新
        state = state.copyWith(
          code: RESULT_SUCCESS_CODE,
          callData: (data) {
            return data?.copyWith(
              overDate: date,
              safeDays: safeDays,
            );
          },
        );
      } else {
        //必须通知用户，因为需要让他知道自己要干什么。
        state = state.copyWith(
          code: resultErrorCodeOverDate,
          msg: '保质期必须大于生产日期',
        );
      }
    } else {
      //没有设置生产日期,那就只更新保质期时间
      state = state.copyWith(
        code: RESULT_SUCCESS_CODE,
        callData: (data) {
          return data?.copyWith(
            overDate: date,
            safeDays: null,
          );
        },
      );
    }
  }

  void updateSafeDays(int? days) {
    if (days == null) {
      //清空了当前的有效期
      state = state.copyWith(
        code: RESULT_SUCCESS_CODE,
        callData: (data) => data?.copyWith(
          safeDays: null,
        ),
      );
      return;
    }
    if (days <= 0) {
      state = state.copyWith(
        code: resultErrorCodeSafeDays,
        msg: '有效期必须大于0天',
        callData: (data) => data?.copyWith(
          overDate: null,
          safeDays: null,
        ),
      );
      return;
    }

    var requiredData = state.requiredData;
    DateTime? overDate;
    if (requiredData.createDate != null) {
      //有生产日期，自动计算保质期，不判断保质期是否null，是因为现在的操作是直接输入天数。
      //保质期时间必须更新
      overDate = requiredData.createDate!.add(Duration(days: days));
    } else {
      //没有设置生产日期，那么ui上就只更新天数，overDate清空。
    }

    state = state.copyWith(
      code: RESULT_SUCCESS_CODE,
      callData: (data) => data?.copyWith(
        overDate: overDate,
        safeDays: days,
      ),
    );
  }

  void create() {}
}
