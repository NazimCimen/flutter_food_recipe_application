import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/home/presentation/widgets/home_custom_text_widgets.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
part '../widgets/home_sub_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const _BuildHeader(),
            SizedBox(height: context.dynamicHeight(0.03)),
            const _BuildSearchField(),
            SizedBox(height: context.dynamicHeight(0.03)),
            const _BuildPopularRecipes(),
            SizedBox(height: context.dynamicHeight(0.03)),
            const _BuildWorldKitchen(),
          ],
        ),
      ),
    );
  }
}
