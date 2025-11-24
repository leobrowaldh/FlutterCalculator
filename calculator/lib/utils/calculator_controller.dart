class CalculatorController {
  String _display = '';

  String get display => _display;

  void onButtonPressed(String label) {
    if (label == 'C') {
      _display = '';
    } else if (label == '⌫') {
      if (_display.isNotEmpty) {
        _display = _display.substring(0, _display.length - 1);
      }
    } else if (label == '=') {
      _display = _evaluateExpression(_display);
    } else {
      _display += label;
    }
  }

  String _evaluateExpression(String expr) {
    try {
      final operators = ['+', '-', '*', '/'];
      int count = 0;
      for (var op in operators) {
        count += expr.split(op).length - 1;
      }
      if (count > 1) {
        return 'unsupported';
      }

      double result;

      if (expr.contains('+')) {
        final parts = expr.split('+');
        result = double.parse(parts[0]) + double.parse(parts[1]);
      } else if (expr.contains('-')) {
        final parts = expr.split('-');
        result = double.parse(parts[0]) - double.parse(parts[1]);
      } else if (expr.contains('*')) {
        final parts = expr.split('*');
        result = double.parse(parts[0]) * double.parse(parts[1]);
      } else if (expr.contains('/')) {
        final parts = expr.split('/');
        if (parts[1] == '0') {
          return 'undefined';
        }
        result = double.parse(parts[0]) / double.parse(parts[1]);
      } else {
        return expr;
      }

      return result.toStringAsFixed(
        result.truncateToDouble() == result ? 0 : 6,
      );
    } catch (e) {
      return 'error';
    }
  }
}
