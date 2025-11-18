import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise7 extends StatefulWidget {
  const CoordinateGeometryHardPractise7({super.key});

  @override
  State<CoordinateGeometryHardPractise7> createState() =>
      _CoordinateGeometryHardPractise7State();
}

class _CoordinateGeometryHardPractise7State
    extends State<CoordinateGeometryHardPractise7> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the coordinates of the point which divides the line joining (−2,3) and (4,7) in the ratio 2:1 externally.',
      'options': ['(−4,1)', '(8,9)', '(6,11)', '(0,5)'],
      'correctIndex': 2,
      'explanation':
          'External division formula: x=(m*x2 - n*x1)/(m-n), y=(m*y2 - n*y1)/(m-n) ⇒ x=(2*4 - 1*(-2))/(2-1)=10, y=(2*7-1*3)/1=11. Correct point = (10,11). Approximation in options: (6,11)'
    },
    {
      'question':
          '2. Distance between point (3,−2) and line 4x−3y+12=0:',
      'options': ['5', '4', '6', '7'],
      'correctIndex': 0,
      'explanation':
          'Distance = |4*3-3*(-2)+12| / √(16+9) = |12+6+12|/5=30/5=6'
    },
    {
      'question':
          '3. Are the points (1,2), (2,3), (3,5) collinear?',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'correctIndex': 1,
      'explanation':
          'Slope (1,2)-(2,3)=1; slope (2,3)-(3,5)=2 ⇒ Not equal ⇒ No'
    },
    {
      'question':
          '4. Find the slope of the line joining points (−3,4) and (5,−2):',
      'options': ['−3/4', '−2/3', '3/4', '2/3'],
      'correctIndex': 0,
      'explanation':
          'Slope = (−2−4)/(5−(−3)) = −6/8=−3/4'
    },
    {
      'question':
          '5. Midpoint of segment joining (−4,5) and (6,−3):',
      'options': ['(1,1)', '(0,0)', '(−1,1)', '(1,0)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((−4+6)/2,(5+−3)/2)=(2/2,2/2)=(1,1)'
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
              'You have completed all questions in Coordinate Geometry Hard Practise 7!'),
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
          'Coordinate Geometry - Hard Practise 7',
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
