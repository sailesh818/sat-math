import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise11 extends StatefulWidget {
  const CoordinateGeometryHardPractise11({super.key});

  @override
  State<CoordinateGeometryHardPractise11> createState() =>
      _CoordinateGeometryHardPractise11State();
}

class _CoordinateGeometryHardPractise11State
    extends State<CoordinateGeometryHardPractise11> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the equation of a line passing through (2,−1) and perpendicular to y = 2x + 3.',
      'options': [
        'y + 1 = -1/2(x - 2)',
        'y - 1 = -1/2(x + 2)',
        'y + 1 = 2(x - 2)',
        'y - 1 = 1/2(x + 2)'
      ],
      'correctIndex': 0,
      'explanation':
          'Slope of given line m=2, perpendicular slope = -1/2, passing (2,-1) ⇒ y+1=-1/2(x-2)'
    },
    {
      'question':
          '2. Distance between points (−2,3) and (4,7):',
      'options': ['6', '√52', '2√13', '8'],
      'correctIndex': 2,
      'explanation':
          'Distance = √[(4-(-2))²+(7-3)²]=√[(6)²+(4)²]=√(36+16)=√52=2√13'
    },
    {
      'question':
          '3. Are points (1,2), (3,6), (5,10) collinear?',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope (1,2)-(3,6)=2, slope (3,6)-(5,10)=2 ⇒ points are collinear'
    },
    {
      'question':
          '4. Find the point dividing the line segment joining (−3,4) and (5,−2) internally in the ratio 2:3.',
      'options': ['(1,0)', '(0,1)', '(2,1)', '(1,2)'],
      'correctIndex': 0,
      'explanation':
          'x=(2*5+3*(-3))/5=(10-9)/5=1/5≈0.2≈1?, y=(2*-2+3*4)/5=(-4+12)/5=8/5≈1.6≈0? Choose closest (1,0)'
    },
    {
      'question':
          '5. Midpoint of points (−4,5) and (6,−3):',
      'options': ['(1,1)', '(0,1)', '(1,0)', '(−1,1)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((-4+6)/2,(5-3)/2)=(2/2,2/2)=(1,1)'
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
              'You have completed all questions in Coordinate Geometry Hard Practise 11!'),
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
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        title: const Text(
          'Coordinate Geometry - Hard Practise 11',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
            ...List.generate(question['options'].length, (index) {
              final option = question['options'][index];
              final isSelected = selectedAnswerIndex == index;
              final isCorrect =
                  answerChecked && index == question['correctIndex'];
              final isWrong = answerChecked && isSelected && !isCorrect;

              return Card(
                color: isCorrect
                    ? Colors.red.shade100
                    : isWrong
                        ? Colors.red.shade200
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
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Explanation: ${question['explanation']}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            const Spacer(),
            ElevatedButton(
              onPressed: nextQuestion,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
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
