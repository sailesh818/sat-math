
import 'package:flutter/material.dart';

class PracticePage extends StatelessWidget {
  final String topic;
  final String level;

  PracticePage({required this.topic, required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$topic - $level'),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: Text(
          'This is the $level practice for $topic.',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
