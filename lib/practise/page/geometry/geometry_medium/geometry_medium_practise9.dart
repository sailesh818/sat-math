import 'package:flutter/material.dart';

class GeometryMediumPractise9 extends StatefulWidget {
  const GeometryMediumPractise9({super.key});

  @override
  State<GeometryMediumPractise9> createState() =>
      _GeometryMediumPractise9State();
}

class _GeometryMediumPractise9State extends State<GeometryMediumPractise9> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. A triangle has sides of lengths 6 cm, 8 cm, and 10 cm. What type of triangle is it?',
      'options': [
        'Right triangle',
        'Equilateral triangle',
        'Isosceles triangle',
        'Scalene triangle'
      ],
      'correctIndex': 0,
      'hint': 'Check if Pythagoras theorem holds: a² + b² = c²',
      'explanation':
          '6² + 8² = 36 + 64 = 100 = 10² → This is a right triangle'
    },
    {
      'question':
          '2. A circle has a circumference of 31.4 cm. What is its radius? (Use π ≈ 3.14)',
      'options': ['5 cm', '4 cm', '6 cm', '7 cm'],
      'correctIndex': 0,
      'hint': 'Circumference = 2 × π × r',
      'explanation': 'r = 31.4 ÷ (2 × 3.14) = 5 cm'
    },
    {
      'question':
          '3. A parallelogram has a base of 14 cm and a height of 9 cm. What is its area?',
      'options': ['126 cm²', '120 cm²', '130 cm²', '110 cm²'],
      'correctIndex': 0,
      'hint': 'Area = base × height',
      'explanation': 'Area = 14 × 9 = 126 cm²'
    },
    {
      'question':
          '4. A rectangle has sides 12 cm and 16 cm. What is the length of its diagonal?',
      'options': ['20 cm', '18 cm', '22 cm', '24 cm'],
      'correctIndex': 0,
      'hint': 'Use Pythagoras theorem: diagonal² = length² + width²',
      'explanation': 'Diagonal² = 12² + 16² = 144 + 256 = 400 → Diagonal = 20 cm'
    },
    {
      'question':
          '5. A regular hexagon has a perimeter of 54 cm. What is the length of one side?',
      'options': ['9 cm', '8 cm', '10 cm', '12 cm'],
      'correctIndex': 0,
      'hint': 'Side length = perimeter ÷ number of sides',
      'explanation': 'Side = 54 ÷ 6 = 9 cm'
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
                  const Text('Back', style: TextStyle(color: Colors.purple)),
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
                  const Text('Restart', style: TextStyle(color: Colors.purple)),
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
          'Geometry Medium - Practice 9',
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
                    backgroundColor: Colors.purple,
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
                    backgroundColor: Colors.purple.shade400,
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
                  color: Colors.purple.shade100,
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
                  color: Colors.purple.shade100,
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
                  backgroundColor: Colors.purple,
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
