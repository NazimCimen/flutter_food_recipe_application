part of '../view/share_recipe_view.dart';

class InputPage3 extends StatefulWidget {
  const InputPage3({super.key});

  @override
  State<InputPage3> createState() => _InputPage3State();
}

class _InputPage3State extends State<InputPage3> with InputPage3Mixin {
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
              Padding(
                padding: context.paddingAllLow,
                child: TextButton.icon(
                  onPressed: addIngredientField,
                  icon: Icon(
                    Icons.add,
                    shadows: CustomShadows.customLowShadow(),
                  ),
                  label: Text(
                    'Ingredient',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          shadows: CustomShadows.customLowShadow(),
                        ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount:
                  context.read<ShareRecipeViewModel>().ingredients.length,
              itemBuilder: (context, index) {
                return Slidable(
                  key: const ValueKey(0),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          deleteIngredientField(context, index);
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
                      child: Text(
                        '${index + 1}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            shadows: CustomShadows.customLowShadow(),
                            color: Theme.of(context).colorScheme.surface),
                      ),
                    ),
                    title: TextField(
                      focusNode: focusNodes[index],
                      decoration: CustomInputDecoration.inputDecoration(
                        context: context,
                        hintText: 'Enter ingredient / slide left to delete',
                      ),
                      onChanged: (value) {
                        context
                            .read<ShareRecipeViewModel>()
                            .ingredients[index] = value;
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
