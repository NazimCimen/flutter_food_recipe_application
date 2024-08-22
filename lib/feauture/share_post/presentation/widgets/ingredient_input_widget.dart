import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/product/decorations/input_decorations/custom_input_decoration.dart';

/// FIX DO NOT STATEFUL
class IngredientInput extends StatefulWidget {
  const IngredientInput({super.key});

  @override
  _IngredientInputState createState() => _IngredientInputState();
}

class _IngredientInputState extends State<IngredientInput> {
  List<String> ingredients = [""];
  List<FocusNode> focusNodes = [FocusNode()];

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  setState(() {
                    ingredients.add("");
                    focusNodes.add(FocusNode());
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      FocusScope.of(context).requestFocus(focusNodes.last);
                    });
                  });
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
              return ListTile(
                leading: const Icon(Icons.adjust_sharp, color: Colors.grey),
                title: TextField(
                  focusNode: focusNodes[index],
                  decoration: CustomInputDecoration.inputDecoration(
                    context: context,
                    hintText: 'Enter ingredient',
                  ),
                  onChanged: (value) {
                    setState(() {
                      ingredients[index] = value;
                    });
                  },
                  controller: TextEditingController(text: ingredients[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
