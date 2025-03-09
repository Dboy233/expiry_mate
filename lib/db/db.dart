//提供数据库可操作对象

import 'package:expiry_mate/db/data/config.dart';
import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/repository/data_dir_provider.dart';
import 'package:expiry_mate/repository/fake_data_generation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../objectbox.g.dart';

part 'db.g.dart';

@riverpod
Future<Store> dbStore(Ref ref) async {
  debugPrint("正在初始化数据库...");
  final appDir = await ref.read(appDirDataManagerProvider.future);
  final store = await openStore(directory: appDir.db);

  ///App设置清单初始化
  var config = Box<Config>(store);
  if (config.isEmpty()) {
    debugPrint("初始化设置...");
    var defaultConfig = Config();
    await config.putAsync(defaultConfig);
    debugPrint("默认配置 $defaultConfig");

    ///添加假数据
    var expiryBox = Box<ExpiryItem>(store);
    if (expiryBox.isEmpty()) {
      debugPrint("添加假假数据...");
      var list = FakeDataGen.generateFakeData(3);
      await expiryBox.putManyAsync(list);
    }
  }

  debugPrint("数据库初始化完成.");
  return store;
}

///向外部提供可操作的[ExpiryItem]Box对象
@riverpod
Future<Box<ExpiryItem>> expiryItemStore(Ref ref) async {
  //这里必须要watch观察数据库，如果使用read，数据库关闭后将会产生内存泄露，导致Box对象不可用。
  Store store = await ref.watch(dbStoreProvider.future);
  return store.box<ExpiryItem>();
}

///向外部提供可操作的[Config]Box对象
@riverpod
Future<Box<Config>> configStore(Ref ref) async {
  //这里必须要watch观察数据库，如果使用read，数据库关闭后将会产生内存泄露，导致Box对象不可用。
  Store store = await ref.watch(dbStoreProvider.future);
  return store.box<Config>();
}
