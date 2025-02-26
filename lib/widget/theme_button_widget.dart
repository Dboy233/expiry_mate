import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expiry_mate/config_provider.dart';

class ThemeButton extends ConsumerWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode = ref.watch(themeConfigProvider);
    var mod = themeMode.valueOrNull ?? 0;
    return IconButton(
      onPressed: () {
        ref.read(themeConfigProvider.notifier).changeMode();
      },
      icon: Icon(
        mod == 0 ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
      ),
    );
  }
}
