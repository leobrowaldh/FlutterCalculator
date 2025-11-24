import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String text;
  const Display({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.lightGreenAccent,
      child: SizedBox.expand(
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            text.isEmpty ? '0' : text,
            style: const TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
