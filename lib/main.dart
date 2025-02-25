import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods_assistant/config_provider.dart';
import 'package:foods_assistant/db/db.dart';
import 'package:foods_assistant/page/home/page.dart';
import 'package:foods_assistant/theme.dart';

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
    var theme = themeModeData.valueOrNull ?? 0;
    var materialTheme = MaterialTheme(Theme.of(context).textTheme);
    var themeMode =
        theme == 0 ? materialTheme.lightHighContrast() : materialTheme.dark();

    return MaterialApp(
      theme: themeMode,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh',"CH"),
        const Locale('en', 'US'),
      ],
      locale: const Locale('zh'),
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
