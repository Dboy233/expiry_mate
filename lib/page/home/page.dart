import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/db/data/expiry_type.dart';
import 'package:expiry_mate/ext/date_ext.dart';
import 'package:expiry_mate/page/add/page.dart';
import 'package:expiry_mate/page/all/page.dart';
import 'package:expiry_mate/page/home/provider.dart';
import 'package:expiry_mate/widget/theme_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(
              '临期助手',
            ),
            actions: [
              ThemeButton(),
            ],
          ),
          _OverDateTitle(),
          SliverPadding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 150,
                child: _OverdueItem(),
              ),
            ),
          ),
          _TypeListTitle(),
          _ItemTypeList(),
        ],
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
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
          );
        },
      ),
    );
  }
}

///即将过期标题
class _OverDateTitle extends StatelessWidget {
  const _OverDateTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer(
        builder: (context, ref, child) {
          var data = ref.watch(getSoonExpiryItemProvider);
          var hasOverDateItem = data.value != null && data.value!.isNotEmpty;
          return _HomeTitle('即将过期',
              moreTap: !hasOverDateItem
                  ? null
                  : () {
                      goTypeAllPage(context);
                    });
        },
      ),
    );
  }
}

///分类标题
class _TypeListTitle extends StatelessWidget {
  const _TypeListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer(
        builder: (context, ref, child) {
          var data = ref.watch(dbAllExpirySizeProvider);
          var hasItem = data.value != null && data.requireValue > 0;
          return _HomeTitle(
            '分类',
            moreTap: !hasItem
                ? null
                : () {
                    goTypeAllPage(context);
                  },
          );
        },
      ),
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
    return Container(
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
            padding: const EdgeInsets.only(left: 16, right: 8),
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
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
      child: SizedBox(
        width: 350,
        height: double.infinity,
        child: Card(
          margin: EdgeInsets.zero,
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
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "生产日期 : ${item.createDate?.formatCn()}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "失效日期 : ${item.overDate?.formatCn()}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "剩余有效天数 :${item.overDate?.difference(DateTime.now()).inDays ?? 0}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
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
      return SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return SliverPadding(
      padding: EdgeInsets.all(16),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _ItemTypeCard(data.requireValue[index]);
          },
          childCount: data.requireValue.length,
        ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
            mainAxisSpacing: 10),
      ),
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
          goTypeAllPage(context);
        },
        child: GridTile(
          header: GridTileBar(
            leading: Image.asset(
              info.iconAssets,
              height: 24,
              width: 24,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              info.name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subtitle: Text(
              info.example,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          footer: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 8,
              bottom: 10,
            ),
            child: Text(
              '已录入 ${info.size}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          child: Container(),
        ),
      ),
    );
  }
}

void goTypeAllPage(BuildContext context,{ExpiryType? type,bool isExpiry = false}) {
  Navigator.of(context)
      .push(CupertinoPageRoute(builder: (context) => ExpiryItemListPage()));
}
