import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/home/presentation/view/home_view.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/view/share_recipe_view.dart';
import 'package:provider/provider.dart';

class UiView extends StatefulWidget {
  const UiView({super.key});

  @override
  State<UiView> createState() => _UiViewState();
}

class _UiViewState extends State<UiView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: buildFloatActionButtom(context),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: buildBottomAppBar(context),
        body: buildTabBarView(context),
      ),
    );
  }

  TabBarView buildTabBarView(BuildContext context) {
    return TabBarView(physics: const NeverScrollableScrollPhysics(), children: [
      const HomeView(),
      Container(),
      Container(),
      Container(),
    ]);
  }

  FloatingActionButton buildFloatActionButtom(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const OvalBorder(),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShareRecipeView(),
            ));
      },
      child: Image.asset(
        ImageEnums.cook.toPathPng,
        fit: BoxFit.contain,
      ),
    );
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      notchMargin: 2.0,
      height: context.dynamicHeight(0.086),
      padding: context.paddingAllMedium,
      color: Theme.of(context).colorScheme.tertiary,
      child: TabBar(
        dividerColor: Colors.transparent,
        tabs: [
          FittedBox(
            child: buildTab(
              icon: Icons.home_outlined,
            ),
          ),
          FittedBox(
            child: buildTab(
              icon: Icons.search_outlined,
            ),
          ),
          FittedBox(
              child: buildTab(
            icon: Icons.bookmark_outline_outlined,
          )),
          FittedBox(
            child: buildTab(
              icon: Icons.person_outlined,
            ),
          ),
        ],
      ),
    );
  }

  Tab buildTab({required IconData icon, Color? color}) {
    return Tab(
        icon: Icon(
      icon,
      color: color,
      size: 30,
    ));
  }
}
