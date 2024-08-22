import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/product/decorations/input_decorations/custom_input_decoration.dart';

/// FIX DO NOT STATEFUL
class RecipeStepInputWidget extends StatefulWidget {
  const RecipeStepInputWidget({super.key});

  @override
  RecipeStepInputWidgetState createState() => RecipeStepInputWidgetState();
}

class RecipeStepInputWidgetState extends State<RecipeStepInputWidget> {
  List<String> steps = [''];
  List<FocusNode> focusNodes = [FocusNode()];

  @override
  void dispose() {
    for (final node in focusNodes) {
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
              'Recipe Steps',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                onPressed: () {
                  setState(() {
                    steps.add("");
                    focusNodes.add(FocusNode());

                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      FocusScope.of(context).requestFocus(focusNodes.last);
                    });
                  });
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Step'),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: steps.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Sol kısımda numara ve sürükleme ikonu
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              child: Text('${index + 1}'),
                            ),
                            Icon(Icons.drag_handle),
                          ],
                        ),
                        SizedBox(width: 10),
                        // Adım açıklaması TextField
                        Expanded(
                          child: TextField(
                            focusNode: focusNodes[index],
                            decoration: CustomInputDecoration.inputDecoration(
                              context: context,
                              hintText: 'Tell a little about your food',
                            ),
                            onChanged: (value) {
                              setState(() {
                                steps[index] = value;
                              });
                            },
                            controller:
                                TextEditingController(text: steps[index]),
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Kamera ikonu olan kutu
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200],
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.camera_alt, color: Colors.grey),
                          onPressed: () {
                            // Kamera işlemi buraya
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
