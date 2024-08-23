part of '../view/share_recipe_view.dart';

class _InputPage4 extends StatelessWidget {
  const _InputPage4();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizAllLarge,
      child: RecipeStepInputWidget(
          recipeSteps: context.read<ShareRecipeViewModel>().recipeSteps),
    );
  }
}
