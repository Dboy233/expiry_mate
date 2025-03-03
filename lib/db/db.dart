import 'package:expiry_mate/db/data/config.dart';
import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/repository/fake_data_generation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../objectbox.g.dart';

part 'db.g.dart';

@riverpod
Future<Store> dbStore(Ref ref) async {
  debugPrint("正在初始化数据库...");
  final docsDir = await getApplicationDocumentsDirectory();
  debugPrint("本地数据库位置：$docsDir");
  final store =
      await openStore(directory: p.join(docsDir.path, "ExpiryMate_db"));
  ///添加假数据
  var expiryBox = Box<ExpiryItem>(store);
  if (expiryBox.isEmpty()) {
    debugPrint("添加假假数据...");
    var list = FakeDataGen.generateFakeData(18);
    await expiryBox.putManyAsync(list);
  }

  ///App设置清单初始化
  var config = Box<Config>(store);
  if (config.isEmpty()) {
    debugPrint("初始化设置...");
    var defaultConfig = Config();
    await config.putAsync(defaultConfig);
    debugPrint("默认配置 $defaultConfig");
  }
  debugPrint("数据库初始化完成.");
  return store;
}
