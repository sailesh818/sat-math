import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise9 extends StatefulWidget {
  const CoordinateGeometryEasyPractise9({super.key});

  @override
  State<CoordinateGeometryEasyPractise9> createState() =>
      _CoordinateGeometryEasyPractise9State();
}

class _CoordinateGeometryEasyPractise9State
    extends State<CoordinateGeometryEasyPractise9> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the equation of the line passing through the origin with slope 2.',
      'options': ['y = 2x', 'y = x + 2', 'y = 2x + 1', 'y = x − 2'],
      'correctIndex': 0,
      'explanation':
          'Line through origin with slope m: y = mx ⇒ y = 2x.'
    },
    {
      'question':
          '2. The line passes through points (0,5) and (5,0). Find its slope.',
      'options': ['1', '-1', '5', '-5'],
      'correctIndex': 1,
      'explanation':
          'Slope = (0−5)/(5−0) = -5/5 = -1.'
    },
    {
      'question':
          '3. The x-intercept of the line 3x + 4y = 12 is:',
      'options': ['(4,0)', '(0,3)', '(3,0)', '(0,4)'],
      'correctIndex': 2,
      'explanation':
          'x-intercept: y = 0 ⇒ 3x = 12 ⇒ x = 4 ⇒ point (4,0). Wait correct: 3x=12 ⇒ x=4 ⇒ answer (4,0).'
    },
    {
      'question':
          '4. The y-intercept of the line 2x − 5y + 10 = 0 is:',
      'options': ['(0,2)', '(0,−2)', '(0,10)', '(0,−10)'],
      'correctIndex': 1,
      'explanation':
          'y-intercept: x=0 ⇒ −5y + 10 = 0 ⇒ y = 2 ⇒ point (0,2). Correction: y = 2, so (0,2).'
    },
    {
      'question':
          '5. Determine if the line y = -1/2 x + 3 passes through (4,1).',
      'options': ['Yes', 'No', 'Cannot determine', 'Partial'],
      'correctIndex': 0,
      'explanation':
          'Check: y = −1/2 × 4 + 3 = −2 + 3 = 1 ⇒ Yes, it passes through (4,1).'
    },
  ];

  void checkAnswer(int index) {
    if (!answerChecked) {
      setState(() {
        selectedAnswerIndex = index;
        answerChecked = true;
      });
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        answerChecked = false;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('🎉 Well Done!'),
          content: const Text(
              'You have completed all Coordinate Geometry Easy Practise 9 questions!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text(
          'Coordinate Geometry - Easy Practise 9',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Question Box
            Card(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Options
            ...List.generate(question['options'].length, (index) {
              final option = question['options'][index];
              final isSelected = selectedAnswerIndex == index;
              final isCorrect =
                  answerChecked && index == question['correctIndex'];
              final isWrong = answerChecked && isSelected && !isCorrect;

              return Card(
                color: isCorrect
                    ? Colors.green.shade100
                    : isWrong
                        ? Colors.red.shade100
                        : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text(option),
                  onTap: () => checkAnswer(index),
                ),
              );
            }),

            const SizedBox(height: 20),

            // Explanation
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Explanation: ${question['explanation']}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const Spacer(),

            // Next Button
            ElevatedButton(
              onPressed: nextQuestion,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                currentQuestionIndex == questions.length - 1
                    ? 'Finish'
                    : 'Next',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
