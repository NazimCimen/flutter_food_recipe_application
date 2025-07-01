import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_entity.dart';
import 'package:flutter_food_recipe_application/feauture/home/presentation/widgets/home_custom_text_widgets.dart';

class RecipeCardWidget extends StatelessWidget {
  final List<RecipeEntity?>? recipeList;
  final String title;
  final User? user;
  final List<String?>? categoryList;
  const RecipeCardWidget({
    required this.title,
    required this.user,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeCustomTitleTextWidget(text: title),
              InkWell(
                child: Text(
                  'View All',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: context.dynamicHeight(0.08),
          child: (categoryList != null)
              ? _RecipeCategories(categoryList: categoryList!)
              : const SizedBox.shrink(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.38,
          child: (recipeList != null)
              ? _RecipeCard(
                  recipeList: recipeList!,
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
        child: buildCatgoryCard(index, context),
      ),
    );
  }

  Card buildCatgoryCard(int index, BuildContext context) {
    return Card(
      color: index == 0 ? Theme.of(context).colorScheme.primary : Colors.white,
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
                        : Theme.of(context).colorScheme.onTertiary,
                  ),
            )),
      ),
    );
  }
}

class _RecipeCard extends StatelessWidget {
  const _RecipeCard({
    required this.recipeList,
    required this.user,
  });

  final List<RecipeEntity?> recipeList;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: recipeList.isNotEmpty ? recipeList.length : 0,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Card(
              child: Column(
                children: [
                  // Image container with fixed 1:1 aspect ratio
                  AspectRatio(
                    aspectRatio: 1, // 1:1 aspect ratio
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        recipeList[index]?.imageUrl ??
                            'https://firebasestorage.googleapis.com/v0/b/flutter-recipe-app-af800.appspot.com/o/YUMMY.png?alt=media&token=d151d7da-aa1b-48d7-a25b-92089075b3cc',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Expanded widget for the remaining content
                  Expanded(
                    child: Padding(
                      padding: context.paddingAllLow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 2,
                            recipeList[index]?.recipeTitle ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                          ),
                          Padding(
                            padding: context.paddingVertTopLow,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundImage: NetworkImage(
                                    user?.photoURL ??
                                        'https://firebasestorage.googleapis.com/v0/b/flutter-recipe-app-af800.appspot.com/o/WhatsApp%20Image%202024-07-22%20at%2015.46.24.jpeg?alt=media&token=eb9ad6cb-c1da-48d6-bdfa-02ffe9d2f297',
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    '  ${user?.displayName}' ?? 'James Spader',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onTertiary,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
