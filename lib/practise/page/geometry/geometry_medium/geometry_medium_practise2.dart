import 'package:flutter/material.dart';

class GeometryMediumPractise2 extends StatefulWidget {
  const GeometryMediumPractise2({super.key});

  @override
  State<GeometryMediumPractise2> createState() =>
      _GeometryMediumPractise2State();
}

class _GeometryMediumPractise2State extends State<GeometryMediumPractise2> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. A right triangle has one leg measuring 9 cm and a hypotenuse of 15 cm. What is the length of the other leg?',
      'options': ['12 cm', '10 cm', '13 cm', '11 cm'],
      'correctIndex': 0,
      'hint': 'Use Pythagoras theorem: a² + b² = c²',
      'explanation': 'Other leg² = 15² − 9² = 225 − 81 = 144 → √144 = 12 cm'
    },
    {
      'question': '2. A circle has a radius of 7 cm. What is its area? (Use π ≈ 3.14)',
      'options': ['153.86 cm²', '140 cm²', '150 cm²', '145 cm²'],
      'correctIndex': 0,
      'hint': 'Area A = π × r²',
      'explanation': 'A = 3.14 × 7 × 7 = 153.86 cm²'
    },
    {
      'question':
          '3. In a trapezoid, the two bases are 8 cm and 12 cm, and the height is 5 cm. What is its area?',
      'options': ['50 cm²', '55 cm²', '60 cm²', '45 cm²'],
      'correctIndex': 0,
      'hint': 'Area = 1/2 × (sum of bases) × height',
      'explanation': 'Area = 1/2 × (8 + 12) × 5 = 50 cm²'
    },
    {
      'question':
          '4. A square and a circle have the same perimeter of 40 cm. What is the side length of the square?',
      'options': ['10 cm', '8 cm', '12 cm', '9 cm'],
      'correctIndex': 0,
      'hint': 'Perimeter of square = 4 × side',
      'explanation': 'Side = 40 ÷ 4 = 10 cm'
    },
    {
      'question': '5. A polygon has 12 sides. What is the sum of its interior angles?',
      'options': ['1800°', '1620°', '1500°', '1440°'],
      'correctIndex': 0,
      'hint': 'Sum = (n − 2) × 180°',
      'explanation': 'Sum = (12 − 2) × 180 = 1800°'
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
          'Geometry Medium - Practice 2',
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
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
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
                    backgroundColor: Colors.indigo.shade400,
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
                  color: Colors.indigo.shade100,
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
