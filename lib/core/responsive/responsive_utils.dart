import 'package:flutter/material.dart';

class ResponsiveUtils {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > desktopBreakpoint;

  static double contentWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > desktopBreakpoint) return 1300;
    if (width > tabletBreakpoint) return 1000;
    if (width > mobileBreakpoint) return width * 0.9;
    return width * 0.92;
  }
}
