import 'package:flutter_test/flutter_test.dart';
import 'package:portfoli/core/utils/validators.dart';

void main() {
  group('Validators Tests', () {
    test('isValidEmail returns false for empty email', () {
      expect(Validators.isValidEmail(''), false);
    });

    test('isValidEmail returns false for invalid email format', () {
      expect(Validators.isValidEmail('invalid-email'), false);
      expect(Validators.isValidEmail('test@domain'), false);
    });

    test('isValidEmail returns true for valid email format', () {
      expect(Validators.isValidEmail('developer@example.com'), true);
    });

    test('isValidName returns false for short names', () {
      expect(Validators.isValidName('a'), false);
      expect(Validators.isValidName(''), false);
    });

    test('isValidName returns true for valid names', () {
      expect(Validators.isValidName('John Doe'), true);
    });

    test('isValidMessage returns false for short messages', () {
      expect(Validators.isValidMessage('Hi'), false);
    });

    test('isValidMessage returns true for valid messages', () {
      expect(Validators.isValidMessage('Hello, let us build an app.'), true);
    });

    test('isValidUrl validates urls and placeholders correctly', () {
      expect(Validators.isValidUrl('[GITHUB URL]'), true);
      expect(Validators.isValidUrl('https://github.com'), true);
      expect(Validators.isValidUrl('invalid-url'), false);
    });
  });
}
