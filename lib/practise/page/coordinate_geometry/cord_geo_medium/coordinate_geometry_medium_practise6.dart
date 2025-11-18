import 'package:flutter/material.dart';

class CoordinateGeometryMediumPractise6 extends StatefulWidget {
  const CoordinateGeometryMediumPractise6({super.key});

  @override
  State<CoordinateGeometryMediumPractise6> createState() =>
      _CoordinateGeometryMediumPractise6State();
}

class _CoordinateGeometryMediumPractise6State
    extends State<CoordinateGeometryMediumPractise6> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the equation of a line parallel to y = −2x + 5 passing through (3,1).',
      'options': [
        'y−1 = −2(x−3)',
        'y−1 = 1/2(x−3)',
        'y+1 = −2(x−3)',
        'y−3 = −2(x−1)'
      ],
      'correctIndex': 0,
      'explanation':
          'Parallel lines have same slope m = −2; equation: y−1 = −2(x−3)'
    },
    {
      'question':
          '2. Determine the midpoint of segment connecting points (2,−1) and (8,5).',
      'options': ['(5,2)', '(4,2)', '(5,3)', '(6,2)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((2+8)/2, (−1+5)/2) = (10/2,4/2) = (5,2)'
    },
    {
      'question':
          '3. Are points (1,1), (3,3), (5,5) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope 1-2 = (3−1)/(3−1) = 1; slope 2-3 = (5−3)/(5−3) = 1 ⇒ Yes, collinear'
    },
    {
      'question':
          '4. Find the distance between points (−3,2) and (4,−2).',
      'options': ['√65', '√36', '√50', '√45'],
      'correctIndex': 0,
      'explanation':
          'Distance = √[(4−(−3))² + (−2−2)²] = √[49+16]=√65'
    },
    {
      'question':
          '5. Find the slope of the line passing through (−2,4) and (3,−1).',
      'options': ['−1', '1', '−2', '2'],
      'correctIndex': 0,
      'explanation':
          'Slope = (−1−4)/(3−(−2)) = −5/5 = −1'
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
              'You have completed all Coordinate Geometry Medium Practise 6 questions!'),
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
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text(
          'Coordinate Geometry - Medium Practise 6',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
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
                    ? Colors.orange.shade100
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
                  color: Colors.orange.shade100,
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
                backgroundColor: Colors.orange,
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
