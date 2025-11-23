import 'package:calculator/widgets/big_buttons.dart';
import 'package:calculator/widgets/display.dart';
import 'package:calculator/widgets/main_keyboard.dart';
import 'package:flutter/material.dart';

class CalculatorWidget extends StatelessWidget {
  const CalculatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 1, child: Display()),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: const [
                Expanded(flex: 3, child: MainKeyboard()),
                Expanded(flex: 1, child: BigButtons()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
