import 'package:flutter/material.dart';

class CoordinateGeometryMediumPractise15 extends StatefulWidget {
  const CoordinateGeometryMediumPractise15({super.key});

  @override
  State<CoordinateGeometryMediumPractise15> createState() =>
      _CoordinateGeometryMediumPractise15State();
}

class _CoordinateGeometryMediumPractise15State
    extends State<CoordinateGeometryMediumPractise15> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of the line joining points (5,−2) and (−1,4).',
      'options': ['−1', '1', '−6', '1/2'],
      'correctIndex': 0,
      'explanation':
          'Slope = (4−(−2))/(−1−5) = 6/(-6) = -1'
    },
    {
      'question':
          '2. Find the midpoint of points (−3,1) and (7,5).',
      'options': ['(2,3)', '(3,3)', '(2,2)', '(3,2)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((−3+7)/2, (1+5)/2) = (4/2,6/2) = (2,3)'
    },
    {
      'question':
          '3. Are points (0,0), (2,5), (4,10) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope 1-2 = (5−0)/(2−0)=5/2; slope 2-3 = (10−5)/(4−2)=5/2 ⇒ Yes, collinear'
    },
    {
      'question':
          '4. Distance between points (−1,−1) and (3,2):',
      'options': ['√20', '√18', '√16', '√25'],
      'correctIndex': 0,
      'explanation':
          'Distance = √[(3−(−1))² + (2−(−1))²] = √[16 + 9] = √25 = 5'
    },
    {
      'question':
          '5. Equation of line passing through (2,−3) with slope 4:',
      'options': [
        'y+3 = 4(x−2)',
        'y−3 = 4(x−2)',
        'y+3 = −4(x−2)',
        'y−3 = −4(x−2)'
      ],
      'correctIndex': 0,
      'explanation':
          'Equation: y−y1 = m(x−x1) ⇒ y−(−3)=4(x−2) ⇒ y+3 = 4(x−2)'
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
              'You have completed all Coordinate Geometry Medium Practise 15 questions!'),
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
          'Coordinate Geometry - Medium Practise 15',
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
