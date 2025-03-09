import 'package:expiry_mate/app_theme.dart';
import 'package:expiry_mate/gen/l10n.dart';
import 'package:expiry_mate/page/home/page.dart';
import 'package:expiry_mate/repository/app_repository_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    observers: [],
    child: _InitWidget(
        child: Home(
      key: ValueKey("HomePage1"),
    )),
  ));
}

class _InitWidget extends ConsumerWidget {
  final Widget child;

  const _InitWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///获取配置信息
    var config = ref.watch(appConfigRepositoryProvider);
    debugPrint("config change ： ${config.isLoading} ${config.hasValue}");
    ///如果配置信息正在初始化展示加载页面
    var view = config.hasValue
        ? child
        : _InitLoadingPage(key: ValueKey('_InitLoadingPage'));

    //获取主模式
    var themeCode = config.valueOrNull?.getAppThemeMode();
    var themeMode = themeCode == 0
        ? ThemeMode.light
        : themeCode == 1
            ? ThemeMode.dark
            : ThemeMode.system;

    //获取地区码
    final languageCode = config.valueOrNull?.getAppLocalCode() ?? 'zh';

    ///设施国际化默认语言代码，涉及到DateTime格式化和DatePickerDialog的内容显示
    Intl.defaultLocale = languageCode;

    return MaterialApp(
      scrollBehavior: MyScroll(),
      themeMode: themeMode,
      darkTheme: AppTheme.dark,
      theme: AppTheme.light,
      localizationsDelegates: [
        Language.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Language.delegate.supportedLocales,
      locale: Locale(languageCode),
      home: AnimatedSwitcher(
        duration: Duration(seconds: 1),
        child: view,
      ),
    );
  }
}

class _InitLoadingPage extends StatelessWidget {
  const _InitLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

///适配鼠标拖拽
class MyScroll extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => <PointerDeviceKind>{
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse, //this
        PointerDeviceKind.stylus,
        PointerDeviceKind.invertedStylus,
        PointerDeviceKind.trackpad,
        // The VoiceAccess sends pointer events with unknown type when scrolling
        // scrollables.
        PointerDeviceKind.unknown,
      };
}
