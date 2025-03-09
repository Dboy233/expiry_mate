import 'dart:io';

import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/repository/data_dir_provider.dart';
import 'package:expiry_mate/repository/app_repository_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
class ItemDetails extends _$ItemDetails {
  @override
  Future<ExpiryItem> build(int id) async {
    final repository = await ref.read(appExpiryItemRepositoryProvider.future);
    final result = await repository.getItem(id);
    if (result.isSuccess) {
      return result.requiredData;
    } else {
      return Future.error("没有查询到id:$id 的数据");
    }
  }

  Future<bool> delete(int id) async {
    final repository = await ref.read(appExpiryItemRepositoryProvider.future);
    var dataResult = await repository.deleteExpiryItem(id);
    if (dataResult.isSuccess) {
      ref.invalidate(appExpiryItemRepositoryProvider);
      return true;
    } else {
      return false;
    }
  }

  void updateName(String? name) async {
    update(
      (p0) {
        return p0.copyWith(name: name);
      },
    );
    _onlyUpdateDb();
  }

  String? canUpdateCreateDate(DateTime dateTime) {
    var item = state.requireValue;
    if (item.overDate!.isAfter(dateTime)) {
      return null;
    }
    return '生产日期必须小于保质期';
  }

  void updateCreateDate(DateTime dateTime) {
    update(
      (p0) => p0.copyWith(createDate: dateTime),
    );
    _onlyUpdateDb();
  }

  String? canUpdateOverDate(DateTime dateTime) {
    var item = state.requireValue;
    if (dateTime.isAfter(item.createDate!)) {
      if (dateTime.difference(item.createDate!).inDays >= 1000) {
        return '保质期时间过长';
      }
      return null;
    }
    return '保质期必须大于生产日期';
  }

  void updateOverDate(DateTime dateTime) {
    update(
      (p0) => p0.copyWith(
        overDate: dateTime,
        safeDays: dateTime.difference(p0.createDate!).inDays,
      ),
    );
    _onlyUpdateDb();
  }

  String? canUpdateRemindDays(int days) {
    var item = state.requireValue;
    if (days > item.overDate!.difference(item.createDate!).inDays) {
      return '提醒时间超过了有效时间';
    }
    return null;
  }

  void updateRemindDays(int days) {
    update(
      (p0) => p0.copyWith(reminderDays: days),
    );
    _onlyUpdateDb();
  }

  void updateType(int type) {
    update(
      (p0) => p0.copyWith(type: type),
    );
    _onlyUpdateDb();
  }

  Future<String?> updateCover(String newFilePath) async {
    //处理封面图片内容
    final dirData = ref.read(appDirDataManagerProvider.notifier);
    var newPath = await dirData.saveImage(File(newFilePath),deleteSrc: Platform.isIOS||Platform.isAndroid);
    if(newPath!=null){
      update(
            (p0) => p0.copyWith(coverPath: newPath.path),
      );
      _onlyUpdateDb();
      return null;
    }else{
      return "Error";
    }

  }

  ///更新数据库
  void _onlyUpdateDb() async {
    final repository = await ref.read(appExpiryItemRepositoryProvider.future);
    await repository.updateExpiryItem(state.requireValue);
    debugPrint("更新${state.requireValue}");
    ref.invalidate(appExpiryItemRepositoryProvider);
  }


}
