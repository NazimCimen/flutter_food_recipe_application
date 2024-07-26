import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/core/utils/extensions.dart';

class OnBoardPageWidget extends StatelessWidget {
  final String? pageColor;
  final String? title;
  final String? description;
  final String? imagePath;
  const OnBoardPageWidget({
    required this.pageColor,
    required this.title,
    required this.description,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: pageColor != null ? HexColor.fromHex(pageColor!) : Colors.white,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              //    color: Colors.black.withOpacity(0.5), // Yarı saydam arka plan
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        imagePath ?? 'assets/images/page1',
                        height: context.dynamicHeight(0.3),
                      ),
                    ),
                    SizedBox(
                      height: context.dynamicHeight(0.08),
                    ),
                    Text(
                      textAlign: TextAlign.start,
                      title ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: context.dynamicHeight(0.01),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      description ?? '',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontSize: context.dynamicWidht(0.04)),
                    ),
                  ],
                ),
              ),
            ),

            /*Image.asset(
              'assets/images/3.png',
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),*/
            /*      Padding(
              padding: context.paddingAllLarge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title ?? '',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 2.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                        fontSize: context.dynamicWidht(0.1)),
                  ),
                  Text(
                    description ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 2.0,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    */
          ],
        ));
  }
}
