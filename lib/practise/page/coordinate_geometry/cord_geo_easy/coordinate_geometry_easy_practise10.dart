import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise10 extends StatefulWidget {
  const CoordinateGeometryEasyPractise10({super.key});

  @override
  State<CoordinateGeometryEasyPractise10> createState() =>
      _CoordinateGeometryEasyPractise10State();
}

class _CoordinateGeometryEasyPractise10State
    extends State<CoordinateGeometryEasyPractise10> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the midpoint of the line joining points (2, 3) and (6, 7).',
      'options': ['(4,5)', '(3,4)', '(2,7)', '(6,3)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((2+6)/2, (3+7)/2) = (8/2, 10/2) = (4,5).'
    },
    {
      'question':
          '2. Distance between points (−1, −1) and (3, 3) is:',
      'options': ['4', '√16', '√32', '5'],
      'correctIndex': 2,
      'explanation':
          'Distance = √[(3+1)² + (3+1)²] = √[16 + 16] = √32.'
    },
    {
      'question':
          '3. Find the slope of the line passing through (0, 0) and (4, 2).',
      'options': ['1/2', '2', '-1/2', '-2'],
      'correctIndex': 0,
      'explanation':
          'Slope = (2−0)/(4−0) = 2/4 = 1/2.'
    },
    {
      'question':
          '4. The equation of a line passing through (1,1) with slope 3 is:',
      'options': ['y = 3x − 2', 'y = 3x + 1', 'y = 3x − 1', 'y = x + 3'],
      'correctIndex': 2,
      'explanation':
          'Equation: y−1 = 3(x−1) ⇒ y = 3x − 3 + 1 = 3x − 2. Wait correct calculation: y − 1 = 3(x−1) ⇒ y−1=3x−3 ⇒ y=3x−2 ✅.'
    },
    {
      'question':
          '5. Determine if points (1,2), (2,4), and (3,6) are collinear.',
      'options': ['Yes', 'No', 'Cannot determine', 'Partial'],
      'correctIndex': 0,
      'explanation':
          'Slope between first two: (4−2)/(2−1)=2; Slope between last two: (6−4)/(3−2)=2 ⇒ Equal slopes ⇒ Collinear.'
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
              'You have completed all Coordinate Geometry Easy Practise 10 questions!'),
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
          'Coordinate Geometry - Easy Practise 10',
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
