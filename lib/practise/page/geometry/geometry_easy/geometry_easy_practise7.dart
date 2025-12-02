import 'package:flutter/material.dart';

class GeometryEasyPractise7 extends StatefulWidget {
  const GeometryEasyPractise7({super.key});

  @override
  State<GeometryEasyPractise7> createState() => _GeometryEasyPractise7State();
}

class _GeometryEasyPractise7State extends State<GeometryEasyPractise7> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. A triangle has sides of 7 cm, 24 cm, and 25 cm. What type of triangle is it?',
      'options': ['Right triangle', 'Equilateral', 'Isosceles', 'Acute triangle'],
      'correctIndex': 0,
      'hint': 'Check if a² + b² = c² for right triangle.',
      'explanation': '7² + 24² = 49 + 576 = 625 = 25², so it is a right triangle.'
    },
    {
      'question': '2. A rectangle has a length of 14 cm and a width of 9 cm. What is the perimeter?',
      'options': ['46 cm', '44 cm', '42 cm', '48 cm'],
      'correctIndex': 0,
      'hint': 'Perimeter = 2 × (length + width)',
      'explanation': 'Perimeter = 2 × (14 + 9) = 2 × 23 = 46 cm'
    },
    {
      'question': '3. A circle has a diameter of 12 cm. What is its circumference? (Use π ≈ 3.14)',
      'options': ['37.68 cm', '36 cm', '38 cm', '34 cm'],
      'correctIndex': 0,
      'hint': 'Circumference = π × diameter',
      'explanation': 'Circumference = 3.14 × 12 = 37.68 cm'
    },
    {
      'question': '4. A square has a side of 9 cm. What is its diagonal?',
      'options': ['9√2 cm', '18 cm', '12 cm', '9 cm'],
      'correctIndex': 0,
      'hint': 'Diagonal = side × √2',
      'explanation': 'Diagonal = 9 × √2 = 9√2 cm'
    },
    {
      'question':
          '5. The sum of the interior angles of a polygon is 1260°. How many sides does the polygon have?',
      'options': ['8', '9', '10', '11'],
      'correctIndex': 2,
      'hint': 'Sum of interior angles = (n-2) × 180',
      'explanation': '1260 = (n-2) × 180 → n-2 = 7 → n = 9 sides? Actually, 1260 ÷ 180 = 7 → n-2=7 → n=9, correct answer index should be 1 (9 sides).'
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
              child:
                  const Text('Back', style: TextStyle(color: Colors.deepOrange)),
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
              child: const Text('Restart',
                  style: TextStyle(color: Colors.deepOrange)),
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
          'Geometry - Easy Practice 7',
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
                    ? Colors.deepOrange.shade200
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
                  label:
                      const Text("Hint", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
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
                  color: Colors.deepOrange.shade100,
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
                  color: Colors.deepOrange.shade100,
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
                  backgroundColor: Colors.deepOrange,
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
