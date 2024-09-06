import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/product/constants/custom_shadows.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui';

class ShareRecipeLoadingWidget extends StatelessWidget {
  const ShareRecipeLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.paddingAllLarge,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: context.dynamicWidht(0.95),
                  height: context.dynamicHeight(0.4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .surface
                          .withOpacity(0.3),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/animations/food.json',
                  width: context.dynamicWidht(0.5),
                  height: context.dynamicWidht(0.5),
                  fit: BoxFit.fill,
                ),
                SizedBox(height: context.dynamicHeight(0.02)),
                Text(
                  'Tarifiniz paylaşılıyor,\nlütfen bekleyiniz...',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.surface,
                          fontWeight: FontWeight.w600,
                          shadows: CustomShadows.customLowShadow(),
                        ),
                  ),
                ),
                SizedBox(height: context.dynamicHeight(0.02)),
                Padding(
                  padding: context.paddingAllLow,
                  child: LinearProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    minHeight: 5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
