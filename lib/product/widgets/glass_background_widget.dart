import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBackgroundWidget extends StatelessWidget {
  final Widget theChild;
  final double theWidht;
  final double theHeight;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  const GlassBackgroundWidget({
    required this.theChild,
    required this.theHeight,
    required this.theWidht,
    this.borderRadius,
    this.border,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: theHeight,
        width: theWidht,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3.0,
                sigmaY: 3.0,
              ),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: border,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.surface.withOpacity(0.15),
                      Theme.of(context).colorScheme.surface.withOpacity(0.05),
                    ]),
              ),
            ),
            Center(child: theChild),
          ],
        ),
      ),
    );
  }
}
