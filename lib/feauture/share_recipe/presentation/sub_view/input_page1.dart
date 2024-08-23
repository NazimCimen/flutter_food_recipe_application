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
                  await Future.wait(
                    [
                      provider.getRecipeImage(source: ImageSource.gallery),
                      provider.cropRecipeImage(),
                    ],
                  );
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
