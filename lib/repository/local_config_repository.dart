import 'package:expiry_mate/db/data/config.dart';
import 'package:expiry_mate/objectbox.g.dart';
import 'package:expiry_mate/repository/app_repository.dart';

class LocalConfigRepository extends ConfigRepository {
  final Box<Config> _box;

  LocalConfigRepository(this._box);

  @override
  Config getCurrentConfig() {
    var configs = _box.getAll();
    return configs[0];
  }

  @override
  int getAppThemeMode() {
    return getCurrentConfig().themeMode;
  }

  @override
  void changeMode() {
    var currentConfig = getCurrentConfig();
    var newConfig = currentConfig.copyWith(
      themeMode: currentConfig.themeMode ^ 1,
    );
    _box.put(newConfig);
  }

  @override
  String getAppLocalCode() {
    return getCurrentConfig().language;
  }

  @override
  void changeLocal(String localCode) {
    var currentConfig = getCurrentConfig();
    final newConfig = currentConfig.copyWith(language: localCode);
    _box.put(newConfig);
  }
}
