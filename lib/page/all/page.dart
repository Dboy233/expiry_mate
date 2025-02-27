import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/db/data/expiry_type.dart';
import 'package:expiry_mate/ext/date_ext.dart';
import 'package:expiry_mate/gen/assets.gen.dart';
import 'package:expiry_mate/page/all/provider.dart';
import 'package:expiry_mate/widget/theme_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      body: Consumer(
        builder: (context, ref, child) {
          var watch = ref.watch(expiryItemListProvider(type));
          Widget child = watch.hasValue
              ? watch.requireValue.isEmpty
                  ? _EmptyWidget()
                  : _ListViewWidget(items: watch.requireValue)
              : _LoadingWidget();
          return AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: child,
          );
        },
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget() : super(key: const ValueKey('_LoadingWidget'));

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget() : super(key: const ValueKey('_EmptyWidget'));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.iconEmpty.path,
            height: 100,
            width: 100,
            color: Theme.of(context).iconTheme.color,
          ),
          Text(
            '空空如也',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _ListViewWidget extends StatelessWidget {
  final List<ExpiryItem> items;

  const _ListViewWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          height: 100,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Card(
            child: ListTile(
              title: Text(item.name ?? ''),
              subtitle: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('生产日期:'),
                      Text('保质期:'),
                    ],
                  ),
                  SizedBox(width: 8),
                  Column(
                    children: [
                      Text('${item.createDate?.formatCn()}'),
                      Text('${item.overDate?.formatCn()}'),
                    ],
                  ),
                ],
              ),
              trailing: _ExpiryTipsWidget(item: item),
            ),
          ),
        );
      },
      itemCount: items.length,
    );
  }
}

class _ExpiryTipsWidget extends StatelessWidget {
  final ExpiryItem item;

  const _ExpiryTipsWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme.labelSmall;
    if (item.isExpired()) {
      return Text(
        '已过期',
        style: theme?.copyWith(color: Theme.of(context).colorScheme.error),
      );
    }

    if(item.lastDays<=7){
      theme = theme?.copyWith(
        color: Theme.of(context).colorScheme.secondaryContainer
      );
    }

    return Text(
      '${item.lastDays}天后过期',
      style: theme,
    );
  }
}
