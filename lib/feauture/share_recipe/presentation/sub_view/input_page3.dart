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
        SizedBox(
          height: context.dynamicHeight(0.8),
          child: Padding(
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
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
                    itemCount: ingredientInputs.length,
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
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              foregroundColor:
                                  Theme.of(context).colorScheme.primary,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    shadows: CustomShadows.customLowShadow(),
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                  ),
                            ),
                          ),
                          title: TextField(
                            focusNode: ingredientInputs[index].focusNode,
                            controller: ingredientInputs[index].controller,
                            keyboardType: TextInputType.text,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.surface,
                                  fontWeight: FontWeight.bold,
                                  shadows: CustomShadows.customLowShadow(),
                                ),
                            decoration: CustomInputDecoration.inputDecoration(
                              context: context,
                              hintText:
                                  'Enter ingredient / slide left to delete',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
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
                    onPressed: previousPage,
                  ),
                  CustomButtonWidget(
                    context: context,
                    text: 'NEXT',
                    onPressed: nextPage,
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
