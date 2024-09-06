import 'package:flutter_food_recipe_application/feauture/share_recipe/share_recipe_export.dart';
import 'package:flutter/material.dart';

part '../sub_view/custom_bars.dart';
part '../sub_view/input_page1.dart';
part '../sub_view/input_page2.dart';
part '../sub_view/input_page3.dart';
part '../sub_view/input_page4.dart';

class ShareRecipeView extends StatefulWidget {
  const ShareRecipeView({super.key});

  @override
  State<ShareRecipeView> createState() => _ShareRecipeViewState();
}

class _ShareRecipeViewState extends State<ShareRecipeView>
    with ShareRecipeViewMixin {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          onPopInvoked();
        }
      },
      child: AbsorbPointer(
        absorbing:
            context.watch<ShareRecipeViewModel>().state == ViewState.loading,
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
          ),
        ),
      ),
    );
  }
}
