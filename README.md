# 临期助手

帮助你记录家中会过期的产品。

## 已完成功能

- [x] 首页数据分类展示
- [x] 添加临期项目
- [x] 修改临期项目
- [x] 查看筛选内容
- [x] 夜间模式
- [x] 国际化支持
- [x] 增加物品照片设置功能
- [ ] 拍照识别名称自动录入-ocr
- [ ] 自动识别物品类型-ocr

## 开发环境

| 库       | 版本号    |
|:-------:|:------:|
| Flutter | 3.27.4 |
| Dart    | 3.6.2  |

[riverpod | Dart package](https://pub.dev/packages/riverpod)——进行状态管理

[objectbox | Dart package](https://pub.dev/packages/objectbox)——数据库存储

[flex_color_scheme | Flutter package](https://pub.dev/packages/flex_color_scheme)——实现主题更改。

[intl | Dart package](https://pub.dev/packages/intl)——实现国际化

本地我使用的是[FVM](https://github.com/leoafarias/fvm)管理Flutter版本号，在运行项目前先确认自己的开发环境Flutter版本为3.27.4。

```
 flutter pub get
```

项目中使用了[build_runner](https://pub.dev/packages/build_runner)，例如数据库`object_box`，资源生成[flutter_gen](https://pub.dev/packages/flutter_gen)，状态管理[riverpod](https://pub.dev/packages/riverpod)，序列化数据[freezed](https://pub.dev/packages/freezed)。

修改项目数据库，结构体，provider之后执行：

```
dart run build_runner build --delete-conflicting-outputs
```

项目中第三方包存在jdk版本冲突。为了解决java8，java11冲突问题。
在android项目的根目录的[build.gradle](android/build.gradle)添加以下内容。

```
allprojects {
    仓库 {
        google()
        mavenCentral()
    }
//-------------------------------
//解决第三方库中jkd版本冲突，统一修改为java8
    afterEvaluate { project ->
        // 仅对 Android 模块生效（含第三方库）
        if (project.plugins.hasPlugin('com.android.application') || project.plugins.hasPlugin('com.android.library')) {
            project.android.compileOptions {
                sourceCompatibility = JavaVersion.VERSION_1_8
                targetCompatibility = JavaVersion.VERSION_1_8
            }
        }
    }
//------------------------------
}
```

## 截图

|                                 Android                                  | IOS                                                                 |
|:------------------------------------------------------------------------:|:-------------------------------------------------------------------:|
| <img src="readme_img/android1.png" height="500" title="" alt="" data-align="center"> | <img src="readme_img/ios1.png" height="500" title="" alt="" data-align="center"> |
| <img src="readme_img/android2.png" height="500" title="" alt="" data-align="center"> | <img src="readme_img/ios2.png" height="500" title="" alt="" data-align="center">  |
| <img src="readme_img/android3.png" height="500" title="" alt="" data-align="center"> | <img src="readme_img/ios3.png" height="500" title="" alt="" data-align="center">  |
| <img src="readme_img/android4.png" height="500" title="" alt="" data-align="center"> | <img src="readme_img/ios4.png" height="500" title="" alt="" data-align="center">  |

| Windows                  | MacOS                    |
|:------------------------:|:------------------------:|
| <img src="readme_img/win1.png" width="400" title="" alt="" data-align="center"> | <img src="readme_img/mac1.png" width="500" title="" alt="" data-align="center"> |
| <img src="readme_img/win2.png" width="400" title="" alt="" data-align="center"> | <img src="readme_img/mac2.png" width="500" title="" alt="" data-align="center"> |
| <img src="readme_img/win3.png" width="400" title="" alt="" data-align="center"> | <img src="readme_img/mac3.png" width="500" title="" alt="" data-align="center"> |
| <img src="readme_img/win4.png" width="400" title="" alt="" data-align="center"> | <img src="readme_img/mac4.png" width="500" title="" alt="" data-align="center"> |
