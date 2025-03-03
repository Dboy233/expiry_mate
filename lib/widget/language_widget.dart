import 'package:expiry_mate/config_provider.dart';
import 'package:expiry_mate/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageWidget extends ConsumerWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(languageConfigProvider);

    return IconButton(
      onPressed: provider.hasValue
          ? () async {
              final code = await showDialog(
                context: context,
                builder: (context) =>
                    _SelectLanguageDialog(provider.requireValue),
              );
              if (context.mounted && code != null) {
                ref.read(languageConfigProvider.notifier).setLanguage(code);
              }
            }
          : null,
      icon: Icon(Icons.language_outlined),
    );
  }
}

class _SelectLanguageDialog extends StatelessWidget {
  final String currentLanguage;

  const _SelectLanguageDialog(this.currentLanguage, {super.key});

  @override
  Widget build(BuildContext context) {
    var items = [
      _LanguageData('zh', '中文', Assets.images.language.imgZh.path,
          currentLanguage == 'zh'),
      _LanguageData('en', 'English', Assets.images.language.imgEn.path,
          currentLanguage == 'en'),
    ];
    return SimpleDialog(
      title: Text('Language'),
      children: [
        ...items.map((e) => _buildLanguageItem(context, e)),
      ],
    );
  }

  Widget _buildLanguageItem(BuildContext context, _LanguageData lang) {
    // country
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: Border.all(
            color: lang.isSelect
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            width: 1,
          ),
          shape: BoxShape.rectangle),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        onTap: () {
          Navigator.pop(context, lang.code);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(lang.imagePath, width: 30),
              SizedBox(
                width: 60,
                child: Text(lang.display),
              ),
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lang.isSelect
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageData {
  String code;
  String display;
  String imagePath;
  bool isSelect;

  _LanguageData(this.code, this.display, this.imagePath, this.isSelect);
}
