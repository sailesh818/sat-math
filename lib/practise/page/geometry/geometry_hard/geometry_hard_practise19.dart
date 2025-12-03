import 'package:flutter/material.dart';

class GeometryHardPractise19 extends StatefulWidget {
  const GeometryHardPractise19({super.key});

  @override
  State<GeometryHardPractise19> createState() => _GeometryHardPractise19State();
}

class _GeometryHardPractise19State extends State<GeometryHardPractise19> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. A right triangle has legs 15 cm and 36 cm. What is the hypotenuse?',
      'options': ['39 cm', '38 cm', '37 cm', '36 cm'],
      'correctIndex': 0,
      'hint': 'Use the Pythagorean theorem: a² + b² = c².',
      'explanation': 'Hypotenuse = √(15² + 36²) = √(225 + 1296) = √1521 = 39 cm.',
    },
    {
      'question': '2. A circle has radius 13 cm. What is the area of a semicircle? (Use π ≈ 3.14)',
      'options': ['265.21 cm²', '250 cm²', '270 cm²', '260 cm²'],
      'correctIndex': 0,
      'hint': 'Area of circle = π * r², then take 1/2 of it for semicircle.',
      'explanation': 'Area = 0.5 * 3.14 * 13² = 0.5 * 3.14 * 169 = 265.21 cm².',
    },
    {
      'question': '3. A square has area 225 cm². What is the length of its diagonal?',
      'options': ['15√2 cm', '14√2 cm', '16 cm', '13√2 cm'],
      'correctIndex': 0,
      'hint': 'Side = √area, diagonal = side * √2.',
      'explanation': 'Side = √225 = 15 cm, diagonal = 15√2 cm.',
    },
    {
      'question': '4. A trapezoid has bases 18 cm and 30 cm, height 11 cm. What is its area?',
      'options': ['264 cm²', '260 cm²', '270 cm²', '250 cm²'],
      'correctIndex': 0,
      'hint': 'Area = 1/2 * (b₁ + b₂) * height.',
      'explanation': 'Area = 0.5 * (18 + 30) * 11 = 0.5 * 48 * 11 = 264 cm².',
    },
    {
      'question': '5. An equilateral triangle has side length 26 cm. What is its height?',
      'options': ['13√3 cm', '14√3 cm', '12√3 cm', '15 cm'],
      'correctIndex': 0,
      'hint': 'Height = (side * √3) / 2.',
      'explanation': 'Height = 26 * √3 / 2 = 13√3 cm.',
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
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text(
          'Geometry - Hard Practise 19',
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
                    backgroundColor: Colors.teal,
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
                    backgroundColor: Colors.teal,
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
                  color: Colors.teal.shade100,
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
                  color: Colors.teal.shade100,
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
                  backgroundColor: Colors.teal,
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
