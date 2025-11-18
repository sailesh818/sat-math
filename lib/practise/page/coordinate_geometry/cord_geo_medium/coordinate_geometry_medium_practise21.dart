import 'package:flutter/material.dart';

class CoordinateGeometryMediumPractise21 extends StatefulWidget {
  const CoordinateGeometryMediumPractise21({super.key});

  @override
  State<CoordinateGeometryMediumPractise21> createState() =>
      _CoordinateGeometryMediumPractise21State();
}

class _CoordinateGeometryMediumPractise21State
    extends State<CoordinateGeometryMediumPractise21> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of the line joining points (−5,4) and (3,−2).',
      'options': ['−3/4', '3/4', '−1', '1'],
      'correctIndex': 0,
      'explanation':
          'Slope = (−2−4)/(3−(−5)) = (−6)/8 = −3/4'
    },
    {
      'question':
          '2. Find the midpoint of points (7,−3) and (−1,5).',
      'options': ['(3,1)', '(2,1)', '(3,−1)', '(2,−1)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((7+−1)/2, (−3+5)/2) = (6/2,2/2) = (3,1)'
    },
    {
      'question':
          '3. Are points (−2,1), (0,3), (2,5) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope 1-2 = (3−1)/(0−(−2))=2/2=1; slope 2-3 = (5−3)/(2−0)=2/2=1 ⇒ Yes, collinear'
    },
    {
      'question':
          '4. Distance between points (−3,−4) and (0,0):',
      'options': ['5', '4', '6', '7'],
      'correctIndex': 0,
      'explanation':
          'Distance = √[(0−(−3))² + (0−(−4))²] = √[9+16] = √25 = 5'
    },
    {
      'question':
          '5. Equation of line passing through (−2,1) with slope 1/2:',
      'options': [
        'y−1 = 1/2(x+2)',
        'y+1 = 1/2(x+2)',
        'y−1 = −1/2(x+2)',
        'y+1 = −1/2(x+2)'
      ],
      'correctIndex': 0,
      'explanation':
          'Equation: y−y1 = m(x−x1) ⇒ y−1 = 1/2(x−(−2)) = y−1 = 1/2(x+2)'
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
          title: const Text('🎉 Congratulations!'),
          content: const Text(
              'You have completed the full Coordinate Geometry Medium Practise series!'),
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
          'Coordinate Geometry - Medium Practise 21',
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
