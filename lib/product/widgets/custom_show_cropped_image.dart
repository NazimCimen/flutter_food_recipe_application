import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';

class CustomShowCroppedImageWidget extends StatelessWidget {
  const CustomShowCroppedImageWidget({
    required this.imageFile,
    super.key,
  });
  final File imageFile;

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
