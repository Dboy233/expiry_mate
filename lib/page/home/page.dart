import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/db/data/expiry_type.dart';
import 'package:expiry_mate/ext/date_ext.dart';
import 'package:expiry_mate/gen/l10n.dart';
import 'package:expiry_mate/page/add/page.dart';
import 'package:expiry_mate/page/all/page.dart';
import 'package:expiry_mate/page/details/page.dart';
import 'package:expiry_mate/page/home/provider.dart';
import 'package:expiry_mate/widget/language_widget.dart';
import 'package:expiry_mate/widget/theme_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar.large(
            centerTitle: true,
            title: Text(
              Language.current.homeTitle,
            ),
            actions: [
              LanguageWidget(),
              ThemeButton(),
            ],
          )
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _OverDateTitle(),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: SizedBox(
                  height: 150,
                  child: _OverdueItem(),
                ),
              ),
              _TypeListTitle(),
              _ItemTypeList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) {
              return AddPage();
            },
          ));
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.surfaceBright,
        ),
      ),
    );
  }
}

///即将过期标题
class _OverDateTitle extends StatelessWidget {
  const _OverDateTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var data = ref.watch(getSoonExpiryItemProvider);
        var hasOverDateItem = data.value != null && data.value!.isNotEmpty;
        return _HomeTitle(Language.current.homeSoonExpiryTitle,
            moreTap: !hasOverDateItem
                ? null
                : () {
                    goAllItemPage(context, isOnlyExpiry: true);
                  });
      },
    );
  }
}

///分类标题
class _TypeListTitle extends StatelessWidget {
  const _TypeListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var data = ref.watch(dbAllExpirySizeProvider);
        var hasItem = data.value != null && data.requireValue > 0;
        return _HomeTitle(
          Language.current.homeTypeTitle,
          moreTap: !hasItem
              ? null
              : () {
                  goAllItemPage(context);
                },
        );
      },
    );
  }
}

///标题
class _HomeTitle extends StatelessWidget {
  final String title;
  final VoidCallback? moreTap;

  const _HomeTitle(this.title, {super.key, this.moreTap});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 640),
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 8,
            bottom: 8,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 400),
                opacity: moreTap != null ? 1 : 0,
                child: IconButton(
                  onPressed: moreTap,
                  icon: Icon(
                    Icons.list,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//临期食品列表展示
class _OverdueItem extends ConsumerWidget {
  const _OverdueItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(getSoonExpiryItemProvider);
    var list = data.hasValue ? data.requireValue : [];
    // var list = [];
    return list.isEmpty
        ? _createEmptyWidget(context)
        : ListView.builder(
            key: ValueKey('overdue_item'),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            itemCount: list.length,
            itemBuilder: (context, index) => _OverdueItemCard(list[index]),
          );
  }

  ///没有临期食品的时候展示
  Widget _createEmptyWidget(BuildContext context) {
    return Padding(
      key: ValueKey("empty_Item_view"),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
          child: Center(
            child: Text(
              '暂无即将过期食品',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}

class _OverdueItemCard extends StatelessWidget {
  final ExpiryItem item;

  _OverdueItemCard(this.item) : super(key: ValueKey(item.id));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 16),
      child: SizedBox(
        width: 230,
        height: double.infinity,
        child: Card(
          margin: EdgeInsets.zero,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => ItemDetailsPage(item.id!, false),
              ));
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name!,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            Language.current.createDate,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            Language.current.overDate,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            " : ${item.createDate?.format()}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            " : ${item.overDate?.format()}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    "${Language.current.homeSoonExpiryCardLastDays} :${item.overDate?.difference(DateTime.now()).inDays ?? 0}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///食品类型列表
class _ItemTypeList extends ConsumerWidget {
  const _ItemTypeList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(getExpiryItemTypeInfoProvider);
    if (!data.hasValue) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircularProgressIndicator(),
        ),
      );
    }
    return GridView.builder(
      padding: EdgeInsets.all(16),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => _ItemTypeCard(data.requireValue[index]),
      itemCount: data.requireValue.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
          mainAxisSpacing: 10),
    );
  }
}

///食品类型卡片
class _ItemTypeCard extends ConsumerWidget {
  final ExpiryCardInfo info;

  const _ItemTypeCard(this.info, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          goAllItemPage(context, lockType: info.type);
        },
        child: GridTile(
          header: Column(
            mainAxisSize: MainAxisSize.max,
            spacing: 8,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  info.iconAssets,
                  height: 30,
                  width: 30,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: Text(
                  info.type.getTypeName(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          footer: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              bottom: 4,
            ),
            child: Text(
              Language.current.homeTypeCardRecord(info.size),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          child: Container(),
        ),
      ),
    );
  }
}

void goAllItemPage(
  BuildContext context, {
  ///锁定类型
  ExpiryType? lockType,

  ///是否之查看临期内容
  bool isOnlyExpiry = false,
}) {
  Navigator.of(context).push(
    CupertinoPageRoute(
      builder: (context) => ExpiryItemListPage(
        type: lockType,
        isOnlyExpiry: isOnlyExpiry,
      ),
    ),
  );
}
