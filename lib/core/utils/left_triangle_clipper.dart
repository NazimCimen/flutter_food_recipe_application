import 'package:flutter/material.dart';

class LeftTriangleClipper extends CustomClipper<Path> {
  final double? triangelRadius;
  LeftTriangleClipper({this.triangelRadius});
  @override
  Path getClip(Size size) {
    double radius = 20;
    triangelRadius != null ? radius = triangelRadius! : radius = 20;
    var path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(radius, size.height / 2 - radius);
    path.quadraticBezierTo(
        0, size.height / 2, radius, size.height / 2 + radius);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
