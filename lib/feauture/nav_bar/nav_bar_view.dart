import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/home/presentation/view/home_view.dart';
import 'package:flutter_food_recipe_application/feauture/nav_bar/nav_bar_view_model.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavBarViewModel(),
      child: Consumer<NavBarViewModel>(
        builder: (context, viewModel, child) {
          return DefaultTabController(
            length: 4,
            initialIndex: viewModel.currentIndex,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: buildFloatActionButtom(context),
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: buildBottomAppBar(context, viewModel),
              body: buildTabBarView(context, viewModel),
            ),
          );
        },
      ),
    );
  }

  TabBarView buildTabBarView(BuildContext context, NavBarViewModel viewModel) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const HomeView(),
        Container(),
        Container(),
        Container(),
      ],
    );
  }

  FloatingActionButton buildFloatActionButtom(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const OvalBorder(),
      onPressed: () {
        NavigatorService.pushNamed(AppRoutes.shareRecipeView);
      },
      child: Image.asset(
        ImageEnums.cook.toPathPng,
        fit: BoxFit.contain,
      ),
    );
  }

  BottomAppBar buildBottomAppBar(
    BuildContext context,
    NavBarViewModel viewModel,
  ) {
    return BottomAppBar(
      notchMargin: 2,
      height: context.dynamicHeight(0.086),
      padding: context.paddingAllMedium,
      color: Theme.of(context).colorScheme.tertiary,
      child: TabBar(
        dividerColor: Colors.transparent,
        onTap: (index) {
          viewModel.setTabIndex(index);
        },
        tabs: [
          FittedBox(
            child: buildTab(icon: Icons.home_outlined),
          ),
          FittedBox(
            child: buildTab(icon: Icons.search_outlined),
          ),
          FittedBox(
            child: buildTab(icon: Icons.bookmark_outline_outlined),
          ),
          FittedBox(
            child: buildTab(icon: Icons.person_outlined),
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
      ),
    );
  }
}
