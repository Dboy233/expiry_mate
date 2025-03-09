import 'package:expiry_mate/repository/app_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeButton extends ConsumerWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(appConfigRepositoryProvider);
    ///默认亮色
    int mode = 0;
    if (watch.hasValue) {
      mode = watch.requireValue.getAppThemeMode();
    }
    return IconButton(
      onPressed: () async {
        watch.requireValue.changeMode();
        ref.invalidate(appConfigRepositoryProvider);
      },
      icon: Icon(
        mode == 0 ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
      ),
    );
  }
}
