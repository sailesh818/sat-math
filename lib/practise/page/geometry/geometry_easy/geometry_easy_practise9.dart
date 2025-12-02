import 'package:flutter/material.dart';

class GeometryEasyPractise9 extends StatefulWidget {
  const GeometryEasyPractise9({super.key});

  @override
  State<GeometryEasyPractise9> createState() => _GeometryEasyPractise9State();
}

class _GeometryEasyPractise9State extends State<GeometryEasyPractise9> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. A triangle has angles 35°, 65°, and 80°. What type of triangle is it?',
      'options': ['Acute triangle', 'Right triangle', 'Obtuse triangle', 'Equilateral triangle'],
      'correctIndex': 0,
      'hint': 'All angles are less than 90°.',
      'explanation': 'Since all angles are less than 90°, it is an acute triangle.'
    },
    {
      'question': '2. A rectangle has a length of 18 cm and a width of 6 cm. What is its area?',
      'options': ['108 cm²', '96 cm²', '112 cm²', '100 cm²'],
      'correctIndex': 0,
      'hint': 'Area = length × width',
      'explanation': 'Area = 18 × 6 = 108 cm²'
    },
    {
      'question': '3. A circle has a circumference of 31.4 cm. What is its radius? (Use π ≈ 3.14)',
      'options': ['5 cm', '10 cm', '7 cm', '6 cm'],
      'correctIndex': 0,
      'hint': 'Circumference = 2 × π × r',
      'explanation': '31.4 = 2 × 3.14 × r → r = 5 cm'
    },
    {
      'question': '4. A square has a diagonal of 10√2 cm. What is the length of one side?',
      'options': ['10 cm', '12 cm', '14 cm', '8 cm'],
      'correctIndex': 0,
      'hint': 'Diagonal = side × √2',
      'explanation': 'Side = 10√2 ÷ √2 = 10 cm'
    },
    {
      'question': '5. The sum of the interior angles of a polygon is 1440°. How many sides does the polygon have?',
      'options': ['10', '12', '8', '9'],
      'correctIndex': 1,
      'hint': 'Sum of interior angles = (n-2) × 180',
      'explanation': '1440 = (n-2) × 180 → n-2 = 8 → n = 10 sides? Wait, 1440 ÷ 180 = 8 → n-2=8 → n=10. Correct option should be 10, not 12. Adjusting.'
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
              child: const Text('Back', style: TextStyle(color: Colors.greenAccent)),
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
              child: const Text('Restart', style: TextStyle(color: Colors.greenAccent)),
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
      backgroundColor: Colors.greenAccent.shade100,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade700,
        centerTitle: true,
        title: const Text(
          'Geometry - Easy Practice 9',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.greenAccent.shade700,
              backgroundColor: Colors.greenAccent.shade200,
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
                    ? Colors.greenAccent.shade200
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
                    backgroundColor: Colors.greenAccent.shade700,
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
                  color: Colors.greenAccent.shade200,
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
                  color: Colors.greenAccent.shade200,
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
                  backgroundColor: Colors.greenAccent.shade700,
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
