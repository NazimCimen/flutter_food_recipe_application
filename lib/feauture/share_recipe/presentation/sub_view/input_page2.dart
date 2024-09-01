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
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: context.paddingAllMedium,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonWidget(
                    context: context,
                    text: 'BACK',
                    onPressed: () {
                      widget.pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linearToEaseOut,
                      );
                    },
                  ),
                  CustomButtonWidget(
                    context: context,
                    text: 'NEXT',
                    onPressed: () {
                      widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linearToEaseOut,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
