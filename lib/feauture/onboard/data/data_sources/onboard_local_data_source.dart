import 'package:flutter_food_recipe_application/feauture/onboard/data/model/onboard_model.dart';

abstract class OnBoardLocalDataSource {
  List<OnBoardModel> getOnBoardData();
}

class OnBoardLocalDataSourceImpl implements OnBoardLocalDataSource {
  @override
  List<OnBoardModel> getOnBoardData() {
    return [
      OnBoardModel(
        imagePath: 'assets/images/page1.png',
        color: '#F6B87B',
        title: 'Discover Amazing Recipes',
        description:
            'Explore a world of delicious recipes shared by food enthusiasts like you. Get inspired by dishes from around the globe!',
      ),
      OnBoardModel(
          imagePath: 'assets/images/page2.png',
          color: '#FFBD59',
          title: 'Share Your Creations',
          description:
              'Show off your culinary skills! Upload photos, videos, or link your YouTube recipes to inspire others. '),
      OnBoardModel(
          imagePath: 'assets/images/page3.png',
          color: '#FDA976',
          title: 'Smart Ingredient-Based Suggestions',
          description:
              'Unsure what to cook? Snap a photo of your ingredients, and we will suggest recipes you can make with them.'),
    ];
  }
}
