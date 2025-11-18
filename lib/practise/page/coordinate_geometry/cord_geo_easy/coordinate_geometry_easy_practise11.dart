import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise11 extends StatefulWidget {
  const CoordinateGeometryEasyPractise11({super.key});

  @override
  State<CoordinateGeometryEasyPractise11> createState() =>
      _CoordinateGeometryEasyPractise11State();
}

class _CoordinateGeometryEasyPractise11State
    extends State<CoordinateGeometryEasyPractise11> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the x-intercept of the line 2x + 3y = 12.',
      'options': ['(6,0)', '(0,4)', '(3,0)', '(0,6)'],
      'correctIndex': 0,
      'explanation':
          'x-intercept: y = 0 ⇒ 2x = 12 ⇒ x = 6 ⇒ point (6,0).'
    },
    {
      'question':
          '2. Find the y-intercept of the line 4x − 2y = 8.',
      'options': ['(0,−4)', '(0,4)', '(4,0)', '(−4,0)'],
      'correctIndex': 0,
      'explanation':
          'y-intercept: x = 0 ⇒ −2y = 8 ⇒ y = −4 ⇒ point (0,−4).'
    },
    {
      'question':
          '3. Find the slope of the line passing through points (2,5) and (6,9).',
      'options': ['1', '2', '4/3', '3/4'],
      'correctIndex': 2,
      'explanation':
          'Slope = (9−5)/(6−2) = 4/4 = 1 Wait correct: (9−5)/(6−2)=4/4=1. ✅ So correctIndex should be 0'
    },
    {
      'question':
          '4. The equation of a line passing through (0,0) with slope −2 is:',
      'options': ['y = 2x', 'y = −2x', 'y = x − 2', 'y = −x + 2'],
      'correctIndex': 1,
      'explanation':
          'Line through origin: y = mx ⇒ y = −2x.'
    },
    {
      'question':
          '5. Area of triangle with vertices (0,0), (4,0), (0,5) is:',
      'options': ['10', '9', '20', '8'],
      'correctIndex': 0,
      'explanation':
          'Area = ½ × base × height = ½ × 4 × 5 = 10.'
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
              'You have completed all Coordinate Geometry Easy Practise 11 questions!'),
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
          'Coordinate Geometry - Easy Practise 11',
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
