part of '../view/share_recipe_view.dart';

class _InputPage1 extends StatelessWidget {
  final TextEditingController recipeNameController;
  final TextEditingController recipeDescriptionController;

  const _InputPage1({
    required this.recipeDescriptionController,
    required this.recipeNameController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.paddingHorizAllLarge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.dynamicHeight(0.02)),
          Consumer<ShareRecipeViewModel>(
            builder: (context, provider, child) {
              return GestureDetector(
                onTap: () async {
                  await Future.wait([
                    provider.getRecipeImage(source: ImageSource.gallery),
                    provider.cropRecipeImage()
                  ]);
                },
                child: AddRecipeImageWidget(
                  imageFile: provider.croppedImage,
                ),
              );
            },
          ),
          SizedBox(height: context.dynamicHeight(0.035)),
          CustomInputField(
            hintText: 'Food Name',
            maxLines: 1,
            controller: recipeNameController,
          ),
          SizedBox(height: context.dynamicHeight(0.035)),
          CustomInputField(
            hintText: 'Description',
            maxLines: 4,
            controller: recipeDescriptionController,
          ),
          SizedBox(height: context.dynamicHeight(0.035)),
        ],
      ),
    );
  }
}

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

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentPage;
  final int totalPage;
  const _CustomAppBar({
    required this.currentPage,
    required this.totalPage,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close_outlined,
            ),
          ),
          TextButton(
            child: Text(
              '$currentPage / $totalPage',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomBottomNavigationBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final PageController pageController;

  const _CustomBottomNavigationBar({
    required this.currentPage,
    required this.totalPages,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllMedium,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentPage != 0)
            _bottomButton(
              context: context,
              onPressed: () {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linearToEaseOut,
                );
              },
              text: 'BACK',
            ),
          const Spacer(),
          if (currentPage + 1 < totalPages)
            _bottomButton(
              context: context,
              onPressed: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linearToEaseOut,
                );
              },
              text: 'NEXT',
            ),
          if (currentPage + 1 == totalPages)
            _bottomButton(
              context: context,
              onPressed: () async {
                await context.read<ShareRecipeViewModel>().shareRecipe(
                      recipeTitle: 'recipeTitle',
                      recipeDescription: 'recipeDescription',
                      worldKitchen: 'worldKitchen',
                      cookingType: 'cookingType',
                    );
              },
              text: 'SHARE',
            ),
        ],
      ),
    );
  }

  ElevatedButton _bottomButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        shape: ContinuousRectangleBorder(
          borderRadius: context.borderRadiusAllMedium,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}
