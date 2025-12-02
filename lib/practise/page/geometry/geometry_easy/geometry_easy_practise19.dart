import 'package:flutter/material.dart';

class GeometryEasyPractise19 extends StatefulWidget {
  const GeometryEasyPractise19({super.key});

  @override
  State<GeometryEasyPractise19> createState() => _GeometryEasyPractise19State();
}

class _GeometryEasyPractise19State extends State<GeometryEasyPractise19> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. A triangle has sides 5 cm, 12 cm, and 13 cm. What type of triangle is it?',
      'options': ['Right triangle', 'Equilateral', 'Isosceles', 'Acute triangle'],
      'correctIndex': 0,
      'hint': 'Use the Pythagoras theorem.',
      'explanation': '5² + 12² = 25 + 144 = 169 = 13², so it is a right triangle.'
    },
    {
      'question': '2. A rectangle has a length of 14 cm and a width of 6 cm. What is its area?',
      'options': ['84 cm²', '80 cm²', '78 cm²', '90 cm²'],
      'correctIndex': 0,
      'hint': 'Area = length × width',
      'explanation': 'Area = 14 × 6 = 84 cm²'
    },
    {
      'question': '3. A circle has a radius of 10 cm. What is its circumference? (Use π ≈ 3.14)',
      'options': ['62.8 cm', '60 cm', '64 cm', '61.4 cm'],
      'correctIndex': 0,
      'hint': 'Circumference = 2 × π × radius',
      'explanation': 'Circumference = 2 × 3.14 × 10 ≈ 62.8 cm'
    },
    {
      'question': '4. A square has an area of 81 cm². What is the length of its diagonal?',
      'options': ['9√2 cm', '18 cm', '10 cm', '12 cm'],
      'correctIndex': 0,
      'hint': 'Diagonal = side × √2, side = √area',
      'explanation': 'Side = √81 = 9 → Diagonal = 9 × √2 = 9√2 cm'
    },
    {
      'question': '5. The sum of the interior angles of a polygon is 1260°. How many sides does the polygon have?',
      'options': ['10', '11', '12', '9'],
      'correctIndex': 0,
      'hint': 'Sum = (n-2) × 180',
      'explanation': '1260 = (n-2) × 180 → n = 10 sides'
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
              child: const Text('Back', style: TextStyle(color: Colors.deepPurple)),
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
              child: const Text('Restart', style: TextStyle(color: Colors.deepPurple)),
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
          'Geometry - Easy Practise 19',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.deepPurple,
              backgroundColor: Colors.deepPurple.shade100,
            ),
            const SizedBox(height: 20),

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

            ...List.generate(question['options'].length, (index) {
              final option = question['options'][index];
              final isSelected = selectedAnswerIndex == index;
              final isCorrect = answerChecked && index == question['correctIndex'];
              final isWrong = answerChecked && isSelected && !isCorrect;

              return Card(
                color: isCorrect
                    ? Colors.green.shade200
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

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () => setState(() => showHint = !showHint),
                  icon: const Icon(Icons.lightbulb_outline, color: Colors.white),
                  label: const Text("Hint", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
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
                  color: Colors.deepPurple.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(question['hint'], style: const TextStyle(fontSize: 16)),
              ),

            const SizedBox(height: 20),

            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("Explanation: ${question['explanation']}", style: const TextStyle(fontSize: 16)),
              ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: answerChecked ? nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
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
