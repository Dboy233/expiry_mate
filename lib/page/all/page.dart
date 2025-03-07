import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/db/data/expiry_type.dart';
import 'package:expiry_mate/ext/date_ext.dart';
import 'package:expiry_mate/gen/l10n.dart';
import 'package:expiry_mate/page/all/filter_page.dart';
import 'package:expiry_mate/page/all/provider.dart';
import 'package:expiry_mate/page/details/page.dart';
import 'package:expiry_mate/widget/language_widget.dart';
import 'package:expiry_mate/widget/page_state_widget.dart';
import 'package:expiry_mate/widget/theme_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExpiryItemListPage extends StatelessWidget {
  ///分类类型
  final ExpiryType? type;

  ///是否只查看即将过期的视频
  final bool isOnlyExpiry;

  const ExpiryItemListPage({super.key, this.type, this.isOnlyExpiry = false});

  @override
  Widget build(BuildContext context) {
    String title = isOnlyExpiry
        ? Language.current.allPageTitleSoonExpiry
        : type?.getTypeName() ?? Language.current.allPageTitle;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        leading: BackButton(),
        actions: [
          LanguageWidget(),

          ///只看临期不显示过滤
          if (!isOnlyExpiry)
            Consumer(
              builder: (context, ref, child) {
                return IconButton(
                  icon: Icon(Icons.filter_alt_outlined),
                  onPressed: () async {
                    GlobalKey formKey = GlobalKey<FormState>();
                    await showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      scrollControlDisabledMaxHeightRatio: 0.8,
                      builder: (context) {
                        return FilterContentWidget(formKey, type);
                      },
                    );
                    ref.invalidate(expiryItemListProvider(type));
                  },
                );
              },
            ),
          ThemeButton(),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          var watch = ref.watch(expiryItemListProvider(type));
          PageState? state = watch.isLoading
              ? PageState.loading
              : watch.hasValue
                  ? watch.requireValue.isEmpty
                      ? PageState.empty
                      : null
                  : PageState.error;
          return PageStateWidget(
            state: state,
            onRetry: () {},
            buildChild: () =>
                _ListViewWidget(items: watch.requireValue, type: type),
          );
        },
      ),
    );
  }
}

class _ListViewWidget extends ConsumerWidget {
  final List<ExpiryItem> items;
  final ExpiryType? type;

  const _ListViewWidget({super.key, required this.items, this.type});

  @override
  Widget build(BuildContext context, ref) {
    var themeData = Theme.of(context);
    var onErrorTextTheme = themeData.textTheme.bodyMedium?.copyWith(
      color: Colors.white.withValues(alpha: 0.8),
      fontWeight: FontWeight.bold,
    );
    var onArchiveTextTheme = themeData.textTheme.bodyMedium?.copyWith(
      color: Colors.white.withValues(alpha: 0.8),
      fontWeight: FontWeight.bold,
    );
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 640),
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          itemBuilder: (_, index) {
            final item = items[index];
            return DismissibleTile(
              key: ValueKey(item.id),
              padding: const EdgeInsets.symmetric(vertical: 8),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              delayBeforeResize: const Duration(milliseconds: 500),
              ltrDismissedColor: themeData.colorScheme.primary,
              rtlDismissedColor: themeData.colorScheme.error,
              ltrOverlay: Text(Language.current.allPageItemModify,
                  style: onArchiveTextTheme),
              ltrOverlayDismissed: Text(Language.current.allPageItemModify,
                  style: onArchiveTextTheme),
              rtlOverlay:
                  Text(Language.current.allPageItemDelete, style: onErrorTextTheme),
              rtlOverlayDismissed:
                  Text(Language.current.allPageItemDelete, style: onErrorTextTheme),
              child: _listTile(context, item),
              onDismissed: (d) {
                ref.invalidate(expiryItemListProvider(type));
              },
              confirmDismiss: (direction) async {
                if (direction == DismissibleTileDirection.leftToRight) {
                  return await Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => ItemDetailsPage(item.id!, true))) ==
                      'delete';
                } else {
                  //二次确认
                  final isConfirm = await showDialog(
                      context: context,
                      builder: (context) => _ConfirmTheDeletionDialog());
                  if (isConfirm == true) {
                    await ref
                        .read(expiryItemListProvider(type).notifier)
                        .delete(item.id!);
                    return true;
                  } else {
                    return false;
                  }
                }
              },
            );
          },
          itemCount: items.length,
        ),
      ),
    );
  }

  Widget _listTile(BuildContext context, ExpiryItem item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: ListTile(
        title: Text(
          item.name ?? '',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        minTileHeight: 50,
        leading: Image.asset(
          ExpiryType.values[item.type!].getIconAsset().path,
          width: 30,
          height: 30,
          color: Theme.of(context).colorScheme.primary,
        ),
        subtitle: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(Language.current.createDate),
                Text(Language.current.overDate),
              ],
            ),
            SizedBox(width: 8),
            Column(
              children: [
                Text(': ${item.createDate?.format()}'),
                Text(': ${item.overDate?.format()}'),
              ],
            ),
          ],
        ),
        trailing: _ExpiryTipsWidget(item: item),
      ),
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
        Language.current.allPageHasExpired,
        style: theme?.copyWith(color: Theme.of(context).colorScheme.error),
      );
    }

    if (item.lastDays <= 7) {
      theme = theme?.copyWith(color: Theme.of(context).colorScheme.error);
    }

    return Text(
      Language.current.allPageExpiresAfterAFewDays(item.lastDays),
      style: theme,
    );
  }
}

class _ConfirmTheDeletionDialog extends StatelessWidget {
  const _ConfirmTheDeletionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Language.current.confirmTheDeletion),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 8,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(null);
            },
            child: Text(
              Language.current.cancel,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(
              Language.current.confirm,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
