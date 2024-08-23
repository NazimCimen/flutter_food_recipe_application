part of '../view/share_recipe_view.dart';

class _InputPage2 extends StatelessWidget {
  const _InputPage2({
    required this.cookingTypeController,
    required this.worldKitchenController,
  });
  final TextEditingController cookingTypeController;
  final TextEditingController worldKitchenController;

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
              controller: worldKitchenController,
              dropBoxList: RecipeConstants.worldKitchenDropList,
              labelText: 'choose a world kitchen',
              titleText: 'World Kitchen',
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
              controller: cookingTypeController,
              dropBoxList: RecipeConstants.cookingTypeDropList,
              labelText: 'choose a cooking type',
              titleText: 'Cooking Type',
            ),
            SizedBox(height: context.dynamicHeight(0.035)),
          ],
        ),
      ),
    );
  }
}
