import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/db/data/expiry_type.dart';
import 'package:expiry_mate/ext/date_ext.dart';
import 'package:expiry_mate/page/preview/provider.dart';
import 'package:expiry_mate/widget/page_state_widget.dart';
import 'package:expiry_mate/widget/theme_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemDetailsPage extends StatelessWidget {
  final int id;
  final bool modify;

  const ItemDetailsPage(this.id, this.modify, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer(
            builder: (context, ref, child) {
              var watch = ref.watch(itemDetailsProvider(id));
              return IconButton(
                onPressed: watch.hasError
                    ? null
                    : () async {
                        var bool = await ref
                            .read(itemDetailsProvider(id).notifier)
                            .delete(id);
                        if (bool && context.mounted) {
                          Navigator.of(context).pop("delete");
                        }
                      },
                icon: Icon(
                  Icons.delete_forever,
                  color: Theme.of(context).colorScheme.error,
                ),
              );
            },
          ),
          ThemeButton(),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          var watch = ref.watch(itemDetailsProvider(id));
          PageState? state;
          if (watch.isLoading) {
            state = PageState.loading;
          }
          if (watch.hasError) {
            state = PageState.error;
          }
          return PageStateWidget(
            state: state,
            buildChild: () {
              return _Body(watch.requireValue);
            },
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final ExpiryItem item;

  const _Body(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme1 = Theme.of(context).textTheme.titleMedium;
    final theme2 = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(color: Theme.of(context).colorScheme.primary);
    return SizedBox(
      height: double.maxFinite,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: Column(
          spacing: 10,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                item.typeEnum.getIconAsset().path,
                width: 50,
                height: 50,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Text('名称:         ', style: theme1),
                  Text(item.name!, style: theme2)
                ],
              ),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            ),
            Divider(
              height: 1,
              indent: 16,
            ),
            ListTile(
              title: Row(
                children: [
                  Text('生产日期:  ', style: theme1),
                  Text('${item.createDate?.format()}', style: theme2)
                ],
              ),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            ),
            Divider(
              height: 1,
              indent: 16,
            ),
            ListTile(
              title: Row(
                children: [
                  Text('保质期:     ', style: theme1),
                  Text('${item.overDate?.format()}', style: theme2),
                ],
              ),
              subtitle: Text("有效时长:    ${item.lastDays}"),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            ),
            Divider(
              height: 1,
              indent: 16,
            ),
            ListTile(
              title: Row(
                children: [
                  Text('临期提醒:  ', style: theme1),
                  Text('${item.reminderDays}天', style: theme2),
                ],
              ),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            ),
            Divider(
              height: 1,
              indent: 16,
            ),
            ListTile(
              title: Row(
                children: [
                  Text('分类:         ', style: theme1),
                  Text(item.typeEnum.getTypeName(), style: theme2)
                ],
              ),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            ),
          ],
        ),
      ),
    );
  }
}
