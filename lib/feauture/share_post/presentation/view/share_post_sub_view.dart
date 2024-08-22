part of 'share_post_view.dart';

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
          Consumer<SharePostViewModel>(
            builder: (context, provider, child) {
              return GestureDetector(
                onTap: () async {
                  await provider.getRecipeImage(source: ImageSource.camera);
                  await provider.cropRecipeImage();
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
          Selector<SharePostViewModel, double>(
            selector: (_, viewModel) => viewModel.cookingDuration,
            builder: (context, cookingDuration, child) {
              return CookingDurationWidget(
                sliderValue: cookingDuration,
                onSliderChanged: (value) {
                  context.read<SharePostViewModel>().setCookingDuration(value);
                },
              );
            },
          ),
          SizedBox(height: context.dynamicHeight(0.035)),
          CookingTypeWidget(
            controller: TextEditingController(),
            dropBoxList: RecipeConstants.cookingTypeDropList,
            labelText: 'choose a cooking type',
          ),
          SizedBox(height: context.dynamicHeight(0.035)),
        ],
      ),
    );
  }
}

class _InputPage2 extends StatelessWidget {
  const _InputPage2();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizAllLarge,
      child: const IngredientInput(),
    );
  }
}

class _InputPage3 extends StatelessWidget {
  const _InputPage3();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizAllLarge,
      child: RecipeStepInputWidget(),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.close_outlined,
          ),
          TextButton(
            child: Text(
              'Share',
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
          if (currentPage > 0)
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
          Text(
            '${currentPage + 1} / $totalPages',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (currentPage < totalPages - 1)
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
