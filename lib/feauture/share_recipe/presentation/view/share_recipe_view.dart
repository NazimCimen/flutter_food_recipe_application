import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/mixin/input_page1_mixin.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/mixin/input_page2_mixin.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/mixin/input_page3_mixin.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/mixin/input_page4_mixin.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/mixin/share_recipe_view_mixin.dart';
import 'package:flutter_food_recipe_application/product/componets/custom_sheets.dart';
import 'package:flutter_food_recipe_application/product/constants/custom_shadows.dart';
import 'package:flutter_food_recipe_application/product/decorations/box_decorations/custom_box_decoration.dart';
import 'package:flutter_food_recipe_application/product/widgets/custom_button_widget.dart';
import 'package:flutter_food_recipe_application/product/widgets/custom_title_text_shadow_widget.dart';
import 'package:flutter_food_recipe_application/product/widgets/glass_background_widget.dart';
import 'package:flutter_food_recipe_application/product/models/recipe_step_input_model.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/viewmodel/share_recipe_view_model.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/widgets/add_recipe_image_widget.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/widgets/cooking_duration_widget.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/widgets/custom_drop_down_menu_widget.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/widgets/custom_input_field_widget.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_step_entity.dart';
import 'package:flutter_food_recipe_application/product/componets/custom_snack_bars.dart';
import 'package:flutter_food_recipe_application/product/constants/image_aspect_ratio.dart';
import 'package:flutter_food_recipe_application/product/constants/recipe_constants.dart';
import 'package:flutter_food_recipe_application/product/decorations/input_decorations/custom_input_decoration.dart';
import 'package:flutter_food_recipe_application/product/widgets/custom_title_text_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

part '../sub_view/custom_bars.dart';
part '../sub_view/input_page1.dart';
part '../sub_view/input_page2.dart';
part '../sub_view/input_page3.dart';
part '../sub_view/input_page4.dart';

//absorb pointer in every page which is necessary
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
    return AbsorbPointer(
        absorbing: context.watch<ShareRecipeViewModel>().isLoading,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: Image.asset(
                    fit: BoxFit.cover,
                    ImageEnums.shareRecipeBack.toPathPng,
                    height: double.infinity,
                  ),
                ),
                GlassBackgroundWidget(
                  theHeight: double.infinity,
                  theWidht: double.infinity,
                  theChild: Column(
                    children: [
                      _CustomAppBar(
                        currentPage: currentPage + 1,
                        totalPage: totalPage,
                      ),
                      Expanded(
                        child: PageView(
                          controller: pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          onPageChanged: onPageChanged,
                          children: [
                            InputPage1(
                              pageController: pageController,
                            ),
                            InputPage2(
                              pageController: pageController,
                            ),
                            InputPage3(
                              pageController: pageController,
                            ),
                            InputPage4(
                              pageController: pageController,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
