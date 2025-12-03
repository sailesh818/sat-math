import 'package:flutter/material.dart';

class GeometryMediumPractise16 extends StatefulWidget {
  const GeometryMediumPractise16({super.key});

  @override
  State<GeometryMediumPractise16> createState() => _GeometryMediumPractise16State();
}

class _GeometryMediumPractise16State extends State<GeometryMediumPractise16> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. A triangle has sides 10 cm, 24 cm, and 26 cm. What type of triangle is it?',
      'options': ['Right triangle', 'Acute triangle', 'Obtuse triangle', 'Isosceles triangle'],
      'correctIndex': 0,
      'hint': 'The sides satisfy the Pythagorean theorem.',
      'explanation': 'This is a right triangle because 10² + 24² = 26².'
    },
    {
      'question': '2. A circle has a circumference of 31.4 cm. What is its radius? (Use π ≈ 3.14)',
      'options': ['5 cm', '4 cm', '6 cm', '7 cm'],
      'correctIndex': 0,
      'hint': 'Circumference = 2 × π × radius.',
      'explanation': 'Radius = 31.4 / (2 × 3.14) = 5 cm.'
    },
    {
      'question': '3. A rectangle has a length of 12 cm and width of 9 cm. What is the diagonal?',
      'options': ['15 cm', '14 cm', '13 cm', '16 cm'],
      'correctIndex': 0,
      'hint': 'Use the Pythagorean theorem: diagonal² = length² + width².',
      'explanation': 'Diagonal = √(12² + 9²) = √225 = 15 cm.'
    },
    {
      'question': '4. A parallelogram has a base of 20 cm and height of 6 cm. What is its area?',
      'options': ['120 cm²', '110 cm²', '130 cm²', '125 cm²'],
      'correctIndex': 0,
      'hint': 'Area of a parallelogram = base × height.',
      'explanation': 'Area = 20 × 6 = 120 cm².'
    },
    {
      'question': '5. A regular pentagon has a perimeter of 55 cm. What is the length of one side?',
      'options': ['11 cm', '10 cm', '12 cm', '13 cm'],
      'correctIndex': 0,
      'hint': 'Perimeter of a regular polygon = number of sides × length of one side.',
      'explanation': 'Side = 55 / 5 = 11 cm.'
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
              child: const Text('Restart', style: TextStyle(color: Colors.blue)),
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
          'Geometry - Medium Practice 16',
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
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  question['question'],
                  style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600, height: 1.4),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // OPTIONS
            ...List.generate(question['options'].length, (index) {
              final option = question['options'][index];
              final isSelected = selectedAnswerIndex == index;
              final isCorrect = answerChecked && index == question['correctIndex'];
              final isWrong = answerChecked && isSelected && !isCorrect;

              return Card(
                color: isCorrect
                    ? Colors.teal.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
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
                  label: const Text("Hint", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
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
                child: Text(question['hint'], style: const TextStyle(fontSize: 16)),
              ),

            const SizedBox(height: 20),

            // EXPLANATION
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
                onPressed: answerChecked ? nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1 ? "Finish" : "Next Question",
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
