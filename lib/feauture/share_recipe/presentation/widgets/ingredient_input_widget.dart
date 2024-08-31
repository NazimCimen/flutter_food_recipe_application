import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/viewmodel/share_recipe_view_model.dart';
import 'package:flutter_food_recipe_application/product/componets/custom_snack_bars.dart';
import 'package:flutter_food_recipe_application/product/decorations/input_decorations/custom_input_decoration.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class IngredientInput extends StatefulWidget {
  const IngredientInput({super.key});

  @override
  _IngredientInputState createState() => _IngredientInputState();
}

class _IngredientInputState extends State<IngredientInput> {
  List<FocusNode> focusNodes = [];

  @override
  void initState() {
    super.initState();
    final viewModel = context.read<ShareRecipeViewModel>();
    focusNodes =
        List.generate(viewModel.ingredients.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  bool _canAddNewIngredient(List<String> ingredients) {
    return !ingredients.any((ingredient) => ingredient.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ShareRecipeViewModel>();
    final ingredients = viewModel.ingredients;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Enter Ingredient',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Padding(
              padding: context.paddingAllLow,
              child: TextButton.icon(
                onPressed: () {
                  if (_canAddNewIngredient(ingredients)) {
                    setState(() {
                      viewModel.ingredients.add('');
                      focusNodes.add(FocusNode());

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        FocusScope.of(context).requestFocus(focusNodes.last);
                      });
                    });
                  } else {
                    CustomSnackBars.showRecipeScaffoldSnackBar(
                      context: context,
                      text:
                          'Please fill in the empty ingredient field before adding a new one.',
                    );
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text('Ingredient'),
              ),
            ),
          ],
        ),
        SizedBox(height: context.dynamicHeight(0.02)),
        Expanded(
          child: ListView.builder(
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              return Slidable(
                key: const ValueKey(0),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        setState(() {
                          viewModel.ingredients.removeAt(index);
                          focusNodes.removeAt(index);
                        });
                      },
                      backgroundColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 12,
                    child: Text('${index + 1}'),
                  ),
                  title: TextField(
                    focusNode: focusNodes[index],
                    decoration: CustomInputDecoration.inputDecoration(
                      context: context,
                      hintText: 'Enter ingredient / slide left to delete',
                    ),
                    onChanged: (value) {
                      ingredients[index] = value;
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
