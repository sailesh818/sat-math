import 'package:flutter/material.dart';

class GeometryMediumPractise13 extends StatefulWidget {
  const GeometryMediumPractise13({super.key});

  @override
  State<GeometryMediumPractise13> createState() => _GeometryMediumPractise13State();
}

class _GeometryMediumPractise13State extends State<GeometryMediumPractise13> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. A triangle has sides 9 cm, 12 cm, and 15 cm. What type of triangle is it?',
      'options': ['Right triangle', 'Equilateral triangle', 'Isosceles triangle', 'Scalene triangle'],
      'correctIndex': 0,
      'hint': 'Use Pythagoras theorem: a² + b² = c²',
      'explanation': 'It’s a right triangle as 9² + 12² = 15².'
    },
    {
      'question': '2. A circle has a circumference of 62.8 cm. What is its radius? (Use π ≈ 3.14)',
      'options': ['10 cm', '9 cm', '12 cm', '11 cm'],
      'correctIndex': 0,
      'hint': 'Circumference = 2 × π × radius',
      'explanation': 'Radius = 62.8 / (2 × 3.14) = 10 cm'
    },
    {
      'question': '3. A parallelogram has a base of 15 cm and a height of 7 cm. What is its area?',
      'options': ['105 cm²', '100 cm²', '110 cm²', '115 cm²'],
      'correctIndex': 0,
      'hint': 'Area of parallelogram = base × height',
      'explanation': 'Area = 15 × 7 = 105 cm²'
    },
    {
      'question': '4. A rectangle has sides 8 cm and 15 cm. What is the length of the diagonal?',
      'options': ['17 cm', '16 cm', '18 cm', '15 cm'],
      'correctIndex': 0,
      'hint': 'Diagonal = √(length² + width²)',
      'explanation': 'Diagonal = √(8² + 15²) = 17 cm'
    },
    {
      'question': '5. A regular hexagon has a perimeter of 72 cm. What is the length of one side?',
      'options': ['12 cm', '10 cm', '11 cm', '13 cm'],
      'correctIndex': 0,
      'hint': 'Perimeter of hexagon = 6 × side length',
      'explanation': 'Side length = 72 / 6 = 12 cm'
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('🎯 Practice Completed!'),
          content: Text(
            'You completed all questions!',
            style: const TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back', style: TextStyle(color: Colors.blue)),
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
              child:
                  const Text('Restart', style: TextStyle(color: Colors.blue)),
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
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Geometry - Medium Practice 13',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // QUESTION CARD
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w600, height: 1.4),
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
                    ? Colors.blue.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                child: ListTile(
                  title: Text(option, style: const TextStyle(fontSize: 17)),
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
                  onPressed: () => setState(() => showHint = !showHint),
                  icon: const Icon(Icons.lightbulb_outline, color: Colors.white),
                  label: const Text("Hint",
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(question['hint'],
                    style: const TextStyle(fontSize: 16)),
              ),

            const SizedBox(height: 20),

            // EXPLANATION
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
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
                onPressed: answerChecked ? nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1
                      ? "Finish"
                      : "Next Question",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
