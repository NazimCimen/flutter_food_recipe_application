import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_food_recipe_application/feauture/home/presentation/viewmodel/home_view_model.dart';

mixin HomeViewMixin on State<HomeView> {
  int activeIndex = 0;

  ////reset home view model IMPORTANT !!!!!
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await Provider.of<HomeViewModel>(context, listen: false)
            .failureOrGetRecipesFollowers();
      },
    );
    super.initState();
  }

  List<String> generateListWorldKitchenCategories() {
    return List.generate(
      WorldKitchenCategoryEnum.values.length,
      (index) {
        return WorldKitchenCategoryEnum.values[index].category;
      },
    );
  }

  List<String> generateListFollowersRecipeCategories() {
    return List.generate(
      FollowersRecipesCategoriesEnum.values.length,
      (index) {
        return FollowersRecipesCategoriesEnum.values[index].category;
      },
    );
  }

  int categoryButtonClicked(int index) {
    activeIndex = index;
    return activeIndex;
  }
}

enum WorldKitchenCategoryEnum {
  turkish,
  italian,
  tunisian,
  french,
  japanese,
  chinese,
  mexican,
}

extension WorldKitchenCategory on WorldKitchenCategoryEnum {
  String get category {
    switch (this) {
      case WorldKitchenCategoryEnum.turkish:
        return 'Turkish';
      case WorldKitchenCategoryEnum.italian:
        return 'Italian';
      case WorldKitchenCategoryEnum.tunisian:
        return 'Tunisian';
      case WorldKitchenCategoryEnum.french:
        return 'French';
      case WorldKitchenCategoryEnum.japanese:
        return 'Japanese';
      case WorldKitchenCategoryEnum.chinese:
        return 'Chinese';
      case WorldKitchenCategoryEnum.mexican:
        return 'Mexican';
    }
  }
}

enum FollowersRecipesCategoriesEnum {
  discover,
  mostPopular,
  latest,
}

extension FollowersRecipesCategories on FollowersRecipesCategoriesEnum {
  String get category {
    switch (this) {
      case FollowersRecipesCategoriesEnum.discover:
        return 'Discover';
      case FollowersRecipesCategoriesEnum.mostPopular:
        return 'Most Popular';
      case FollowersRecipesCategoriesEnum.latest:
        return 'Latest';
    }
  }
}
