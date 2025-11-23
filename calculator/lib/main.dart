import 'package:calculator/widgets/calculator_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator App'), centerTitle: true),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600; // breakpoint

            if (isMobile) {
              // 📱 Mobile: full screen
              return SizedBox.expand(child: CalculatorWidget());
            } else {
              // 💻 Desktop: centered with padding
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 400, // fixed width for calculator
                    maxHeight: 600, // optional vertical limit
                  ),
                  child: CalculatorWidget(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
