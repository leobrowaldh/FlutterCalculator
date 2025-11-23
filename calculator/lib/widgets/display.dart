import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.lightGreenAccent,
      child: SizedBox.expand(child: Text('0', style: TextStyle(fontSize: 50))),
    );
  }
}
