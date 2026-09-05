import 'package:flutter_test/flutter_test.dart';
import 'package:portfoli/main.dart';

void main() {
  testWidgets('Portfolio loads smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PortfolioApp());

    // Verify portfolio renders developer name
    expect(find.text('Prince Kumar'), findsWidgets);
  });
}
