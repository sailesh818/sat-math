import 'package:flutter/material.dart';

class GeometryHardPractise18 extends StatefulWidget {
  const GeometryHardPractise18({super.key});

  @override
  State<GeometryHardPractise18> createState() => _GeometryHardPractise18State();
}

class _GeometryHardPractise18State extends State<GeometryHardPractise18> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. A right triangle has legs 20 cm and 21 cm. What is the hypotenuse?',
      'options': ['29 cm', '30 cm', '28 cm', '31 cm'],
      'correctIndex': 0,
      'hint': 'Use the Pythagorean theorem: a² + b² = c².',
      'explanation': 'Hypotenuse = √(20² + 21²) = √(400 + 441) = √841 = 29 cm.',
    },
    {
      'question': '2. A circle has radius 10 cm. What is the area of a quarter circle? (Use π ≈ 3.14)',
      'options': ['78.5 cm²', '75 cm²', '80 cm²', '76 cm²'],
      'correctIndex': 0,
      'hint': 'Area of circle = π * r², then take 1/4 of it.',
      'explanation': 'Area = 0.25 * 3.14 * 10² = 0.25 * 3.14 * 100 = 78.5 cm².',
    },
    {
      'question': '3. A square has area 196 cm². What is the length of its diagonal?',
      'options': ['14√2 cm', '13√2 cm', '15 cm', '12√2 cm'],
      'correctIndex': 0,
      'hint': 'Side length = √area, diagonal = side * √2.',
      'explanation': 'Side = √196 = 14 cm, diagonal = 14 * √2 = 14√2 cm.',
    },
    {
      'question': '4. A trapezoid has bases 20 cm and 30 cm, height 12 cm. What is its area?',
      'options': ['300 cm²', '290 cm²', '310 cm²', '305 cm²'],
      'correctIndex': 0,
      'hint': 'Area = 1/2 * (b₁ + b₂) * height.',
      'explanation': 'Area = 0.5 * (20 + 30) * 12 = 0.5 * 50 * 12 = 300 cm².',
    },
    {
      'question': '5. An equilateral triangle has height 21√3 cm. What is its side length?',
      'options': ['42 cm', '40 cm', '45 cm', '41 cm'],
      'correctIndex': 0,
      'hint': 'Height = (side * √3) / 2 → side = 2 * height / √3.',
      'explanation': 'Side = 2 * (21√3) / √3 = 42 cm.',
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
          title: const Text('🎯 Practice Completed!'),
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
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: const Text(
          'Geometry - Hard Practise 18',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // QUESTION CARD
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

            // OPTIONS
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
                    backgroundColor: Colors.redAccent,
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

            // HINT BUTTON
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
                    backgroundColor: Colors.redAccent,
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
                  color: Colors.red.shade100,
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
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Explanation: ${question['explanation']}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            // NEXT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
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
