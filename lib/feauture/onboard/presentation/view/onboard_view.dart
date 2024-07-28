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
            return _buildBody(provider, child);
          } else {
            return _buildLoading();
          }
        },
        child: _buildPageIndicatorAndButtons(),
      ),
    );
  }

  Widget _buildBody(OnboardViewModel provider, Widget? child) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: OnBoardPageWidget(
            key: ValueKey<int>(currentPage),
            title: provider.onBoardDatas?[currentPage]?.title,
            description: provider.onBoardDatas?[currentPage]?.description,
            imagePath: provider.onBoardDatas?[currentPage]?.imagePath,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Column(
            children: [
              SizedBox(
                height: context.dynamicHeight(0.05),
              ),
              Padding(
                padding: context.paddingHorizRightMedium,
                child: GestureDetector(
                  onTap: navigateToLoginView,
                  child: Container(
                    height: context.dynamicHeight(0.04),
                    width: context.dynamicWidht(0.2),
                    decoration: BoxDecoration(
                      borderRadius: context.borderRadiusAllLow,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline,
                      ),
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
                          padding: context.paddingAllLow,
                          child: Text(
                            StringConstants.skip,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: context.paddingVertBottomMedium,
            child: child,
          ),
        ),
      ],
    );
  }

  Widget _buildFailure(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      navigateToLoginView();
    });
    return const Center(
      child: CircularProgressIndicator(
        strokeAlign: 3,
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

  Padding _buildPageIndicatorAndButtons() {
    return Padding(
      padding: context.paddingAllMedium,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: context.paddingAllMedium,
            child: _buildPageButton(
              onTap: () {
                previousPageButton();
              },
              assetPath: ImageEnums.leftButton.toPathPng,
            ),
          ),
          const Spacer(),
          ...List.generate(
            3,
            (index) => Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: (currentPage == index)
                      ? Theme.of(context).colorScheme.outline
                      : Colors.transparent,
                ),
              ),
              child: Padding(
                padding: context.paddingAllXLow,
                child: Container(
                  height: context.dynamicWidht(0.036),
                  width: context.dynamicWidht(0.036),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.outline,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: context.paddingAllMedium,
            child: _buildPageButton(
              onTap: () {
                nextPageButton();
              },
              assetPath: ImageEnums.rightButton.toPathPng,
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildPageButton({
    required VoidCallback onTap,
    required String assetPath,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        assetPath,
        height: context.dynamicHeight(0.05),
        fit: BoxFit.cover,
      ),
    );
  }
}
