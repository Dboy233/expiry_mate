import 'package:expiry_mate/db/data/config.dart';
import 'package:expiry_mate/db/db.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config_provider.g.dart';



@riverpod
class ThemeConfig extends _$ThemeConfig  {
  @override
  Future<int> build() async {
    var db = await ref.read(dbStoreProvider.future);
    var box= db.box<Config>();
    var config = box.getAll()[0];
    return config.themeMode;
  }

  void changeMode() async{
    var db = await ref.read(dbStoreProvider.future);
    var box= db.box<Config>();
    var config = box.getAll()[0].copyWith(
        themeMode: state.requireValue^1
    );
    box.put(config);
    state = AsyncValue.data(config.themeMode);
  }

}


@riverpod
class LanguageConfig extends _$LanguageConfig {
  @override
  FutureOr<String> build() async {
    var db = await ref.read(dbStoreProvider.future);
    var box= db.box<Config>();
    var config = box.getAll()[0];
    return config.language;
  }

  void setLanguage(String localCode) async{
    var db = await ref.read(dbStoreProvider.future);
    var box= db.box<Config>();
    var config = box.getAll()[0].copyWith(
      language: localCode
    );
    box.put(config);
    state = AsyncData(localCode);
  }

}
