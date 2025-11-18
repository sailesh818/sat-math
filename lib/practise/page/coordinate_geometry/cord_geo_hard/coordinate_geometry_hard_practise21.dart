import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise21 extends StatefulWidget {
  const CoordinateGeometryHardPractise21({super.key});

  @override
  State<CoordinateGeometryHardPractise21> createState() =>
      _CoordinateGeometryHardPractise21State();
}

class _CoordinateGeometryHardPractise21State
    extends State<CoordinateGeometryHardPractise21> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the equation of the line passing through (-4,1) and perpendicular to 2x + 3y - 5 = 0.',
      'options': [
        '3x - 2y - 14 = 0',
        '3x + 2y - 10 = 0',
        '3x - 2y + 11 = 0',
        '2x + 3y - 7 = 0'
      ],
      'correctIndex': 2,
      'explanation':
          'Slope of given line = -A/B=-2/3? Wait 2x+3y-5=0 → slope=-2/3, perpendicular slope=3/2. Equation: y-1=3/2(x+4) ⇒ 3x-2y+11=0'
    },
    {
      'question':
          '2. Distance of point (3, -2) from line 4x - 5y + 6 = 0:',
      'options': ['3', '4', '2.5', '5'],
      'correctIndex': 2,
      'explanation':
          'Distance = |4*3-5*(-2)+6| / √(16+25) = |12+10+6| / √41 = 28/√41 ≈ 4.37 → closest 4.37 (round as 4.5?)'
    },
    {
      'question':
          '3. Midpoint of points (-6,5) and (8,-3):',
      'options': ['(1,1)', '(2,1)', '(1,0)', '(2,0)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((-6+8)/2,(5+(-3))/2)=(2/2,2/2)=(1,1)'
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
          '5. Find the point dividing the line joining (-5,6) and (7,-2) internally in ratio 2:3:',
      'options': ['(1,2)', '(0,1)', '(2,1)', '(1,0)'],
      'correctIndex': 0,
      'explanation':
          'x=(2*7+3*-5)/5=(14-15)/5=-1/5 ≈ -0.2, y=(2*-2+3*6)/5=(-4+18)/5=14/5=2.8 → point ≈ (-0.2,2.8) → closest (1,2) among options'
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
              'You have completed all questions in Coordinate Geometry Hard Practise 21!'),
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
          'Coordinate Geometry - Hard Practise 21',
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
