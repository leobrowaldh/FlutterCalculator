import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/utils/calculator_controller.dart';

void main() {
  group('CalculatorController', () {
    test('addition 4+5 => 9', () {
      final c = CalculatorController();
      c.onButtonPressed('4');
      c.onButtonPressed('+');
      c.onButtonPressed('5');
      c.onButtonPressed('=');
      expect(c.display, '9');
    });

    test('division by zero returns undefined', () {
      final c = CalculatorController();
      c.onButtonPressed('4');
      c.onButtonPressed('/');
      c.onButtonPressed('0');
      c.onButtonPressed('=');
      expect(c.display, 'undefined');
    });

    test('multiple operations return unsupported for 4+5+6', () {
      final c = CalculatorController();
      c.onButtonPressed('4');
      c.onButtonPressed('+');
      c.onButtonPressed('5');
      c.onButtonPressed('+');
      c.onButtonPressed('6');
      c.onButtonPressed('=');
      expect(c.display, 'unsupported');
    });

    test('malformed ".+" returns error', () {
      final c = CalculatorController();
      c.onButtonPressed('.');
      c.onButtonPressed('+');
      c.onButtonPressed('=');
      expect(c.display, 'error');
    });

    test('trailing operator like 4+ yields error', () {
      final c = CalculatorController();
      c.onButtonPressed('4');
      c.onButtonPressed('+');
      c.onButtonPressed('=');
      expect(c.display, 'error');
    });

    test('decimal addition 2.5+1.25 => 3.750000', () {
      final c = CalculatorController();
      for (final s in ['2', '.', '5', '+', '1', '.', '2', '5', '=']) {
        c.onButtonPressed(s);
      }
      expect(c.display, '3.750000');
    });
  });
}
