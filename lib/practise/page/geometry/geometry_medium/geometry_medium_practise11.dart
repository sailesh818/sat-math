import 'package:flutter/material.dart';

class GeometryMediumPractise11 extends StatefulWidget {
  const GeometryMediumPractise11({super.key});

  @override
  State<GeometryMediumPractise11> createState() =>
      _GeometryMediumPractise11State();
}

class _GeometryMediumPractise11State extends State<GeometryMediumPractise11> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. A triangle has sides 7 cm, 24 cm, and 25 cm. What type of triangle is it?',
      'options': [
        'Right triangle',
        'Acute triangle',
        'Obtuse triangle',
        'Equilateral triangle'
      ],
      'correctIndex': 0,
      'hint': 'Use Pythagoras theorem to check if it’s a right triangle.',
      'explanation': 'Since 7² + 24² = 49 + 576 = 625, and 625 = 25², it’s a right triangle.'
    },
    {
      'question':
          '2. A circle has a diameter of 16 cm. What is its circumference? (Use π ≈ 3.14)',
      'options': ['50.24 cm', '48 cm', '51 cm', '49.5 cm'],
      'correctIndex': 0,
      'hint': 'Circumference = π × diameter',
      'explanation': 'Circumference = 3.14 × 16 = 50.24 cm'
    },
    {
      'question':
          '3. A parallelogram has a base of 13 cm and height of 10 cm. What is its area?',
      'options': ['130 cm²', '120 cm²', '125 cm²', '135 cm²'],
      'correctIndex': 0,
      'hint': 'Area = base × height',
      'explanation': 'Area = 13 × 10 = 130 cm²'
    },
    {
      'question':
          '4. A rectangle has a length of 15 cm and width of 8 cm. What is the length of the diagonal?',
      'options': ['17 cm', '18 cm', '16 cm', '15 cm'],
      'correctIndex': 0,
      'hint': 'Use Pythagoras theorem: diagonal² = length² + width²',
      'explanation': 'Diagonal = √(15² + 8²) = √(225 + 64) = √289 = 17 cm'
    },
    {
      'question':
          '5. A regular hexagon has a perimeter of 48 cm. What is the length of one side?',
      'options': ['8 cm', '7 cm', '9 cm', '6 cm'],
      'correctIndex': 0,
      'hint': 'Side length = perimeter ÷ 6',
      'explanation': 'Side = 48 ÷ 6 = 8 cm'
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
          content: Text(
            'You completed ${questions.length} questions!',
            style: const TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
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
              child:
                  const Text('Restart', style: TextStyle(color: Colors.deepOrange)),
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
          'Geometry Medium - Practice 11',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.deepOrange,
              backgroundColor: Colors.deepOrange.shade100,
            ),
            const SizedBox(height: 20),

            // QUESTION
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
                    backgroundColor: Colors.deepOrange,
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
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
                    backgroundColor: Colors.deepOrange.shade400,
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
                  color: Colors.deepOrange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  question['hint'],
                  style: const TextStyle(fontSize: 16),
                ),
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
