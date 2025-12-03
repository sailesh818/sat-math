import 'package:flutter/material.dart';

class GeometryHardPractise9 extends StatefulWidget {
  const GeometryHardPractise9({super.key});

  @override
  State<GeometryHardPractise9> createState() => _GeometryHardPractise9State();
}

class _GeometryHardPractise9State extends State<GeometryHardPractise9> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. A right triangle has legs of 7 cm and 24 cm. What is the hypotenuse?',
      'options': ['25 cm', '26 cm', '23 cm', '24 cm'],
      'correctIndex': 0,
      'hint': 'Use the Pythagorean theorem: a² + b² = c².',
      'explanation': 'Using the Pythagorean theorem: 7² + 24² = c² → 49 + 576 = 625 → c = √625 = 25 cm.',
    },
    {
      'question': '2. A circle has diameter 20 cm. What is its area? (Use π ≈ 3.14)',
      'options': ['314 cm²', '300 cm²', '320 cm²', '310 cm²'],
      'correctIndex': 0,
      'hint': 'Use the formula for area of a circle: A = πr². The radius is half of the diameter.',
      'explanation': 'Radius = 20 / 2 = 10 cm. Area = π * 10² = 3.14 * 100 = 314 cm².',
    },
    {
      'question': '3. A square has area 196 cm². What is the length of its diagonal?',
      'options': ['14√2 cm', '12√2 cm', '13√2 cm', '15√2 cm'],
      'correctIndex': 0,
      'hint': 'Use the formula for the diagonal of a square: diagonal = side * √2.',
      'explanation': 'Side = √196 = 14 cm. Diagonal = 14 * √2 = 14√2 cm.',
    },
    {
      'question': '4. A trapezoid has bases 10 cm and 18 cm, height 6 cm. What is its area?',
      'options': ['84 cm²', '80 cm²', '85 cm²', '90 cm²'],
      'correctIndex': 0,
      'hint': 'Use the trapezoid area formula: A = 1/2 * (b₁ + b₂) * height.',
      'explanation': 'Area = 1/2 * (10 + 18) * 6 = 84 cm².',
    },
    {
      'question': '5. An equilateral triangle has height 6√3 cm. What is the side length?',
      'options': ['12 cm', '10 cm', '14 cm', '8 cm'],
      'correctIndex': 0,
      'hint': 'For an equilateral triangle, height = (side * √3) / 2.',
      'explanation': 'Height = (side * √3) / 2. So, side = 2 * height / √3 = 2 * 6√3 / √3 = 12 cm.',
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
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          'Geometry - Hard Practise 9',
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
                    backgroundColor: Colors.indigo,
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
                  backgroundColor: Colors.indigo,
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
