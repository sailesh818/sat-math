import 'package:flutter/material.dart';

class GeometryMediumPractise14 extends StatefulWidget {
  const GeometryMediumPractise14({super.key});

  @override
  State<GeometryMediumPractise14> createState() => _GeometryMediumPractise14State();
}

class _GeometryMediumPractise14State extends State<GeometryMediumPractise14> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. A triangle has sides 8 cm, 15 cm, and 17 cm. What type of triangle is it?',
      'options': ['Right triangle', 'Acute triangle', 'Obtuse triangle', 'Isosceles triangle'],
      'correctIndex': 0,
      'hint': 'Use Pythagoras theorem: a² + b² = c²',
      'explanation': 'It’s a right triangle as 8² + 15² = 17².'
    },
    {
      'question': '2. A circle has a radius of 7 cm. What is its area? (Use π ≈ 3.14)',
      'options': ['153.86 cm²', '150 cm²', '160 cm²', '140 cm²'],
      'correctIndex': 0,
      'hint': 'Area of circle = π × radius²',
      'explanation': 'Area = 3.14 × 7² = 153.86 cm²'
    },
    {
      'question': '3. A rectangle has a length of 10 cm and width of 24 cm. What is the length of the diagonal?',
      'options': ['26 cm', '25 cm', '24 cm', '28 cm'],
      'correctIndex': 0,
      'hint': 'Diagonal = √(length² + width²)',
      'explanation': 'Diagonal = √(10² + 24²) = 26 cm'
    },
    {
      'question': '4. A parallelogram has a base of 18 cm and a height of 5 cm. What is its area?',
      'options': ['90 cm²', '85 cm²', '95 cm²', '100 cm²'],
      'correctIndex': 0,
      'hint': 'Area of parallelogram = base × height',
      'explanation': 'Area = 18 × 5 = 90 cm²'
    },
    {
      'question': '5. A regular pentagon has a perimeter of 50 cm. What is the length of one side?',
      'options': ['10 cm', '12 cm', '11 cm', '9 cm'],
      'correctIndex': 0,
      'hint': 'Perimeter of pentagon = 5 × side length',
      'explanation': 'Side length = 50 / 5 = 10 cm'
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
              child: const Text('Back', style: TextStyle(color: Colors.indigo)),
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
                  const Text('Restart', style: TextStyle(color: Colors.indigo)),
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
          'Geometry - Medium Practice 14',
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
                    ? Colors.indigo.shade200
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
                    backgroundColor: Colors.indigo,
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
                  color: Colors.indigo.shade100,
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
                  color: Colors.indigo.shade100,
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
                  backgroundColor: Colors.indigo,
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
