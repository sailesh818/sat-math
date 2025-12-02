import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise7 extends StatefulWidget {
  const CoordinateGeometryEasyPractise7({super.key});

  @override
  State<CoordinateGeometryEasyPractise7> createState() =>
      _CoordinateGeometryEasyPractise7State();
}

class _CoordinateGeometryEasyPractise7State
    extends State<CoordinateGeometryEasyPractise7> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of the line perpendicular to y = 2x + 3.',
      'options': ['2', '-2', '1/2', '-1/2'],
      'correctIndex': 3,
      'hint': 'Slope of perpendicular line = negative reciprocal',
      'explanation': 'Slope of perpendicular line = negative reciprocal of 2 ⇒ -1/2.'
    },
    {
      'question':
          '2. Determine if the lines y = 3x + 1 and y = 3x − 4 are parallel.',
      'options': ['Yes', 'No', 'Can’t say', 'They are perpendicular'],
      'correctIndex': 0,
      'hint': 'Compare slopes of both lines',
      'explanation': 'Both lines have slope 3 ⇒ they are parallel.'
    },
    {
      'question':
          '3. Find the x-intercept of the line 5x − 2y + 10 = 0.',
      'options': ['(2, 0)', '(-2, 0)', '(0, 5)', '(0, -5)'],
      'correctIndex': 1,
      'hint': 'At x-intercept, y = 0',
      'explanation': 'x-intercept: y = 0 ⇒ 5x + 10 = 0 ⇒ x = -2 ⇒ point (-2, 0).'
    },
    {
      'question':
          '4. The equation of a line passing through (1, 2) with slope -3 is:',
      'options': ['y = -3x + 5', 'y = -3x - 1', 'y = 3x + 5', 'y = -x + 2'],
      'correctIndex': 0,
      'hint': 'Use point-slope form: y - y1 = m(x - x1)',
      'explanation': 'Equation: y − 2 = -3(x − 1) ⇒ y = -3x + 5.'
    },
    {
      'question':
          '5. Check if the line y = 1/2 x + 4 is parallel to the line y = 1/2 x − 1.',
      'options': ['Yes', 'No', 'Depends', 'Cannot determine'],
      'correctIndex': 0,
      'hint': 'Compare slopes',
      'explanation': 'Both lines have slope 1/2 ⇒ they are parallel.'
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
          title: const Text('🎉 Excellent!'),
          content: const Text(
              'You have completed all Coordinate Geometry Easy Practise 7 questions!'),
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
          'Coordinate Geometry - Easy Practise 7',
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
            // Progress bar
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
