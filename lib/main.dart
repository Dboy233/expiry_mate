import 'package:expiry_mate/app_theme.dart';
import 'package:expiry_mate/config_provider.dart';
import 'package:expiry_mate/db/db.dart';
import 'package:expiry_mate/page/home/page.dart';
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
    var watch = ref.watch(dbStoreProvider);
    var view = watch.hasValue
        ? child
        : _InitLoadingPage(key: ValueKey('_InitLoadingPage'));

    var themeModeData = ref.watch(themeConfigProvider);
    var themeCode = themeModeData.valueOrNull ?? 3;
    var themeMode = themeCode == 0
        ? ThemeMode.light
        : themeCode == 1
            ? ThemeMode.dark
            : ThemeMode.system;

    const locale =   Locale('zh');
    Intl.defaultLocale = 'zh';

    return MaterialApp(
      scrollBehavior: MyScroll(),
      themeMode: themeMode,
      darkTheme: AppTheme.dark,
      theme: AppTheme.light,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', "CH"),
        const Locale('en', 'US'),
      ],
      locale: locale,
      home: AnimatedSwitcher(
        duration: Duration(seconds: 2),
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

class MyScroll extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => <PointerDeviceKind>{
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.invertedStylus,
        PointerDeviceKind.trackpad,
        // The VoiceAccess sends pointer events with unknown type when scrolling
        // scrollables.
        PointerDeviceKind.unknown,
      };
}
