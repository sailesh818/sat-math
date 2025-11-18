
import 'package:flutter/material.dart';

class DefaultPracticePage extends StatelessWidget {
  final String topic;
  final String level;

  const DefaultPracticePage({super.key, required this.topic, required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$topic - $level")),
      body: Center(
        child: Text(
          "Welcome to $topic ($level Level)!",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}