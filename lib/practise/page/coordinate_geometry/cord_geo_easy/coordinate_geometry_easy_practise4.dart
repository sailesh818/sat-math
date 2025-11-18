import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise4 extends StatefulWidget {
  const CoordinateGeometryEasyPractise4({super.key});

  @override
  State<CoordinateGeometryEasyPractise4> createState() =>
      _CoordinateGeometryEasyPractise4State();
}

class _CoordinateGeometryEasyPractise4State
    extends State<CoordinateGeometryEasyPractise4> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the distance between the points (1, 2) and (4, 6).',
      'options': ['5', '6', '7', '4'],
      'correctIndex': 0,
      'explanation':
          'Distance formula = √[(x₂−x₁)² + (y₂−y₁)²] = √[(3)² + (4)²] = 5.'
    },
    {
      'question': '2. Find the midpoint of the line joining (2, 3) and (4, 7).',
      'options': ['(3, 5)', '(2, 4)', '(4, 6)', '(3, 4)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((x₁+x₂)/2, (y₁+y₂)/2) = (3, 5).'
    },
    {
      'question':
          '3. What is the slope of the line joining (1, 2) and (3, 6)?',
      'options': ['1', '2', '3', '4'],
      'correctIndex': 1,
      'explanation': 'Slope = (6−2)/(3−1) = 4/2 = 2.'
    },
    {
      'question':
          '4. If a line passes through (0, 5) and (2, 9), find its equation.',
      'options': [
        'y = 2x + 5',
        'y = 3x + 5',
        'y = 2x + 4',
        'y = 3x − 1'
      ],
      'correctIndex': 0,
      'explanation':
          'Slope = (9−5)/(2−0)=2 → y = 2x + 5.'
    },
    {
      'question':
          '5. What is the distance between points (−2, 1) and (1, 5)?',
      'options': ['3', '4', '5', '6'],
      'correctIndex': 2,
      'explanation':
          'Distance = √[(1−(−2))² + (5−1)²] = √[(3)² + (4)²] = 5.'
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
          title: const Text('🎉 Great Work!'),
          content: const Text(
              'You have finished all Coordinate Geometry Easy Practise 4 questions!'),
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
          'Coordinate Geometry - Easy Practise 4',
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

            // Options List
            ...List.generate(question['options'].length, (index) {
              final option = question['options'][index];
              final isSelected = selectedAnswerIndex == index;
              final isCorrect =
                  answerChecked && index == question['correctIndex'];
              final isWrong =
                  answerChecked && isSelected && !isCorrect;

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
