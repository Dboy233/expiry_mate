import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods_assistant/db/db.dart';
import 'package:foods_assistant/page/home/page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    child: _InitWidget(child: MyApp()),
  ));
}

class _InitWidget extends ConsumerWidget {
  final Widget child;

  const _InitWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(dbStoreProvider);
    if (!watch.hasValue) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return child;
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: "Hello",
      home: Home(),
    );
  }
}
