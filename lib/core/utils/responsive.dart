import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1440;

  static double contentWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > 1440) return 1300;
    if (width > 1024) return 1000;
    if (width > 600) return width * 0.9;
    return width * 0.92;
  }
}
