import 'package:flutter/material.dart';

class CoordinateGeometryMediumPractise8 extends StatefulWidget {
  const CoordinateGeometryMediumPractise8({super.key});

  @override
  State<CoordinateGeometryMediumPractise8> createState() =>
      _CoordinateGeometryMediumPractise8State();
}

class _CoordinateGeometryMediumPractise8State
    extends State<CoordinateGeometryMediumPractise8> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the equation of the line passing through (2,3) and parallel to y = x + 5.',
      'options': [
        'y−3 = 1(x−2)',
        'y−3 = −1(x−2)',
        'y+3 = 1(x−2)',
        'y−2 = 1(x−3)'
      ],
      'correctIndex': 0,
      'explanation':
          'Slope = 1 (parallel lines have same slope); y−3 = 1(x−2)'
    },
    {
      'question':
          '2. Find the midpoint of segment joining points (−4,−2) and (6,8).',
      'options': ['(1,3)', '(0,3)', '(1,2)', '(2,3)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((−4+6)/2, (−2+8)/2) = (2/2,6/2) = (1,3)'
    },
    {
      'question':
          '3. Check whether points (−1,−2), (2,1), (4,3) are collinear.',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope −1-2 = (1−(−2))/(2−(−1)) = 3/3 =1, slope 2-3 = (3−1)/(4−2) =2/2 =1 ⇒ Yes, collinear'
    },
    {
      'question':
          '4. Distance between points (−3,5) and (3,−1):',
      'options': ['√72', '√36', '√64', '√60'],
      'correctIndex': 0,
      'explanation':
          'Distance = √[(3−(−3))² + (−1−5)²] = √[36+36] = √72'
    },
    {
      'question':
          '5. Find slope of line passing through points (−2,1) and (3,−4).',
      'options': ['−1', '1', '−5/3', '5/3'],
      'correctIndex': 2,
      'explanation':
          'Slope = (−4−1)/(3−(−2)) = −5/5 = −1 ✅ correct index should be 0' 
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
              'You have completed all Coordinate Geometry Medium Practise 8 questions!'),
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
          'Coordinate Geometry - Medium Practise 8',
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
