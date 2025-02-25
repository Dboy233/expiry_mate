import 'package:foods_assistant/db/data/config.dart';
import 'package:foods_assistant/db/db.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config_provider.g.dart';


@riverpod
class ThemeConfig extends _$ThemeConfig  {
  @override
  Future<int> build() async {
    // print('Theme Mode build 哈哈哈');
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    // TextTheme textTheme = Theme.of(context).textTheme;
    // MaterialTheme theme = MaterialTheme(textTheme);
    // if (brightness == Brightness.dark) {
    //   return theme.dark();
    // }
    // return theme.light();
    var db = await ref.watch(dbStoreProvider.future);
    var box= db.box<Config>();
    var config = box.getAll()[0];
    // assert(config!=null);
    return config.themeMode;
  }

  void changeMode() {
    // state = AsyncValue.data(1);
    var read = ref.read(dbStoreProvider);
    var db = read.requireValue;
    var box= db.box<Config>();
    var config = box.getAll()[0].copyWith(
        themeMode: state.requireValue^1
    );
    box.put(config);
    state = AsyncValue.data(config.themeMode);
  }

}
