import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise8 extends StatefulWidget {
  const CoordinateGeometryEasyPractise8({super.key});

  @override
  State<CoordinateGeometryEasyPractise8> createState() =>
      _CoordinateGeometryEasyPractise8State();
}

class _CoordinateGeometryEasyPractise8State
    extends State<CoordinateGeometryEasyPractise8> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the distance between points (1, 2) and (5, 6).',
      'options': ['4', '5', '6', '√32'],
      'correctIndex': 3,
      'explanation':
          'Distance = √[(5−1)² + (6−2)²] = √[16 + 16] = √32.'
    },
    {
      'question':
          '2. The area of triangle with vertices (0,0), (4,0), (0,3) is:',
      'options': ['5', '6', '7', '12'],
      'correctIndex': 1,
      'explanation': 'Area = ½ × base × height = ½ × 4 × 3 = 6.'
    },
    {
      'question':
          '3. Midpoint of line joining (−3, 4) and (5, −2) is:',
      'options': ['(1, 1)', '(0, 1)', '(2, 0)', '(1, −1)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((−3+5)/2, (4+−2)/2) = (2/2, 2/2) = (1,1).'
    },
    {
      'question':
          '4. Check if the points (1,2), (2,3), and (3,5) are collinear.',
      'options': ['Yes', 'No', 'Cannot determine', 'Partial'],
      'correctIndex': 1,
      'explanation':
          'Slope AB = (3−2)/(2−1)=1; Slope BC = (5−3)/(3−2)=2 ⇒ Not equal ⇒ Not collinear.'
    },
    {
      'question':
          '5. Find the distance between points (−2, −1) and (2, 3).',
      'options': ['4', '5', '√32', '6'],
      'correctIndex': 2,
      'explanation':
          'Distance = √[(2+2)² + (3+1)²] = √[16+16] = √32.'
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
              'You have completed all Coordinate Geometry Easy Practise 8 questions!'),
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
          'Coordinate Geometry - Easy Practise 8',
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
