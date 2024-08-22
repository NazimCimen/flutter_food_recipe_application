import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_post/presentation/mixin/share_post_view_mixin.dart';
import 'package:flutter_food_recipe_application/feauture/share_post/presentation/viewmodel/share_post_view_model.dart';
import 'package:flutter_food_recipe_application/feauture/share_post/presentation/widgets/add_recipe_image_widget.dart';
import 'package:flutter_food_recipe_application/feauture/share_post/presentation/widgets/cooking_duration_widget.dart';
import 'package:flutter_food_recipe_application/feauture/share_post/presentation/widgets/cooking_type_widget.dart';
import 'package:flutter_food_recipe_application/feauture/share_post/presentation/widgets/custom_input_field_widget.dart';
import 'package:flutter_food_recipe_application/feauture/share_post/presentation/widgets/ingredient_input_widget.dart';
import 'package:flutter_food_recipe_application/feauture/share_post/presentation/widgets/recipe_step_input_widget.dart';
import 'package:flutter_food_recipe_application/product/constants/recipe_constants.dart';
import 'package:image_picker/image_picker.dart';

part 'share_post_sub_view.dart';

/// camera gallery permission !!!!!
class SharePostView extends StatefulWidget {
  const SharePostView({super.key});

  @override
  State<SharePostView> createState() => _SharePostViewState();
}

class _SharePostViewState extends State<SharePostView> with SharePostViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _CustomAppBar(),
      bottomNavigationBar: _CustomBottomNavigationBar(
        currentPage: currentPage,
        totalPages: totalPages,
        pageController: pageController,
      ),
      body: SafeArea(
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          children: [
            _InputPage1(
              recipeNameController: recipeNameController,
              recipeDescriptionController: recipeDescriptionController,
            ),
            _InputPage2(),
            _InputPage3(),
          ],
        ),
      ),
    );
  }
}
