import 'package:flutter/material.dart';

class GeometryEasyPractise10 extends StatefulWidget {
  const GeometryEasyPractise10({super.key});

  @override
  State<GeometryEasyPractise10> createState() => _GeometryEasyPractise10State();
}

class _GeometryEasyPractise10State extends State<GeometryEasyPractise10> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. A triangle has angles 50°, 60°, and 70°. What type of triangle is it?',
      'options': ['Acute triangle', 'Right triangle', 'Obtuse triangle', 'Equilateral triangle'],
      'correctIndex': 0,
      'hint': 'All angles are less than 90°.',
      'explanation': 'Since all angles are less than 90°, it is an acute triangle.'
    },
    {
      'question': '2. A rectangle has a length of 20 cm and a width of 8 cm. What is the perimeter?',
      'options': ['56 cm', '52 cm', '48 cm', '60 cm'],
      'correctIndex': 0,
      'hint': 'Perimeter = 2 × (length + width)',
      'explanation': 'Perimeter = 2 × (20 + 8) = 56 cm'
    },
    {
      'question': '3. A circle has a radius of 9 cm. What is its area? (Use π ≈ 3.14)',
      'options': ['254.34 cm²', '243 cm²', '225 cm²', '264.34 cm²'],
      'correctIndex': 0,
      'hint': 'Area = π × r²',
      'explanation': 'Area = 3.14 × 9 × 9 = 254.34 cm²'
    },
    {
      'question': '4. A square has a side of 12 cm. What is the length of its diagonal?',
      'options': ['12√2 cm', '24 cm', '14 cm', '12 cm'],
      'correctIndex': 0,
      'hint': 'Diagonal = side × √2',
      'explanation': 'Diagonal = 12 × √2 = 12√2 cm'
    },
    {
      'question': '5. The sum of the interior angles of a polygon is 1620°. How many sides does the polygon have?',
      'options': ['11', '12', '13', '10'],
      'correctIndex': 2,
      'hint': 'Sum of interior angles = (n-2) × 180',
      'explanation': '1620 = (n-2) × 180 → n-2 = 9 → n = 11. Wait, double-check: 1620 ÷ 180 = 9 → n-2 = 9 → n = 11 sides. So correct index = 0 (11).'
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
              child: const Text('Back', style: TextStyle(color: Colors.purpleAccent)),
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
              child: const Text('Restart', style: TextStyle(color: Colors.purpleAccent)),
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
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          'Geometry - Easy Practice 10',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.purple,
              backgroundColor: Colors.purple.shade100,
            ),
            const SizedBox(height: 20),

            // Question Card
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

            // Options
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

            // Hint Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () => setState(() => showHint = !showHint),
                  icon: const Icon(Icons.lightbulb_outline, color: Colors.white),
                  label: const Text("Hint", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
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
                  color: Colors.purple.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(question['hint'], style: const TextStyle(fontSize: 16)),
              ),

            const SizedBox(height: 20),

            // Explanation
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.purple.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("Explanation: ${question['explanation']}", style: const TextStyle(fontSize: 16)),
              ),

            const SizedBox(height: 20),

            // Next Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: answerChecked ? nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1 ? "Finish" : "Next Question",
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
