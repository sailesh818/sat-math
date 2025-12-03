import 'package:flutter/material.dart';

class GeometryHardPractise15 extends StatefulWidget {
  const GeometryHardPractise15({super.key});

  @override
  State<GeometryHardPractise15> createState() => _GeometryHardPractise15State();
}

class _GeometryHardPractise15State extends State<GeometryHardPractise15> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. A right triangle has legs 7 cm and 24 cm. What is the hypotenuse?',
      'options': ['25 cm', '26 cm', '23 cm', '24 cm'],
      'correctIndex': 0,
      'hint': 'Use the Pythagorean theorem: a² + b² = c².',
      'explanation': 'Hypotenuse = √(7² + 24²) = √(49 + 576) = √625 = 25 cm.',
    },
    {
      'question': '2. A circle has radius 11 cm. What is the area of a semicircle? (Use π ≈ 3.14)',
      'options': ['190.27 cm²', '180 cm²', '195 cm²', '185 cm²'],
      'correctIndex': 0,
      'hint': 'Area of semicircle = 1/2 * π * r².',
      'explanation': 'Area = 0.5 * 3.14 * 11² = 0.5 * 3.14 * 121 ≈ 190.27 cm².',
    },
    {
      'question': '3. A square has perimeter 64 cm. What is the length of its diagonal?',
      'options': ['16√2 cm', '15√2 cm', '14√2 cm', '17 cm'],
      'correctIndex': 0,
      'hint': 'Side = perimeter / 4, diagonal = side * √2.',
      'explanation': 'Side = 64 / 4 = 16 cm. Diagonal = 16 * √2 = 16√2 cm.',
    },
    {
      'question': '4. A trapezoid has bases 16 cm and 28 cm, height 9 cm. What is its area?',
      'options': ['198 cm²', '200 cm²', '190 cm²', '210 cm²'],
      'correctIndex': 0,
      'hint': 'Area = 1/2 * (b₁ + b₂) * height.',
      'explanation': 'Area = 0.5 * (16 + 28) * 9 = 0.5 * 44 * 9 = 198 cm².',
    },
    {
      'question': '5. An equilateral triangle has height 15√3 cm. What is the side length?',
      'options': ['30 cm', '28 cm', '32 cm', '25 cm'],
      'correctIndex': 0,
      'hint': 'Height = (side * √3) / 2.',
      'explanation': 'Side = 2 * height / √3 = 2 * 15√3 / √3 = 30 cm.',
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
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          'Geometry - Hard Practise 15',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 3,
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
                    backgroundColor: Colors.deepPurple,
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
                    backgroundColor: Colors.deepPurple,
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
                  color: Colors.deepPurple.shade100,
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
                  backgroundColor: Colors.deepPurple,
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
