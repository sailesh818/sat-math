import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise17 extends StatefulWidget {
  const CoordinateGeometryHardPractise17({super.key});

  @override
  State<CoordinateGeometryHardPractise17> createState() =>
      _CoordinateGeometryHardPractise17State();
}

class _CoordinateGeometryHardPractise17State
    extends State<CoordinateGeometryHardPractise17> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the equation of the line passing through (1,2) and perpendicular to the line 2x + 3y - 5 = 0.',
      'options': [
        '3x - 2y + 1 = 0',
        '3x + 2y - 8 = 0',
        '3x - 2y - 4 = 0',
        '2x + 3y - 1 = 0'
      ],
      'correctIndex': 2,
      'explanation':
          'Slope of given line: -2/3, perpendicular slope = 3/2, equation y-2=3/2(x-1) ⇒ 3x-2y-4=0'
    },
    {
      'question':
          '2. Distance of point (5,1) from line x - y + 2 = 0:',
      'options': ['√2', '2√2', '√10', '3√2'],
      'correctIndex': 1,
      'explanation':
          'Distance = |5-1+2| / √(1+1) = |6|/√2 = 6/√2 = 3√2'
    },
    {
      'question':
          '3. Midpoint of points (-4,5) and (6,-3):',
      'options': ['(1,1)', '(0,1)', '(1,0)', '(0,0)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((-4+6)/2, (5+(-3))/2) = (2/2, 2/2) = (1,1)'
    },
    {
      'question':
          '4. Are points (2,3), (4,7), (6,11) collinear?',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope (2,3)-(4,7)=2, slope (4,7)-(6,11)=2 ⇒ points collinear'
    },
    {
      'question':
          '5. Find the point dividing line joining (3,1) and (9,7) internally in ratio 1:2:',
      'options': ['(5,3)', '(7,5)', '(4,3)', '(5,4)'],
      'correctIndex': 0,
      'explanation':
          'x=(1*9+2*3)/3=15/3=5, y=(1*7+2*1)/3=9/3=3 ⇒ (5,3)'
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
              'You have completed all questions in Coordinate Geometry Hard Practise 17!'),
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
          'Coordinate Geometry - Hard Practise 17',
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
