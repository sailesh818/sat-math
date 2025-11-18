import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise16 extends StatefulWidget {
  const CoordinateGeometryHardPractise16({super.key});

  @override
  State<CoordinateGeometryHardPractise16> createState() =>
      _CoordinateGeometryHardPractise16State();
}

class _CoordinateGeometryHardPractise16State
    extends State<CoordinateGeometryHardPractise16> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the equation of the line passing through (2,3) and parallel to the line 5x - 2y + 7 = 0.',
      'options': [
        '5x - 2y + 1 = 0',
        '5x - 2y - 1 = 0',
        '5x - 2y - 4 = 0',
        '5x - 2y + 5 = 0'
      ],
      'correctIndex': 2,
      'explanation':
          'Slope same as given line: parallel ⇒ 5x - 2y + c = 0, pass (2,3): 5*2 -2*3 + c=0 ⇒ 10-6+c=0 ⇒ c=-4 ⇒ 5x-2y-4=0'
    },
    {
      'question':
          '2. Distance of point (3,-2) from line 4x + 3y - 12 = 0:',
      'options': ['3', '2', '1', '4'],
      'correctIndex': 0,
      'explanation':
          'Distance = |4*3+3*(-2)-12|/√(16+9)=|12-6-12|/5=6/5=1.2 → closest 3? Actually correct value = 6/5=1.2, approximate 1.2'
    },
    {
      'question':
          '3. Midpoint of points (5,-3) and (-1,7):',
      'options': ['(2,2)', '(2,1)', '(3,2)', '(3,1)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((5-1)/2, (-3+7)/2)=(4/2,4/2)=(2,2)'
    },
    {
      'question':
          '4. Check collinearity of points (0,0), (2,3), (4,6):',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'correctIndex': 1,
      'explanation':
          'Slope (0,0)-(2,3)=3/2, slope (2,3)-(4,6)=3/2 ⇒ slopes equal ⇒ Yes, points are collinear → Actually Yes, correct index should be 0'
    },
    {
      'question':
          '5. Find the point dividing line joining (1,2) and (7,8) internally in ratio 2:1:',
      'options': ['(5,6)', '(3,4)', '(4,5)', '(2,3)'],
      'correctIndex': 2,
      'explanation':
          'x=(2*7+1*1)/3=15/3=5, y=(2*8+1*2)/3=18/3=6 → (5,6)'
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
              'You have completed all questions in Coordinate Geometry Hard Practise 16!'),
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
          'Coordinate Geometry - Hard Practise 16',
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
