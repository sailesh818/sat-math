import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise3 extends StatefulWidget {
  const CoordinateGeometryEasyPractise3({super.key});

  @override
  State<CoordinateGeometryEasyPractise3> createState() =>
      _CoordinateGeometryEasyPractise3State();
}

class _CoordinateGeometryEasyPractise3State
    extends State<CoordinateGeometryEasyPractise3> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. What is the equation of a line that passes through (2, 3) with a slope of 2?',
      'options': [
        'y = 2x + 3',
        'y = 2x − 1',
        'y = 2x − 4',
        'y = 2x + 1'
      ],
      'correctIndex': 3,
      'explanation':
          'Equation form: y − y₁ = m(x − x₁) → y − 3 = 2(x − 2) → y = 2x − 1.'
    },
    {
      'question':
          '2. What is the x-intercept of the line 2x + 3y = 6?',
      'options': ['2', '3', '4', '6'],
      'correctIndex': 0,
      'explanation':
          'Set y = 0 → 2x = 6 → x = 3. So x-intercept = 3.'
    },
    {
      'question':
          '3. Find the y-intercept of the line 4x + 2y = 8.',
      'options': ['(0, 2)', '(0, 3)', '(0, 4)', '(0, 5)'],
      'correctIndex': 0,
      'explanation':
          'Set x = 0 → 2y = 8 → y = 4. So intercept is (0, 4).'
    },
    {
      'question':
          '4. Which of the following lines is parallel to y = 3x + 1?',
      'options': [
        'y = −3x + 4',
        'y = 3x − 2',
        'y = 2x + 3',
        'y = x + 3'
      ],
      'correctIndex': 1,
      'explanation':
          'Parallel lines have equal slopes. So slope = 3 → y = 3x − 2 is correct.'
    },
    {
      'question':
          '5. Find the slope of a line perpendicular to y = −½x + 6.',
      'options': ['½', '−½', '2', '−2'],
      'correctIndex': 2,
      'explanation':
          'Perpendicular slope = negative reciprocal of −½ = 2.'
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
          content: const Text('You have finished all Coordinate Geometry Easy 3 questions!'),
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
          'Coordinate Geometry - Easy Practise 3',
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
            // Question Card
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
