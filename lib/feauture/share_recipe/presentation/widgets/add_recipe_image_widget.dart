import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';

class AddRecipeImageWidget extends StatelessWidget {
  final File? imageFile;
  const AddRecipeImageWidget({
    required this.imageFile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: context.dynamicWidht(0.8),
        width: context.dynamicWidht(0.8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: context.borderRadiusAllMedium,
        ),
        child: Stack(
          children: [
            Center(
              child: imageFile != null
                  ? ClipRRect(
                      borderRadius: context.borderRadiusAllMedium,
                      child: Image.file(
                        imageFile!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageEnums.sharePostImage.toPathPng,
                          height: context.dynamicWidht(0.2),
                        ),
                        SizedBox(height: context.dynamicHeight(0.02)),
                        Text(
                          'Add Cover Photo\n(up to 12 Mb)',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onTertiary,
                              ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
