import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/core/utils/extensions.dart';
import 'package:flutter_food_recipe_application/core/utils/left_triangle_clipper.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/presentation/mixin/onboard_mixin.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/presentation/viewmodel/onboard_view_model.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/presentation/widgets/left_triangle_widget.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/presentation/widgets/onboard_page_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> with OnBoardMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnboardViewModel>(
        builder: (context, provider, child) {
          if (provider.failure != null) {
            return Text('data');
          } else if (provider.onBoardDatas != null) {
            return PageView.builder(
              itemCount: provider.onBoardDatas?.length,
              controller: pageController,
              itemBuilder: (context, index) {
                if (provider.onBoardDatas != null) {
                  return Stack(
                    children: [
                      OnBoardPageWidget(
                        pageColor: provider.onBoardDatas?[index]?.color,
                        title: provider.onBoardDatas?[index]?.title,
                        description: provider.onBoardDatas?[index]?.description,
                        imagePath: provider.onBoardDatas?[index]?.imagePath,
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: LeftTriangelWidget(
                            butonColor: provider.onBoardDatas?[index]?.color,
                            onPressed: () {
                              nextPageButton(index);
                            },
                            height: context.dynamicHeight(0.25),
                            widht: context.dynamicWidht(0.28),
                          )),
                      Align(
                          alignment: Alignment.topRight,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Padding(
                                padding: context.paddingHorizRightMedium,
                                child: Container(
                                  height: 34,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      border: Border.all(color: Colors.white)),
                                  child: Center(
                                      child: Text(
                                    'skip',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )),
                                ),
                              ),
                            ],
                          )),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: context.paddingVertBottomMedium,
                            child: SmoothPageIndicator(
                              controller: pageController, // PageController
                              count: provider.onBoardDatas?.length ?? 0,
                              axisDirection: Axis.horizontal,
                              effect: ScrollingDotsEffect(
                                fixedCenter: true,

                                dotColor: Colors.white,
                                activeDotColor: Colors.white,
                                //     activeStrokeWidth: 2,
                              ),
                            ),
                          )),
                    ],
                  );
                }
              },
            );
          } else {
            return CircularProgressIndicator(
              color: Colors.black,
            );
          }
        },
        child: Center(
          child: Text('data'),
        ),
      ),
    );
  }
}
