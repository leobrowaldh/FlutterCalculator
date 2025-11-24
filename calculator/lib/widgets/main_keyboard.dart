import 'package:flutter/material.dart';
import 'package:calculator/widgets/calculator_button.dart';

class MainKeyboard extends StatelessWidget {
  final void Function(String) onPressed;
  const MainKeyboard({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final labels = const [
      '7',
      '8',
      '9',
      '/',
      '4',
      '5',
      '6',
      '*',
      '1',
      '2',
      '3',
      '-',
      '.',
      '0',
      '⌫',
      '+',
    ];

    const crossAxisCount = 4;
    final rows = (labels.length / crossAxisCount).ceil();

    return LayoutBuilder(
      builder: (context, constraints) {
        // Compute cell aspect ratio (width / height) based on available space
        final cellWidth = constraints.maxWidth / crossAxisCount;
        final cellHeight = constraints.maxHeight / rows;
        final aspectRatio = cellWidth / cellHeight;

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: labels.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: aspectRatio,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          itemBuilder: (context, index) {
            final label = labels[index];
            return CalculatorButton(
              label: label,
              onPressed: () => onPressed(label),
            );
          },
        );
      },
    );
  }
}
