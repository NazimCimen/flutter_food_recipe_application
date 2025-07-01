part of '../view/share_recipe_view.dart';

class InputPage2 extends StatefulWidget {
  const InputPage2({
    required this.pageController,
    super.key,
  });
  final PageController pageController;

  @override
  State<InputPage2> createState() => _InputPage2State();
}

class _InputPage2State extends State<InputPage2> with InputPage2Mixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.dynamicHeight(0.8),
          child: SingleChildScrollView(
            child: Padding(
              padding: context.paddingHorizAllLarge,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: context.dynamicHeight(0.2)),
                  CustomDropDownMenuWidget(
                    dropBoxList: RecipeConstants.worldKitchenDropList,
                    hintText: 'choose a world kitchen',
                    titleText: 'World Kitchen',
                    onSelected: context
                        .read<ShareRecipeViewModel>()
                        .valueSetterWorldKitchen,
                    controller: recipeWorlKitchenController,
                  ),
                  SizedBox(height: context.dynamicHeight(0.05)),
                  Selector<ShareRecipeViewModel, double>(
                    selector: (_, viewModel) =>
                        viewModel.recipeEntity.cookingDuration ?? 30.0,
                    builder: (context, cookingDuration, child) {
                      return CookingDurationWidget(
                        sliderValue: cookingDuration,
                        onSliderChanged: (value) {
                          context
                              .read<ShareRecipeViewModel>()
                              .setCookingDuration(value);
                        },
                      );
                    },
                  ),
                  SizedBox(height: context.dynamicHeight(0.05)),
                  CustomDropDownMenuWidget(
                    onSelected: context
                        .read<ShareRecipeViewModel>()
                        .valueSetterCookingType,
                    dropBoxList: RecipeConstants.cookingTypeDropList,
                    hintText: 'choose a cooking type',
                    titleText: 'Cooking Type',
                    controller: recipeCookingTypeController,
                  ),
                  SizedBox(height: context.dynamicHeight(0.035)),
                ],
              ),
            ),
          ),
        ),
        BottomActionBar(
          previousPagebutton: previousPage,
          nextOrShareButton: nextPage,
          previousPageBtnText: 'BACK',
          nextOrShareBtnText: 'NEXT',
        ),
      ],
    );
  }
}
