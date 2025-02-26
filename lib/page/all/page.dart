import 'package:expiry_mate/db/data/expiry_type.dart';
import 'package:expiry_mate/widget/theme_button_widget.dart';
import 'package:flutter/material.dart';

class ExpiryItemListPage extends StatelessWidget {

  final ExpiryType? type;

  const ExpiryItemListPage({super.key, this.type});

  @override
  Widget build(BuildContext context) {
    String title = type?.getTypeName() ?? "全部";
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: BackButton(),
        actions: [ThemeButton()],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
