import 'package:flutter/material.dart';

class CoordinateGeometryMediumPractise10 extends StatefulWidget {
  const CoordinateGeometryMediumPractise10({super.key});

  @override
  State<CoordinateGeometryMediumPractise10> createState() =>
      _CoordinateGeometryMediumPractise10State();
}

class _CoordinateGeometryMediumPractise10State
    extends State<CoordinateGeometryMediumPractise10> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of the line perpendicular to y = −2x + 3.',
      'options': ['1/2', '−1/2', '2', '−2'],
      'correctIndex': 0,
      'explanation':
          'Slope of perpendicular line = negative reciprocal of −2 ⇒ 1/2'
    },
    {
      'question':
          '2. Determine the midpoint of points (5,−1) and (−3,7).',
      'options': ['(1,3)', '(−1,3)', '(1,2)', '(−2,3)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((5+−3)/2,(−1+7)/2) = (2/2,6/2) = (1,3)'
    },
    {
      'question':
          '3. Check whether points (1,2), (3,6), (5,10) are collinear.',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope 1-2 = (6−2)/(3−1)=4/2=2; Slope 2-3 = (10−6)/(5−3)=4/2=2 ⇒ Yes, collinear'
    },
    {
      'question':
          '4. Distance between points (−2,−3) and (4,1):',
      'options': ['√52', '√36', '√32', '√48'],
      'correctIndex': 0,
      'explanation':
          'Distance = √[(4−(−2))² + (1−(−3))²] = √[36+16] = √52'
    },
    {
      'question':
          '5. Find the equation of the line passing through (3,−2) with slope 5.',
      'options': [
        'y + 2 = 5(x − 3)',
        'y − 2 = 5(x − 3)',
        'y + 2 = −5(x − 3)',
        'y − 3 = 5(x − 2)'
      ],
      'correctIndex': 0,
      'explanation':
          'Equation of line: y−y1 = m(x−x1) ⇒ y+2 = 5(x−3)'
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
              'You have completed all Coordinate Geometry Medium Practise 10 questions!'),
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
          'Coordinate Geometry - Medium Practise 10',
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
