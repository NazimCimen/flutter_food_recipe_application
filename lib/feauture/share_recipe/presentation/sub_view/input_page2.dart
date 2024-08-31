part of '../view/share_recipe_view.dart';

class _InputPage2 extends StatelessWidget {
  const _InputPage2();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizAllLarge,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: context.dynamicHeight(0.2)),
            CustomDropDownMenuWidget(
              dropBoxList: RecipeConstants.worldKitchenDropList,
              hintText: 'choose a world kitchen',
              titleText: 'World Kitchen',
              onSelected:
                  context.read<ShareRecipeViewModel>().valueSetterWorldKitchen,
              initialSelection:
                  context.read<ShareRecipeViewModel>().worldKitchen,
            ),
            SizedBox(height: context.dynamicHeight(0.05)),
            Selector<ShareRecipeViewModel, double>(
              selector: (_, viewModel) => viewModel.cookingDuration,
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
              onSelected:
                  context.read<ShareRecipeViewModel>().valueSetterCookingType,
              dropBoxList: RecipeConstants.cookingTypeDropList,
              hintText: 'choose a cooking type',
              titleText: 'Cooking Type',
              initialSelection:
                  context.read<ShareRecipeViewModel>().cookingType,
            ),
            SizedBox(height: context.dynamicHeight(0.035)),
          ],
        ),
      ),
    );
  }
}
