import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods_assistant/db/data/config.dart';
import 'package:foods_assistant/db/data/food.dart';
import 'package:foods_assistant/repository/fake_data_generation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../objectbox.g.dart';

part 'db.g.dart';

@riverpod
Future<Store> dbStore(Ref ref) async {
  debugPrint("dbStore init 和");
  final docsDir = await getApplicationDocumentsDirectory();
  final store = await openStore(directory: p.join(docsDir.path, "foods_db"));
  var foods = Box<Foods>(store);
  ///添加假数据
  if (foods.isEmpty()) {
    var list = FakeDataGen.generateFakeFoods(10);
   await foods.putManyAsync(list);
  }

  var config = Box<Config>(store);
  if(config.isEmpty()){
    var put = config.put(Config(
        themeMode: 0
    ));
    debugPrint("put config $put");
  }

  return store;
}
