import 'package:flutter/material.dart';

class GeometryHardPractise8 extends StatefulWidget {
  const GeometryHardPractise8({super.key});

  @override
  State<GeometryHardPractise8> createState() => _GeometryHardPractise8State();
}

class _GeometryHardPractise8State extends State<GeometryHardPractise8> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. A triangle has sides 9 cm, 12 cm, and 15 cm. What is its area?',
      'options': ['54 cm²', '50 cm²', '56 cm²', '60 cm²'],
      'correctIndex': 0,
      'hint': 'Check if this is a right triangle.',
      'explanation': 'This is a right triangle. Using the formula: Area = 1/2 * base * height, we get Area = 54 cm².',
    },
    {
      'question': '2. A circle has radius 11 cm. What is the area of a semicircle? (Use π ≈ 3.14)',
      'options': ['189.54 cm²', '190 cm²', '180 cm²', '185 cm²'],
      'correctIndex': 0,
      'hint': 'Use the formula for the area of a circle: A = πr², then divide by 2 for the semicircle.',
      'explanation': 'Area of the circle = π * 11² = 3.14 * 121 = 379.94 cm². Divide by 2 for the semicircle: 189.54 cm².',
    },
    {
      'question': '3. A square has a diagonal of 14 cm. What is its area?',
      'options': ['98 cm²', '96 cm²', '100 cm²', '102 cm²'],
      'correctIndex': 0,
      'hint': 'Use the Pythagorean theorem to find the side length first.',
      'explanation': 'For a square, diagonal = side * √2. So, side = 14 / √2 = 9.9 cm. Area = side² = 98 cm².',
    },
    {
      'question': '4. A trapezoid has bases 16 cm and 24 cm with height 8 cm. What is its area?',
      'options': ['160 cm²', '150 cm²', '155 cm²', '165 cm²'],
      'correctIndex': 0,
      'hint': 'Use the trapezoid area formula: A = 1/2 * (b₁ + b₂) * height.',
      'explanation': 'Area = 1/2 * (16 + 24) * 8 = 160 cm².',
    },
    {
      'question': '5. An equilateral triangle has side length 12 cm. What is its height?',
      'options': ['6√3 cm', '7√3 cm', '5√3 cm', '8 cm'],
      'correctIndex': 0,
      'hint': 'Use the formula: height = (side * √3) / 2.',
      'explanation': 'Height = (12 * √3) / 2 = 6√3 cm.',
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
      backgroundColor: Colors.deepOrange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: const Text(
          'Geometry - Hard Practise 8',
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
                    backgroundColor: Colors.deepOrange,
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
                  backgroundColor: Colors.deepOrange,
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
