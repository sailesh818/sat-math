import 'package:flutter/material.dart';

class CoordinateGeometryMediumPractise3 extends StatefulWidget {
  const CoordinateGeometryMediumPractise3({super.key});

  @override
  State<CoordinateGeometryMediumPractise3> createState() =>
      _CoordinateGeometryMediumPractise3State();
}

class _CoordinateGeometryMediumPractise3State
    extends State<CoordinateGeometryMediumPractise3> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the equation of the line perpendicular to y = 2x + 3 passing through (1,−1).',
      'options': [
        'y +1 = −1/2(x−1)',
        'y +1 = 2(x−1)',
        'y−1 = −1/2(x−1)',
        'y−1 = 2(x−1)'
      ],
      'correctIndex': 0,
      'explanation':
          'Slope of perpendicular line m = −1/2; Equation: y+1 = −1/2(x−1)'
    },
    {
      'question':
          '2. Determine if points (−1,2), (2,−4), (5,−10) are collinear.',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope (−1,2)-(2,−4) = (−4−2)/(2+1) = −6/3 = −2; Slope (2,−4)-(5,−10) = (−10+4)/(5−2)=−6/3=−2 ⇒ collinear'
    },
    {
      'question':
          '3. Find the midpoint of the line segment joining (3,−5) and (9,7).',
      'options': ['(6,1)', '(5,1)', '(6,−1)', '(5,0)'],
      'correctIndex': 0,
      'explanation': 'Midpoint = ((3+9)/2,(−5+7)/2) = (12/2,2/2) = (6,1)'
    },
    {
      'question':
          '4. Distance between points (−3,4) and (3,−2) is:',
      'options': ['√72', '√36', '√48', '√60'],
      'correctIndex': 0,
      'explanation':
          'Distance = √[(3+3)² + (−2−4)²] = √[36+36]=√72'
    },
    {
      'question':
          '5. Equation of the line passing through (0,1) with slope −3 is:',
      'options': [
        'y−1 = −3x',
        'y+1 = −3x',
        'y−1 = 3x',
        'y+1 = 3x'
      ],
      'correctIndex': 0,
      'explanation': 'Equation: y−1 = −3(x−0) ⇒ y−1 = −3x'
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
              'You have completed all Coordinate Geometry Medium Practise 3 questions!'),
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
          'Coordinate Geometry - Medium Practise 3',
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
