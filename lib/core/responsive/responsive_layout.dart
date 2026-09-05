import 'package:flutter/material.dart';
import 'responsive_utils.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < ResponsiveUtils.mobileBreakpoint) {
          return mobile;
        } else if (constraints.maxWidth < ResponsiveUtils.tabletBreakpoint) {
          return tablet ?? desktop;
        } else {
          return desktop;
        }
      },
    );
  }
}
