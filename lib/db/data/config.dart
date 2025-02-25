import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@unfreezed
class Config with _$Config {
  @Entity(realClass: Config)
  factory Config({
     @JsonKey(name: 'id') @Default(0) @Id()  int id,
    @JsonKey(name: 'theme_mode') @Default(0) int themeMode,
  }) = _Config;

  factory Config.fromJson(Map<String, Object?> json) => _$ConfigFromJson(json);
}

