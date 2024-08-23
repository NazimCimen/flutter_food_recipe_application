import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/mixin/share_recipe_view_mixin.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/viewmodel/share_recipe_view_model.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/widgets/add_recipe_image_widget.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/widgets/cooking_duration_widget.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/widgets/cooking_type_widget.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/widgets/custom_input_field_widget.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/widgets/ingredient_input_widget.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/widgets/recipe_step_input_widget.dart';
import 'package:flutter_food_recipe_application/product/constants/recipe_constants.dart';
import 'package:image_picker/image_picker.dart';

part '../sub_view/share_recipe_sub_view.dart';

/// camera gallery permission !!!!!
class ShareRecipeView extends StatefulWidget {
  const ShareRecipeView({super.key});

  @override
  State<ShareRecipeView> createState() => _ShareRecipeViewState();
}

class _ShareRecipeViewState extends State<ShareRecipeView>
    with ShareRecipeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _CustomAppBar(
        currentPage: context.watch<ShareRecipeViewModel>().currentPage + 1,
        totalPage: context.read<ShareRecipeViewModel>().totalPage,
      ),
      bottomNavigationBar: _CustomBottomNavigationBar(
        currentPage: context.watch<ShareRecipeViewModel>().currentPage,
        totalPages: context.read<ShareRecipeViewModel>().totalPage,
        pageController: pageController,
      ),
      body: SafeArea(
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            context.read<ShareRecipeViewModel>().onPageChanged(value);
          },
          children: [
            _InputPage1(
              recipeNameController: recipeNameController,
              recipeDescriptionController: recipeDescriptionController,
            ),
            _InputPage2(
              cookingTypeController: cookingTypeController,
              worldKitchenController: worldKitchenController,
            ),
            _InputPage3(),
            _InputPage4(),
          ],
        ),
      ),
    );
  }
}
