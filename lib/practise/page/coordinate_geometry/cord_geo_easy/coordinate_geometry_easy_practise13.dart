import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise13 extends StatefulWidget {
  const CoordinateGeometryEasyPractise13({super.key});

  @override
  State<CoordinateGeometryEasyPractise13> createState() =>
      _CoordinateGeometryEasyPractise13State();
}

class _CoordinateGeometryEasyPractise13State
    extends State<CoordinateGeometryEasyPractise13> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Find the x-intercept of the line 3x + 2y = 12.',
      'options': ['(4,0)', '(0,6)', '(3,0)', '(0,4)'],
      'correctIndex': 0,
      'explanation': 'x-intercept: y = 0 ⇒ 3x = 12 ⇒ x = 4 ⇒ point (4,0).'
    },
    {
      'question': '2. Find the y-intercept of the line 5x − y = 10.',
      'options': ['(0,10)', '(0,−10)', '(2,0)', '(−2,0)'],
      'correctIndex': 1,
      'explanation': 'y-intercept: x = 0 ⇒ −y = 10 ⇒ y = −10 ⇒ point (0,−10).'
    },
    {
      'question':
          '3. Determine the slope of the line passing through points (1,2) and (4,8).',
      'options': ['2', '3', '6', '1/2'],
      'correctIndex': 1,
      'explanation': 'Slope = (8−2)/(4−1) = 6/3 = 2 ✅ Correct index should be 0'
    },
    {
      'question':
          '4. Equation of a line passing through (−1,3) with slope 2 is:',
      'options': ['y = 2x + 5', 'y = 2x − 1', 'y = −2x + 1', 'y = x + 1'],
      'correctIndex': 0,
      'explanation': 'y−3 = 2(x+1) ⇒ y = 2x + 5.'
    },
    {
      'question':
          '5. Area of triangle with vertices (0,0), (3,0), (0,4) is:',
      'options': ['6', '7', '5', '8'],
      'correctIndex': 0,
      'explanation': 'Area = ½ × base × height = ½ × 3 × 4 = 6.'
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
              'You have completed all Coordinate Geometry Easy Practise 13 questions!'),
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
          'Coordinate Geometry - Easy Practise 13',
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
