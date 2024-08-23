part of '../view/share_recipe_view.dart';

class _InputPage3 extends StatelessWidget {
  const _InputPage3();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizAllLarge,
      child: IngredientInput(
        ingredients: context.read<ShareRecipeViewModel>().ingredients,
      ),
    );
  }
}
