import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise12 extends StatefulWidget {
  const CoordinateGeometryHardPractise12({super.key});

  @override
  State<CoordinateGeometryHardPractise12> createState() =>
      _CoordinateGeometryHardPractise12State();
}

class _CoordinateGeometryHardPractise12State
    extends State<CoordinateGeometryHardPractise12> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of the line passing through points (−1,2) and (3,10).',
      'options': ['2', '3', '4', '5'],
      'hint': 'Slope formula: m=(y2-y1)/(x2-x1)',
      'correctIndex': 0,
      'explanation': 'Slope m = (10−2)/(3−(-1)) = 8/4 = 2'
    },
    {
      'question': '2. Distance from point (4,−3) to the x-axis:',
      'options': ['3', '4', '−3', '5'],
      'hint': 'Distance from point to x-axis is the absolute value of y-coordinate',
      'correctIndex': 0,
      'explanation': 'Distance to x-axis = |y| = |−3| = 3'
    },
    {
      'question':
          '3. Equation of line passing through (2,5) and parallel to y = −3x + 4:',
      'options': [
        'y − 5 = −3(x − 2)',
        'y − 5 = 3(x − 2)',
        'y + 5 = −3(x + 2)',
        'y + 5 = 3(x + 2)'
      ],
      'hint': 'Parallel lines have same slope as given line',
      'correctIndex': 0,
      'explanation': 'Parallel lines have same slope m=−3, equation: y−5=−3(x−2)'
    },
    {
      'question':
          '4. Midpoint of segment joining points (−5,6) and (3,−2):',
      'options': ['(−1,2)', '(0,1)', '(−2,2)', '(1,−1)'],
      'hint': 'Midpoint formula: ((x1+x2)/2,(y1+y2)/2)',
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((−5+3)/2,(6+−2)/2)=(−2/2,4/2)=(−1,2)'
    },
    {
      'question': '5. Are points (1,1), (2,4), (3,9) collinear?',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'hint': 'Check if slopes between consecutive points are equal',
      'correctIndex': 1,
      'explanation':
          'Slope (1,1)-(2,4)=3, slope (2,4)-(3,9)=5 ⇒ slopes unequal ⇒ No'
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
        showHint = false;
      });
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text('🎉 Well Done!'),
          content: const Text(
              'You have completed all questions in Coordinate Geometry Hard Practise 12!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  currentQuestionIndex = 0;
                  selectedAnswerIndex = null;
                  answerChecked = false;
                  showHint = false;
                });
              },
              child: const Text('Restart'),
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
          'Coordinate Geometry - Hard Practise 12',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.red,
              backgroundColor: Colors.red.shade100,
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
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
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  title: Text(option),
                  onTap: () => checkAnswer(index),
                ),
              );
            }),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      showHint = !showHint;
                    });
                  },
                  icon: const Icon(Icons.lightbulb_outline, color: Colors.white),
                  label: const Text(
                    "Hint",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ],
            ),
            if (showHint)
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  question['hint'] ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
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
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1
                      ? 'Finish'
                      : 'Next Question',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
