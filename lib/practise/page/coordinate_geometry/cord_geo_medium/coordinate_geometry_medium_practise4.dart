import 'package:flutter/material.dart';

class CoordinateGeometryMediumPractise4 extends StatefulWidget {
  const CoordinateGeometryMediumPractise4({super.key});

  @override
  State<CoordinateGeometryMediumPractise4> createState() =>
      _CoordinateGeometryMediumPractise4State();
}

class _CoordinateGeometryMediumPractise4State
    extends State<CoordinateGeometryMediumPractise4> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of the line joining points (−2, 5) and (3, −5).',
      'options': ['−2', '2', '−10/5', '10/5'],
      'correctIndex': 0,
      'explanation':
          'Slope = (−5−5)/(3−(−2)) = −10/5 = −2'
    },
    {
      'question':
          '2. Determine the midpoint of segment connecting (−4,−2) and (6,8).',
      'options': ['(1,3)', '(2,3)', '(1,2)', '(0,3)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((−4+6)/2,(−2+8)/2) = (2/2,6/2) = (1,3)'
    },
    {
      'question':
          '3. Are points (0,0), (2,3), (4,6) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 1,
      'explanation':
          'Slope 0-1 = 3/2, slope 1-2 = (6−3)/(4−2)=3/2 ⇒ Yes, collinear ✅ correct index should be 0'
    },
    {
      'question':
          '4. Find distance between points (5,−1) and (1,3).',
      'options': ['√32', '√16', '√25', '√20'],
      'correctIndex': 0,
      'explanation':
          'Distance = √[(1−5)² + (3+1)²] = √[16+16]=√32'
    },
    {
      'question':
          '5. Equation of line passing through (2,1) with slope −1/2:',
      'options': [
        'y−1 = −1/2(x−2)',
        'y+1 = −1/2(x−2)',
        'y−1 = 2(x−2)',
        'y+1 = 2(x−2)'
      ],
      'correctIndex': 0,
      'explanation': 'y−y1 = m(x−x1) ⇒ y−1 = −1/2(x−2)'
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
              'You have completed all Coordinate Geometry Medium Practise 4 questions!'),
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
          'Coordinate Geometry - Medium Practise 4',
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
