import 'package:flutter/material.dart';

class GeometryHardPractise10 extends StatefulWidget {
  const GeometryHardPractise10({super.key});

  @override
  State<GeometryHardPractise10> createState() => _GeometryHardPractise10State();
}

class _GeometryHardPractise10State extends State<GeometryHardPractise10> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. A triangle has sides 13 cm, 14 cm, and 15 cm. What is its area?',
      'options': ['84 cm²', '85 cm²', '90 cm²', '80 cm²'],
      'correctIndex': 0,
      'hint': 'Use Heron\'s formula to find the area of the triangle.',
      'explanation': 'Area = √(s(s-a)(s-b)(s-c)) where s = (a+b+c)/2, a = 13, b = 14, c = 15.',
    },
    {
      'question': '2. A circle has radius 9 cm. What is the area of a quarter circle? (Use π ≈ 3.14)',
      'options': ['63.585 cm²', '64 cm²', '60 cm²', '62 cm²'],
      'correctIndex': 0,
      'hint': 'Use the formula for area of a circle: A = πr². Then, divide the result by 4.',
      'explanation': 'Area = (π * 9²) / 4 = (3.14 * 81) / 4 = 63.585 cm².',
    },
    {
      'question': '3. A square has diagonal 10 cm. What is its area?',
      'options': ['50 cm²', '48 cm²', '52 cm²', '55 cm²'],
      'correctIndex': 0,
      'hint': 'Use the diagonal formula for a square: diagonal = side * √2.',
      'explanation': 'Side = diagonal / √2 = 10 / √2 ≈ 7.071 cm. Area = side² ≈ 50 cm².',
    },
    {
      'question': '4. A trapezoid has bases 12 cm and 20 cm with height 7 cm. What is its area?',
      'options': ['112 cm²', '110 cm²', '115 cm²', '120 cm²'],
      'correctIndex': 0,
      'hint': 'Use the trapezoid area formula: A = 1/2 * (b₁ + b₂) * height.',
      'explanation': 'Area = 1/2 * (12 + 20) * 7 = 112 cm².',
    },
    {
      'question': '5. An equilateral triangle has side length 16 cm. What is its height?',
      'options': ['8√3 cm', '9√3 cm', '7√3 cm', '10 cm'],
      'correctIndex': 0,
      'hint': 'Use the height formula for an equilateral triangle: height = (side * √3) / 2.',
      'explanation': 'Height = (16 * √3) / 2 = 8√3 cm.',
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
          title: const Text('🎉 Great Job!'),
          content: const Text('You have completed all practise questions!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
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
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: const Text(
          'Geometry - Hard Practise 10',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// QUESTION CARD
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// OPTIONS
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
                    backgroundColor: Colors.brown,
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

            /// HINT BUTTON
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
                    backgroundColor: Colors.orange,
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
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  question['hint'],
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Explanation: ${question['explanation']}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            /// NEXT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
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
