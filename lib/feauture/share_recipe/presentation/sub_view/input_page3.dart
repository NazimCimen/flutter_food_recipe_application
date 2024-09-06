part of '../view/share_recipe_view.dart';

class InputPage3 extends StatefulWidget {
  final PageController pageController;

  const InputPage3({
    required this.pageController,
    super.key,
  });

  @override
  State<InputPage3> createState() => _InputPage3State();
}

class _InputPage3State extends State<InputPage3> with InputPage3Mixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // İçerik Gövdesi
        SizedBox(
          height: context.dynamicHeight(0.8),
          child: _IngredientListSection(
            onAddIngredient: addIngredientField,
            onDeleteIngredient: deleteIngredientField,
            ingredients: ingredientInputs,
          ),
        ),
        // Alt Eylem Çubuğu

        BottomActionBar(
          previousPagebutton: previousPage,
          nextOrShareButton: nextPage,
          nextOrShareBtnText: 'NEXT',
          previousPageBtnText: 'BACK',
        ),
      ],
    );
  }
}

class _IngredientListSection extends StatelessWidget {
  const _IngredientListSection({
    required this.onAddIngredient,
    required this.onDeleteIngredient,
    required this.ingredients,
  });

  final List<RecipeIngredientInputModel> ingredients;
  final VoidCallback onAddIngredient;
  final void Function(BuildContext context, int index) onDeleteIngredient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizAllLarge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomTitleTextShadowWidget(text: 'Enter Ingredient'),
              AddStepButton(
                addButton: onAddIngredient,
                btnText: 'Ingredient',
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                return _IngredientListTile(
                  ingredient: ingredients[index],
                  index: index,
                  onDelete: onDeleteIngredient,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _IngredientListTile extends StatelessWidget {
  const _IngredientListTile({
    required this.ingredient,
    required this.index,
    required this.onDelete,
  });

  final RecipeIngredientInputModel ingredient;
  final int index;
  final void Function(BuildContext context, int index) onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => onDelete(context, index),
            backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            foregroundColor: Theme.of(context).colorScheme.primary,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 12,
          child: Text(
            '${index + 1}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  shadows: CustomShadows.customLowShadow(),
                  color: Theme.of(context).colorScheme.surface,
                ),
          ),
        ),
        title: TextField(
          focusNode: ingredient.focusNode,
          controller: ingredient.controller,
          keyboardType: TextInputType.text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.surface,
                fontWeight: FontWeight.bold,
                shadows: CustomShadows.customLowShadow(),
              ),
          decoration: CustomInputDecoration.inputDecoration(
            context: context,
            hintText: 'Enter ingredient / slide left to delete',
          ),
        ),
      ),
    );
  }
}
