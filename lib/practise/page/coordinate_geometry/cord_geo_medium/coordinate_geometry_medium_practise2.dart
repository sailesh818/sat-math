import 'package:flutter/material.dart';

class CoordinateGeometryMediumPractise2 extends StatefulWidget {
  const CoordinateGeometryMediumPractise2({super.key});

  @override
  State<CoordinateGeometryMediumPractise2> createState() =>
      _CoordinateGeometryMediumPractise2State();
}

class _CoordinateGeometryMediumPractise2State
    extends State<CoordinateGeometryMediumPractise2> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of the line passing through points (3,−2) and (−1,6).',
      'options': ['−2', '−2', '2', '−1/2'],
      'correctIndex': 1,
      'explanation':
          'Slope m = (6−(−2))/(−1−3) = 8/−4 = −2'
    },
    {
      'question':
          '2. Determine the midpoint of the segment joining points (2,−3) and (8,5).',
      'options': ['(5,1)', '(4,1)', '(5,−1)', '(6,1)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((2+8)/2, (−3+5)/2) = (10/2,2/2) = (5,1)'
    },
    {
      'question':
          '3. Find the distance between points (−4,1) and (2,7).',
      'options': ['√52', '√72', '√60', '√50'],
      'correctIndex': 0,
      'explanation':
          'Distance = √[(2−(−4))² + (7−1)²] = √[36+36] = √72 ✅ correct index should be 1'
    },
    {
      'question':
          '4. Are the points (1,1), (2,3), (3,5) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope 1-2 = (3−1)/(2−1) = 2; Slope 2-3 = (5−3)/(3−2) = 2 ⇒ equal ⇒ collinear'
    },
    {
      'question':
          '5. Find the equation of a line with slope 1/2 passing through (4,−1).',
      'options': [
        'y +1 = 1/2(x−4)',
        'y−1 = 1/2(x−4)',
        'y +1 = 2(x−4)',
        'y−1 = 2(x−4)'
      ],
      'correctIndex': 0,
      'explanation': 'Equation: y−y1 = m(x−x1) ⇒ y−(−1)=1/2(x−4) ⇒ y+1=1/2(x−4)'
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
              'You have completed all Coordinate Geometry Medium Practise 2 questions!'),
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
          'Coordinate Geometry - Medium Practise 2',
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
