part of '../view/share_recipe_view.dart';

//// FIX  IMPORTANT  .. CROPLASAN BİLE ÖLÇEĞİ AZALTINCA IMAGE ALANA SIĞMIYOR.
/////  add crash analatics for image picking and croping...
class InputPage1 extends StatefulWidget {
  const InputPage1({
    required this.pageController,
    super.key,
  });
  final PageController pageController;

  @override
  State<InputPage1> createState() => _InputPage1State();
}

class _InputPage1State extends State<InputPage1> with InputPage1Mixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.dynamicHeight(0.8),
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: page1FormKey,
              child: Padding(
                padding: context.paddingHorizAllLarge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.dynamicHeight(0.02)),
                    const _AddRecipeImageWidget(),
                    SizedBox(height: context.dynamicHeight(0.035)),
                    CustomInputField(
                      hintText: 'Food Name',
                      maxLines: 1,
                      controller: recipeNameController,
                      validator: (value) =>
                          validators.recipeNameValidator(value),
                    ),
                    SizedBox(height: context.dynamicHeight(0.035)),
                    CustomInputField(
                      hintText: 'Description',
                      maxLines: 4,
                      controller: recipeDescriptionController,
                      validator: (value) =>
                          validators.recipeNameValidator(value),
                    ),
                    SizedBox(height: context.dynamicHeight(0.035)),
                  ],
                ),
              ),
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
              child: Align(
                alignment: Alignment.bottomRight,
                child: CustomButtonWidget(
                  context: context,
                  text: 'NEXT',
                  onPressed: nextPage,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AddRecipeImageWidget extends StatelessWidget {
  const _AddRecipeImageWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitleTextShadowWidget(text: 'Recipe Image'),
        SizedBox(height: context.dynamicHeight(0.01)),
        const _RecipeImageContainer(),
      ],
    );
  }
}

class _RecipeImageContainer extends StatelessWidget {
  const _RecipeImageContainer();
  @override
  Widget build(BuildContext context) {
    final provider = context.read<ShareRecipeViewModel>();
    return GestureDetector(
      onTap: () async {
        provider.changeLoading();
        final selectedSource =
            await CustomSheets.showMenuForImage(context: context);
        await provider.getImageSourceAndProcessImage(
          selectedSource: selectedSource,
        );
        provider.changeLoading();
      },
      child: Center(
        child: AspectRatio(
          aspectRatio: ImageAspectRatio.postAspectRatio.ratio,
          child: Container(
            decoration:
                CustomBoxDecoration.customBoxDecorationImageArea(context),
            child: Consumer<ShareRecipeViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const CustomProgressIndicator();
                } else if (viewModel.croppedImage != null) {
                  return CustomShowCroppedImageWidget(
                    imageFile: viewModel.croppedImage!,
                  );
                } else {
                  return const _PlaceholderContent();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaceholderContent extends StatelessWidget {
  const _PlaceholderContent();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImageEnums.sharePostImage.toPathPng,
          width: context.dynamicWidht(0.2),
          color: Theme.of(context).colorScheme.primary,
        ),
        SizedBox(height: context.dynamicHeight(0.02)),
        Text(
          'Add Cover Photo\n(up to 12 Mb)',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.surface,
                fontWeight: FontWeight.w500,
                shadows: CustomShadows.customLowShadow(),
              ),
        ),
      ],
    );
  }
}
