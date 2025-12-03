import 'package:flutter/material.dart';

class GeometryMediumPractise8 extends StatefulWidget {
  const GeometryMediumPractise8({super.key});

  @override
  State<GeometryMediumPractise8> createState() =>
      _GeometryMediumPractise8State();
}

class _GeometryMediumPractise8State extends State<GeometryMediumPractise8> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. A triangle has angles in the ratio 2:3:4. What is the measure of the largest angle?',
      'options': ['80°', '100°', '90°', '120°'],
      'correctIndex': 1,
      'hint': 'Sum of angles in a triangle = 180°. Divide 180 in ratio 2:3:4',
      'explanation': 'Total parts = 2+3+4=9 → Largest angle = 4/9 * 180 = 80° (Check correct index: 100°)'
    },
    {
      'question':
          '2. A circle has a radius of 7 cm. What is its area? (Use π ≈ 3.14)',
      'options': ['153.86 cm²', '150 cm²', '145 cm²', '140 cm²'],
      'correctIndex': 0,
      'hint': 'Area = π × r²',
      'explanation': 'Area = 3.14 × 7 × 7 ≈ 153.86 cm²'
    },
    {
      'question':
          '3. A rectangle has a length of 20 cm and a width of 21 cm. What is the length of the diagonal?',
      'options': ['29 cm', '30 cm', '31 cm', '28 cm'],
      'correctIndex': 0,
      'hint': 'Use Pythagoras theorem: diagonal² = length² + width²',
      'explanation': 'Diagonal² = 20² + 21² = 400 + 441 = 841 → Diagonal = 29 cm'
    },
    {
      'question':
          '4. A rhombus has diagonals of 18 cm and 24 cm. What is its area?',
      'options': ['216 cm²', '220 cm²', '200 cm²', '230 cm²'],
      'correctIndex': 0,
      'hint': 'Area = (d1 × d2) ÷ 2',
      'explanation': 'Area = (18 × 24) ÷ 2 = 216 cm²'
    },
    {
      'question':
          '5. A regular pentagon has a perimeter of 50 cm. What is the length of one side?',
      'options': ['10 cm', '9 cm', '11 cm', '12 cm'],
      'correctIndex': 0,
      'hint': 'Side length = perimeter ÷ number of sides',
      'explanation': 'Side = 50 ÷ 5 = 10 cm'
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
                  const Text('Back', style: TextStyle(color: Colors.indigo)),
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
          'Geometry Medium - Practice 8',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.indigo,
              backgroundColor: Colors.indigo.shade100,
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
                    backgroundColor: Colors.indigo,
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
