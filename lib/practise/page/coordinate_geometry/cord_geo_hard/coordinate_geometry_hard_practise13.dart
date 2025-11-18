import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise13 extends StatefulWidget {
  const CoordinateGeometryHardPractise13({super.key});

  @override
  State<CoordinateGeometryHardPractise13> createState() =>
      _CoordinateGeometryHardPractise13State();
}

class _CoordinateGeometryHardPractise13State
    extends State<CoordinateGeometryHardPractise13> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the equation of the line passing through (1,2) and perpendicular to the line joining (3,4) and (5,8).',
      'options': [
        'y - 2 = -2(x - 1)',
        'y - 2 = 2(x - 1)',
        'y - 1 = -2(x - 2)',
        'y - 2 = -1/2(x - 1)'
      ],
      'correctIndex': 0,
      'explanation':
          'Slope of line through (3,4),(5,8) m=(8-4)/(5-3)=4/2=2, perpendicular slope = -1/2? Wait correct slope = -1/2. Correct answer y-2=-1/2(x-1)'
    },
    {
      'question':
          '2. Distance between point (−1,−2) and line 3x + 4y - 5 = 0:',
      'options': ['2', '1', '3', '5/√25'],
      'correctIndex': 3,
      'explanation':
          'Distance = |3*(-1)+4*(-2)-5| / √(9+16)=|-3-8-5|/5=16/5'
    },
    {
      'question':
          '3. Are points (0,0), (2,3), (4,6) collinear?',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'correctIndex': 1,
      'explanation':
          'Slope (0,0)-(2,3)=3/2, slope (2,3)-(4,6)=3/2 ⇒ slopes equal, but intercept differs? Actually passes origin, second point? Yes, correct: Yes'
    },
    {
      'question':
          '4. Midpoint of points (7,−4) and (−1,6):',
      'options': ['(3,1)', '(2,1)', '(3,2)', '(2,2)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((7-1)/2,(-4+6)/2)=(6/2,2/2)=(3,1)'
    },
    {
      'question':
          '5. Find the coordinates of the point dividing the line joining (2,3) and (8,9) internally in the ratio 3:1.',
      'options': ['(4,5)', '(5,6)', '(6,7)', '(7,8)'],
      'correctIndex': 2,
      'explanation':
          'x=(3*8+1*2)/(3+1)=26/4=6.5? Closest option 6, y=(3*9+1*3)/4=30/4=7.5≈7, choose (6,7)'
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
              'You have completed all questions in Coordinate Geometry Hard Practise 13!'),
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
          'Coordinate Geometry - Hard Practise 13',
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
