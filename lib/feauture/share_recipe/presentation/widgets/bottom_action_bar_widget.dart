import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/product/widgets/custom_button_widget.dart';

class BottomActionBar extends StatelessWidget {
  const BottomActionBar({
    required this.previousPagebutton,
    required this.nextOrShareButton,
    required this.previousPageBtnText,
    required this.nextOrShareBtnText,
    super.key,
  });
  final String previousPageBtnText;
  final String nextOrShareBtnText;

  final VoidCallback previousPagebutton;
  final VoidCallback nextOrShareButton;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: context.paddingAllMedium,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonWidget(
                context: context,
                text: previousPageBtnText,
                onPressed: previousPagebutton,
              ),
              CustomButtonWidget(
                context: context,
                text: nextOrShareBtnText,
                onPressed: nextOrShareButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
