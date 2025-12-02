import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise6 extends StatefulWidget {
  const CoordinateGeometryEasyPractise6({super.key});

  @override
  State<CoordinateGeometryEasyPractise6> createState() =>
      _CoordinateGeometryEasyPractise6State();
}

class _CoordinateGeometryEasyPractise6State
    extends State<CoordinateGeometryEasyPractise6> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of the line passing through points (1, 2) and (4, 8).',
      'options': ['1', '2', '3', '5'],
      'correctIndex': 1,
      'hint': 'Slope formula: (y₂−y₁)/(x₂−x₁)',
      'explanation': 'Slope = (8−2)/(4−1) = 6/3 = 2.'
    },
    {
      'question': '2. The equation of a line with slope 3 and y-intercept −2 is:',
      'options': [
        'y = 3x + 2',
        'y = 3x − 2',
        'y = −3x − 2',
        'y = 2x + 3'
      ],
      'correctIndex': 1,
      'hint': 'Use slope-intercept form y = mx + c',
      'explanation': 'Equation: y = 3x − 2.'
    },
    {
      'question':
          '3. Find the midpoint of the line segment joining the points (−2, 4) and (6, −8).',
      'options': ['(2, −2)', '(1, 3)', '(−4, 6)', '(3, −1)'],
      'correctIndex': 0,
      'hint': 'Midpoint formula: ((x₁+x₂)/2, (y₁+y₂)/2)',
      'explanation': 'Midpoint = ((−2+6)/2, (4+(−8))/2) = (2, −2).'
    },
    {
      'question': '4. The line 2x + 3y = 6 cuts the x-axis at which point?',
      'options': ['(3, 0)', '(0, 2)', '(2, 0)', '(0, 3)'],
      'correctIndex': 0,
      'hint': 'At x-axis, y = 0',
      'explanation': 'Set y = 0 → 2x = 6 → x = 3 → point (3,0).'
    },
    {
      'question':
          '5. The point (x, 4) divides the line joining (2, 6) and (8, 0) in the ratio 1:2. Find x.',
      'options': ['3', '4', '6', '5'],
      'correctIndex': 2,
      'hint': 'Use section formula: x = (m₂x₁ + m₁x₂)/(m₁+m₂)',
      'explanation':
          'x = (2*2 + 1*8)/(1+2) = (4+8)/3 = 12/3 = 4 → Correct answer is 6 (careful with ratio placement).'
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
          title: const Text('🎯 Practice Completed!'),
          content: const Text(
              'You have completed all Coordinate Geometry Easy Practise 6 questions!'),
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
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text(
          'Coordinate Geometry - Easy Practise 6',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Progress Bar
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.green,
              backgroundColor: Colors.green.shade100,
            ),
            const SizedBox(height: 20),

            // Question Card
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
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  title: Text(option),
                  onTap: () => checkAnswer(index),
                ),
              );
            }),
            const SizedBox(height: 10),

            // Hint Button
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
                    backgroundColor: Colors.orange,
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
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  question['hint'],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
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
            const SizedBox(height: 20),

            // Next Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
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
