import 'package:flutter/material.dart';

class GeometryHardPractise7 extends StatefulWidget {
  const GeometryHardPractise7({super.key});

  @override
  State<GeometryHardPractise7> createState() => _GeometryHardPractise7State();
}

class _GeometryHardPractise7State extends State<GeometryHardPractise7> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. A triangle has sides 8 cm, 15 cm, and 17 cm. What is its area?',
      'options': ['60 cm²', '50 cm²', '64 cm²', '55 cm²'],
      'correctIndex': 0,
      'hint': 'Use the Pythagorean theorem to check for a right triangle.',
      'explanation': 'The area of the right triangle is 60 cm² using the formula 1/2 * base * height.',
    },
    {
      'question': '2. A circle has a radius of 14 cm. What is the circumference? (Use π ≈ 3.14)',
      'options': ['87.92 cm', '88 cm', '85 cm', '90 cm'],
      'correctIndex': 0,
      'hint': 'Use the formula: Circumference = 2πr.',
      'explanation': 'Circumference = 2 * 3.14 * 14 = 87.92 cm.',
    },
    {
      'question': '3. A square has perimeter 36 cm. What is its area?',
      'options': ['81 cm²', '72 cm²', '90 cm²', '80 cm²'],
      'correctIndex': 0,
      'hint': 'Perimeter = 4 * side length. Find the side and square it.',
      'explanation': 'Side length = 36/4 = 9, so area = 9² = 81 cm².',
    },
    {
      'question': '4. A trapezoid has bases 13 cm and 21 cm with height 5 cm. What is its area?',
      'options': ['85 cm²', '80 cm²', '90 cm²', '75 cm²'],
      'correctIndex': 0,
      'hint': 'Use the trapezoid area formula: A = 1/2 * (b₁ + b₂) * height.',
      'explanation': 'Area = 1/2 * (13 + 21) * 5 = 85 cm².',
    },
    {
      'question': '5. An equilateral triangle has side length 14 cm. What is its height?',
      'options': ['7√3 cm', '8 cm', '6√3 cm', '7 cm'],
      'correctIndex': 0,
      'hint': 'Use the formula: height = (side * √3) / 2.',
      'explanation': 'Height = (14 * √3) / 2 = 7√3 cm.',
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
        builder: (_) => AlertDialog(
          title: const Text('🎉 Great Job!'),
          content: const Text('You have completed all practise questions!'),
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
          'Geometry - Hard Practise 7',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// QUESTION CARD
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// OPTIONS
            ...List.generate(question['options'].length, (index) {
              final option = question['options'][index];
              final isSelected = selectedAnswerIndex == index;
              final isCorrect =
                  answerChecked && index == question['correctIndex'];
              final isWrong = answerChecked && isSelected && !isCorrect;

              return Card(
                color: isCorrect
                    ? Colors.lightGreen.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    option,
                    style: const TextStyle(fontSize: 17),
                  ),
                  onTap: () => checkAnswer(index),
                ),
              );
            }),

            const SizedBox(height: 10),

            /// HINT BUTTON
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
                      borderRadius: BorderRadius.circular(14),
                    ),
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

            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Explanation: ${question['explanation']}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            /// NEXT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1
                      ? "Finish"
                      : "Next Question",
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
