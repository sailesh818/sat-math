import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise4 extends StatefulWidget {
  const CoordinateGeometryHardPractise4({super.key});

  @override
  State<CoordinateGeometryHardPractise4> createState() =>
      _CoordinateGeometryHardPractise4State();
}

class _CoordinateGeometryHardPractise4State
    extends State<CoordinateGeometryHardPractise4> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of the line perpendicular to 7x + 5y - 10 = 0.',
      'options': ['5/7', '-7/5', '7/5', '-5/7'],
      'correctIndex': 0,
      'explanation':
          'Slope of given line = -A/B = -7/5; perpendicular slope = 5/7'
    },
    {
      'question':
          '2. The line joining points (2,−1) and (k,3) has slope 1. Find k.',
      'options': ['4', '6', '5', '3'],
      'correctIndex': 2,
      'explanation':
          'Slope = (3−(−1))/(k−2)=1 ⇒ 4/(k−2)=1 ⇒ k−2=4 ⇒ k=6'
    },
    {
      'question':
          '3. Find the distance between the parallel lines 3x−4y+5=0 and 3x−4y−7=0.',
      'options': ['3', '12/5', '√5', '5/2'],
      'correctIndex': 1,
      'explanation':
          'Distance = |c2−c1|/√(A²+B²) = |−7−5|/√(9+16) = 12/5'
    },
    {
      'question':
          '4. Midpoint of segment joining (−2,7) and (6,−1):',
      'options': ['(2,3)', '(1,3)', '(2,2)', '(3,2)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((−2+6)/2, (7+−1)/2) = (4/2, 6/2) = (2,3)'
    },
    {
      'question':
          '5. Are points (−1,−2), (0,1), (2,5) collinear?',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope (−1,−2)-(0,1)=3/1=3; slope (0,1)-(2,5)=4/2=2 ⇒ Slopes not equal ⇒ No, not collinear'
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
              'You have completed all questions in Coordinate Geometry Hard Practise 4!'),
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
          'Coordinate Geometry - Hard Practise 4',
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
