import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/home/presentation/viewmodel/home_view_model.dart';
import 'package:flutter_food_recipe_application/feauture/home/presentation/widgets/home_custom_text_widgets.dart';
import 'package:flutter_food_recipe_application/feauture/home/presentation/widgets/recipe_card_widget.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
part '../widgets/home_sub_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await Provider.of<HomeViewModel>(context, listen: false)
            .failureOrGetRecipes();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: context.dynamicHeight(0.01)),
            _BuildHeader(
              user: FirebaseAuth.instance.currentUser,
            ),
            SizedBox(height: context.dynamicHeight(0.03)),
            const _BuildSearchField(),
            SizedBox(height: context.dynamicHeight(0.03)),
            RecipeCardWidget(
              categoryList: [' Turkish ', ' Italian ', ' Tunisan ', ' French'],
              recipeList: [context.watch<HomeViewModel>().recipeEntity],
              height: context.dynamicHeight(0.43),
              title: 'World Kitchen',
              foodImageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/flutter-recipe-app-af800.appspot.com/o/2.png?alt=media&token=53aa5fcb-fd8c-4628-8ae4-90dce1a00a2a',
              recipeTitle: 'Bowl of noodle with beef',
              user: FirebaseAuth.instance.currentUser,
            ),
            SizedBox(height: context.dynamicHeight(0.03)),
            RecipeCardWidget(
              categoryList: [' Latest ', ' Most Popular ', ' Most Rated '],
              recipeList: [context.watch<HomeViewModel>().recipeEntity],
              height: context.dynamicHeight(0.43),
              title: 'Your Followers',
              foodImageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/flutter-recipe-app-af800.appspot.com/o/2.png?alt=media&token=53aa5fcb-fd8c-4628-8ae4-90dce1a00a2a',
              recipeTitle: 'Bowl of noodle with beef',
              user: FirebaseAuth.instance.currentUser,
            ),
            SizedBox(height: context.dynamicHeight(0.03)),
          ],
        ),
      ),
    );
  }
}
