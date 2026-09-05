import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfoli/core/responsive/responsive_utils.dart';

void main() {
  testWidgets('ResponsiveUtils correctly identifies mobile, tablet, and desktop breakpoints', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(size: Size(500, 800)),
          child: Builder(
            builder: (context) {
              expect(ResponsiveUtils.isMobile(context), true);
              expect(ResponsiveUtils.isTablet(context), false);
              expect(ResponsiveUtils.isDesktop(context), false);
              return const SizedBox();
            },
          ),
        ),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(size: Size(800, 800)),
          child: Builder(
            builder: (context) {
              expect(ResponsiveUtils.isMobile(context), false);
              expect(ResponsiveUtils.isTablet(context), true);
              expect(ResponsiveUtils.isDesktop(context), false);
              return const SizedBox();
            },
          ),
        ),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(size: Size(1200, 800)),
          child: Builder(
            builder: (context) {
              expect(ResponsiveUtils.isMobile(context), false);
              expect(ResponsiveUtils.isTablet(context), false);
              expect(ResponsiveUtils.isDesktop(context), true);
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  });
}
