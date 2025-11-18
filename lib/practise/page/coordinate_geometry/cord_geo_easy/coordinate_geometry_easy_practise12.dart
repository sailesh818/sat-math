import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise12 extends StatefulWidget {
  const CoordinateGeometryEasyPractise12({super.key});

  @override
  State<CoordinateGeometryEasyPractise12> createState() =>
      _CoordinateGeometryEasyPractise12State();
}

class _CoordinateGeometryEasyPractise12State
    extends State<CoordinateGeometryEasyPractise12> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Find the distance between points (1,2) and (5,6).',
      'options': ['5', '4√2', '√32', '6'],
      'correctIndex': 2,
      'explanation': 'Distance = √[(5−1)² + (6−2)²] = √[16+16]=√32.'
    },
    {
      'question': '2. Midpoint of line joining (−2,3) and (4,−1) is:',
      'options': ['(1,1)', '(2,1)', '(1,−1)', '(−1,1)'],
      'correctIndex': 0,
      'explanation': 'Midpoint = ((−2+4)/2, (3−1)/2) = (2/2,2/2) = (1,1).'
    },
    {
      'question':
          '3. Slope of line passing through (3,7) and (7,15) is:',
      'options': ['2', '3', '1/2', '4'],
      'correctIndex': 0,
      'explanation': 'Slope = (15−7)/(7−3)=8/4=2.'
    },
    {
      'question':
          '4. Equation of line with slope −3 passing through (2,1) is:',
      'options': ['y = −3x + 7', 'y = 3x − 5', 'y = −3x − 5', 'y = −x + 1'],
      'correctIndex': 0,
      'explanation': 'y−1 = −3(x−2) ⇒ y = −3x + 7.'
    },
    {
      'question':
          '5. Are points (1,2), (2,3), (3,4) collinear?',
      'options': ['Yes', 'No', 'Cannot determine', 'Partial'],
      'correctIndex': 0,
      'explanation':
          'Slope between (1,2) & (2,3)=1; slope between (2,3)&(3,4)=1 ⇒ equal ⇒ collinear.'
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
              'You have completed all Coordinate Geometry Easy Practise 12 questions!'),
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
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text(
          'Coordinate Geometry - Easy Practise 12',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
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
                    ? Colors.green.shade100
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
                  color: Colors.green.shade100,
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
                backgroundColor: Colors.green,
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
