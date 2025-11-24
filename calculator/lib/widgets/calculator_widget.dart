import 'package:calculator/utils/calculator_controller.dart';
import 'package:calculator/widgets/big_buttons.dart';
import 'package:calculator/widgets/display.dart';
import 'package:calculator/widgets/main_keyboard.dart';
import 'package:flutter/material.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  final controller = CalculatorController();

  void _handleButtonPress(String label) {
    setState(() {
      controller.onButtonPressed(label);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Column(
        children: [
          Expanded(flex: 1, child: Display(text: controller.display)),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: MainKeyboard(onPressed: _handleButtonPress),
                  ),
                  Expanded(
                    flex: 1,
                    child: BigButtons(onPressed: _handleButtonPress),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
