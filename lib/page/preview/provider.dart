import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/repository/expiry_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
class ItemDetails extends _$ItemDetails {
  @override
  Future<ExpiryItem> build(int id) async {
    final repository = await ref.read(appRepositoryProvider.future);
    final result = await repository.getItem(id);
    if (result.isSuccess) {
      return result.requiredData;
    } else {
      return Future.error("没有查询到id:$id 的数据");
    }
  }

  Future<bool> delete(int id) async {
    final repository = await ref.read(appRepositoryProvider.future);
    var dataResult = await repository.deleteExpiryItem(id);
    if (dataResult.isSuccess) {
      ref.invalidate(appRepositoryProvider);
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
    _notifyUpdate();
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
    _notifyUpdate();
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
    _notifyUpdate();
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
    _notifyUpdate();
  }

  void updateType(int type) {
    update(
      (p0) => p0.copyWith(type: type),
    );
    _notifyUpdate();
  }

  void _notifyUpdate() async {
    final repository = await ref.read(appRepositoryProvider.future);
    await repository.updateExpiryItem(state.requireValue);
    ref.invalidate(appRepositoryProvider);
  }
}
