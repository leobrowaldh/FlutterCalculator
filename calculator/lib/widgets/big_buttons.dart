import 'package:calculator/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

class BigButtons extends StatelessWidget {
  final void Function(String) onPressed;
  const BigButtons({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox.expand(
            child: CalculatorButton(
              label: 'C',
              onPressed: () => onPressed('C'),
            ),
          ),
        ),
        Expanded(
          child: SizedBox.expand(
            child: CalculatorButton(
              label: '=',
              onPressed: () => onPressed('='),
            ),
          ),
        ),
      ],
    );
  }
}
