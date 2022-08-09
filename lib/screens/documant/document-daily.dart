import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DocumentDaily extends StatefulWidget {
  const DocumentDaily({Key? key}) : super(key: key);

  @override
  State<DocumentDaily> createState() => _DocumentDailyState();
}

class _DocumentDailyState extends State<DocumentDaily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Daily'),
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
