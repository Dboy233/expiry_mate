import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expiry_mate/bean/result.dart';
import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/repository/expiry_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

///创建时间溢出，生产时间和保质期差距太大
const int errorCodeCreateDateOverflowDays = 11;

///保质期错误，保质期小于生产日期错误
const int errorCodeOverDate = 20;

///保质期错误，保质期和生产日期差距太大
const int errorCodeOverDateOverflowDays = 21;

///有效时长错误，有效期小于0
const int errorCodeSafeDays = 30;

///有效时长错误，有效期过长
const int errorCodeSafeDaysOverflowDays = 31;

///提醒日错误，提醒日大于有效时长
const int errorCodeRDaysOverFlowDays = 40;

///fixme: 有一个更好的更新优化逻辑：
///       更新时间，只修改时间，然后再去将自己更新后的时间交给附属有关联的
///       更新函数去处理，不负责其他参数的主动修改。
@riverpod
class CreateNewItem extends _$CreateNewItem {
  @override
  DataResult<ExpiryItem> build() {
    debugPrint('构建了一个新的条目');
    return DataResult.success(ExpiryItem(
      //没有调整类型的话默认0=谷物类,因为UI默认选中位置就是0
      type: 0,
    ));
  }

  void updateName(String? name) {
    state = state.copyWith(
      code: resultSuccessCode,
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
          code: errorCodeCreateDateOverflowDays,
          msg: '你看看这保质期太久了吧',
        );
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
      code: resultSuccessCode,
      callData: (data) => data?.copyWith(
        createDate: date,
        overDate: overDate,
        safeDays: safeDays,
      ),
    );

    updateRemindDays(state.requiredData.reminderDays ?? 0);
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
              code: errorCodeOverDateOverflowDays, msg: '咱自己都活不了那么久');
          return;
        }

        //更新
        state = state.copyWith(
          code: resultSuccessCode,
          callData: (data) {
            return data?.copyWith(
              overDate: date,
              safeDays: safeDays,
            );
          },
        );

        updateRemindDays(state.requiredData.reminderDays ?? 0);
      } else {
        //必须通知用户，因为需要让他知道自己要干什么。
        state = state.copyWith(
          code: errorCodeOverDate,
          msg: '保质期必须大于生产日期',
        );
      }
    } else {
      //没有设置生产日期,那就只更新保质期时间
      state = state.copyWith(
        code: resultSuccessCode,
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
        code: resultSuccessCode,
        callData: (data) => data?.copyWith(
          safeDays: null,
        ),
      );
      return;
    }
    if (days <= 0) {
      state = state.copyWith(
        code: errorCodeSafeDays,
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
      code: resultSuccessCode,
      callData: (data) => data?.copyWith(
        overDate: overDate,
        safeDays: days,
      ),
    );
    updateRemindDays(state.requiredData.reminderDays ?? 0);
  }

  void updateRemindDays(int days) {
    var safeDays = state.requiredData.safeDays;
    if (safeDays != null && days > safeDays) {
      //提醒日不能大于有效期天数
      //NOTE: UI需要在出现错误的时候修正输入的值
      state = state.copyWith(
        code: errorCodeRDaysOverFlowDays,
        msg: '提醒天数不能大于保质期时长',
        callData: (data) => data?.copyWith(
          //将提醒时间修改为有效时长
          reminderDays: safeDays,
        ),
      );
      return;
    }

    state = state.copyWith(
      code: resultSuccessCode,
      callData: (data) => data?.copyWith(
        reminderDays: days,
      ),
    );
  }

  void updateType(int typeIndex) {
    state = state.copyWith(
      code: resultSuccessCode,
      callData: (data) => data?.copyWith(type: typeIndex),
    );
  }

  Future<DataResult> create() async {
    var data = state.requiredData;
    if (data.name == null || data.name!.isEmpty) {
      return DataResult.error(msg: '名称不能为空');
    }
    if (data.createDate == null) {
      return DataResult.error(msg: '生产日期不能为空');
    }

    if (data.overDate == null || data.safeDays == null) {
      return DataResult.error(msg: '保质期不能为空');
    }
    //如果没有设置提醒日，默认7天
    data.reminderDays ??= 7;

    var repository = await ref.read(appRepositoryProvider.future);
    var dataResult = await repository.addExpiryItem(state.requiredData);
    debugPrint('${dataResult.data?.toJson()}');
    ref.invalidate(appRepositoryProvider);
    return DataResult.success(0);
  }
}
