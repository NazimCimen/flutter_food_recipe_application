import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/home/domain/entity/recipe_entity.dart';
import 'package:flutter_food_recipe_application/feauture/home/presentation/widgets/home_custom_text_widgets.dart';

class RecipeCardWidget extends StatelessWidget {
  final List<RecipeEntity?>? recipeList;
  final String title;
  final String foodImageUrl;
  final String recipeTitle;
  final User? user;
  final double height;
  final List<String?>? categoryList;
  const RecipeCardWidget({
    required this.title,
    required this.foodImageUrl,
    required this.recipeTitle,
    required this.user,
    required this.height,
    required this.categoryList,
    required this.recipeList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.paddingHorizAllMedium,
          child: HomeCustomTitleTextWidget(text: title),
        ),
        SizedBox(
          height: height * (17 / 100),
          child: (categoryList != null)
              ? _RecipeCategories(categoryList: categoryList!)
              : const SizedBox.shrink(),
        ),
        SizedBox(
          height: height * (83 / 100),
          child: (recipeList != null)
              ? _RecipeCard(
                  recipeList: recipeList!,
                  foodImageUrl: foodImageUrl,
                  recipeTitle: recipeTitle,
                  user: user,
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class _RecipeCategories extends StatelessWidget {
  const _RecipeCategories({
    required this.categoryList,
  });

  final List<String?> categoryList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryList.isNotEmpty ? categoryList.length : 0,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: context.paddingAllLow,
        child: Card(
          color:
              index == 0 ? Theme.of(context).colorScheme.primary : Colors.white,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: context.borderRadiusAllLow,
            ),
            child: Padding(
                padding: context.paddingAllLow,
                child: Text(
                  '  ${categoryList?[index]}  ',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: index == 0
                            ? Theme.of(context).colorScheme.surface
                            : Theme.of(context).colorScheme.tertiary,
                      ),
                )),
          ),
        ),
      ),
    );
  }
}

class _RecipeCard extends StatelessWidget {
  const _RecipeCard({
    required this.recipeList,
    required this.foodImageUrl,
    required this.recipeTitle,
    required this.user,
  });

  final List<RecipeEntity?> recipeList;
  final String foodImageUrl;
  final String recipeTitle;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipeList.isNotEmpty ? recipeList.length : 0,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: context.paddingHorizAllMedium,
        child: Center(
          child: Container(
            width: context.dynamicWidht(0.48),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: context.borderRadiusAllMedium,
            ),
            child: Card(
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: context.borderRadiusTopMedium,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                            foodImageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(6),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.amber,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: context.paddingAllLow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipeTitle ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                // user null kontrolü
                                user?.photoURL ??
                                    'https://firebasestorage.googleapis.com/v0/b/flutter-recipe-app-af800.appspot.com/o/WhatsApp%20Image%202024-07-22%20at%2015.46.24.jpeg?alt=media&token=eb9ad6cb-c1da-48d6-bdfa-02ffe9d2f297',
                              ), // Profil resmi URL'si
                            ),
                            SizedBox(width: 8),
                            Text(
                              user?.displayName ?? 'James Spader',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
