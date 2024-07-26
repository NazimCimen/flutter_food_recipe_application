import 'package:flutter_food_recipe_application/core/utils/app_border_radius_extensions.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter/material.dart';

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
            return _buildFailure(context);
          } else if (provider.onBoardDatas != null) {
            return _buildPageView(provider, child);
          } else {
            return _buildLoading();
          }
        },
        child: _buildPageIndicator(),
      ),
    );
  }

  Center _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(
        strokeAlign: 3,
      ),
    );
  }

  PageView _buildPageView(OnboardViewModel provider, Widget? child) {
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
                      height: context.dynamicHeight(0.05),
                    ),
                    Padding(
                      padding: context.paddingHorizRightMedium,
                      child: Container(
                        height: context.dynamicHeight(0.04),
                        width: context.dynamicWidht(0.2),
                        decoration: BoxDecoration(
                          borderRadius: context.borderRadiusAllLow,
                          border: Border.all(
                              color: Theme.of(context).colorScheme.outline),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                            child: FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              StringConstants.skip,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                    padding: context.paddingVertBottomMedium, child: child),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildFailure(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      //  Navigator.of(context).pushReplacementNamed('/login');
    });
    return const Center(
      child: CircularProgressIndicator(
        strokeAlign: 3,
      ),
    );
  }

  Padding _buildPageIndicator() {
    return Padding(
      padding: context.paddingAllMedium,
      child: SmoothPageIndicator(
        controller: pageController,
        count: 3,
        effect: ScrollingDotsEffect(
          activeDotColor: Theme.of(context).colorScheme.outline,
          dotColor: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}
