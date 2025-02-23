import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods_assistant/bean/food.dart';
import 'package:foods_assistant/page/add/page.dart';
import 'package:foods_assistant/page/home/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.green,
            floating: true,
            elevation: 8,
            title: Text(
              '临期助手',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) {
                      return AddPage();
                    },
                  ));
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          _HomeTitle('即将过期'),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 150,
                child: _BecomeDueFood(),
              ),
            ),
          ),
          _HomeTitle('分类'),
          FoodCategoryList(),
        ],
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              ref.refresh(getFoodsCategoryInfoProvider);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(Icons.add, color: Colors.white),
          );
        },
      ),
    );
  }
}

class _HomeTitle extends StatelessWidget {
  final String title;

  const _HomeTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 20),
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

//即将到期食品列表展示
class _BecomeDueFood extends ConsumerWidget {
  const _BecomeDueFood({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var foods = ref.watch(getExpiryFoodProvider);
    if (!foods.hasValue) {
      return Container();
    }
    if (foods.value!.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: _createEmptyWidget(),
      );
    }
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 16, right: 16),
      children: [..._createFoodBanner(foods.value!)],
    );
  }

  List<Widget> _createFoodBanner(List<Food> foods) {
    var list = <Widget>[];
    for (var food in foods) {
      list.add(_createFoodInfoWidget(food));
    }
    return list;
  }

  ///没有临期食品的时候展示
  Widget _createEmptyWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: kElevationToShadow[1],
        ),
        width: 350,
        height: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
          child: Center(
            child: Text(
              '暂无即将过期食品',
              style: TextStyle(
                color: Colors.green,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///创建临期食品展示卡片
  Widget _createFoodInfoWidget(Food food) {
    var now = DateTime.now();
    int theRemainingDays = food.expiredTime!.difference(now).inDays;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: kElevationToShadow[1],
        ),
        width: 350,
        height: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "生产日期 : ${food.productionDate.format(r'Y-m-d')}",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              Text(
                "失效日期 : ${food.expiredTime!.format(r'Y-m-d')}",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              Text(
                "剩余有效天数 :$theRemainingDays",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodCategoryList extends ConsumerWidget {
  const FoodCategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(getFoodsCategoryInfoProvider);
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
            return FoodCategoryCard(data.requireValue[index]);
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

class FoodCategoryCard extends ConsumerWidget {
  final FoodCardInfo info;

  const FoodCategoryCard(this.info, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Colors.blueGrey,
      child: GridTile(
        header: GridTileBar(
          leading: Image.asset(
            info.iconAssets,
            height: 24,
            width: 24,
            color: Colors.white,
          ),
          title: Text(
            info.name,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          subtitle: Text(
            info.example,
            style: TextStyle(fontSize: 10, color: Colors.white),
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
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        ),
        child: Container(),
      ),
    );
  }
}
