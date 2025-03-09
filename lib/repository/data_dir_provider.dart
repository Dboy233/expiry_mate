import 'dart:io';

import 'package:expiry_mate/bean/app_data_dir.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_dir_provider.g.dart';

const _imageDirName = 'Image';

const _dbDirName = 'DbStore';

@Riverpod(keepAlive: true)
class AppDirDataManager extends _$AppDirDataManager {
  @override
  FutureOr<AppDir> build() async {
    debugPrint("初始化文件数据管理...");
    Directory dir = await getApplicationCacheDirectory();
    var imageDir = Directory(p.join(dir.path, _imageDirName));
    if (!imageDir.existsSync()) {
      try {
        imageDir.createSync();
        debugPrint("创建存放`图片`的文件夹:${imageDir.path}");
      } catch (e) {
        debugPrint("Error:创建存放`图片`的文件夹失败:${imageDir.path}");
      }
    }
    var dbDir = Directory(p.join(dir.path, _dbDirName));
    if (!dbDir.existsSync()) {
      try {
        dbDir.createSync();
        debugPrint("创建`DB存储`文件夹:${dbDir.path}");
      } catch (e) {
        debugPrint("Error:创建`DB存储`文件夹失败${dbDir.path}");
      }
    }

    return AppDir(img: imageDir.path, db: dbDir.path);
  }

  ///保存图片到App内部资源目录中
  ///[srcFile] 源文件
  ///[deleteSrc] 保存后是否删除源文件
  Future<AppFile?> saveImage(File srcFile, {bool deleteSrc = false}) async {
    if (!state.hasValue) return null;
    final dirData = state.requireValue;
    var newName =
        "${DateTime.now().millisecondsSinceEpoch}.${srcFile.path.split('.').last}";
    String newPath = p.join(dirData.img, newName);
    try {
      srcFile.copySync(newPath);
    } catch (e) {
      debugPrint("Error:图片文件拷贝失败$e");
      return null;
    }
    if (deleteSrc) {
      try {
        srcFile.deleteSync();
      } catch (e) {
        debugPrint("Error:源文件删除失败$e");
      }
    }
    return AppFile(newName, newPath);
  }

  ///优化，看能用rust实现不。
  Future<File?> getImage(String fileName) async {
    if (!state.hasValue) return null;
    final dirData = state.requireValue;
    var directory = Directory(dirData.img);
    try {
      var systemFile = directory.listSync().firstWhere(
        (element) {
          if (FileSystemEntity.isFileSync(element.path)) {
            if (element.path.contains(fileName)) {
              return true;
            }
          }
          return false;
        },
      );
      return File(systemFile.path);
    } catch (e) {
      debugPrint("Error：没有找到$fileName的文件");
    }
    return null;
  }
}

class AppFile {
  String name;
  String path;

  AppFile(this.name, this.path);
}
