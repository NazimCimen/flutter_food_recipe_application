import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/viewmodel/share_recipe_view_model.dart';
import 'package:flutter_food_recipe_application/product/componets/custom_sheets.dart';
import 'package:flutter_food_recipe_application/product/constants/custom_shadows.dart';
import 'package:flutter_food_recipe_application/product/constants/image_aspect_ratio.dart';
import 'package:flutter_food_recipe_application/product/decorations/box_decorations/custom_box_decoration.dart';
import 'package:flutter_food_recipe_application/product/widgets/custom_title_text_shadow_widget.dart';
import 'package:image_picker/image_picker.dart';

class AddRecipeImageWidget extends StatelessWidget {
  const AddRecipeImageWidget({super.key});

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
                  return const _LoadingIndicator();
                } else if (viewModel.croppedImage != null) {
                  return _CroppedImage(imageFile: viewModel.croppedImage!);
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

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class _CroppedImage extends StatelessWidget {
  final File imageFile;

  const _CroppedImage({required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: context.borderRadiusAllMedium,
      child: Image.file(
        imageFile,
        fit: BoxFit.cover,
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
