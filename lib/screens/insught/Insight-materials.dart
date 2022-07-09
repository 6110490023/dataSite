import 'package:flutter/material.dart';

class InsightMaterials extends StatefulWidget {
  const InsightMaterials({Key? key}) : super(key: key);

  @override
  State<InsightMaterials> createState() => _InsightMaterialsState();
}

class _InsightMaterialsState extends State<InsightMaterials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insight Materials'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
