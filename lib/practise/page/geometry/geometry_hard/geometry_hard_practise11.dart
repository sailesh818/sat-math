import 'package:flutter/material.dart';

class GeometryHardPractise11 extends StatefulWidget {
  const GeometryHardPractise11({super.key});

  @override
  State<GeometryHardPractise11> createState() => _GeometryHardPractise11State();
}

class _GeometryHardPractise11State extends State<GeometryHardPractise11> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. A triangle has sides 10 cm, 24 cm, and 26 cm. What is its area?',
      'options': ['120 cm²', '115 cm²', '125 cm²', '110 cm²'],
      'correctIndex': 0,
      'hint': 'Use Heron\'s formula: Area = √[s(s-a)(s-b)(s-c)] where s = (a+b+c)/2.',
      'explanation': 's = (10 + 24 + 26)/2 = 30. Area = √[30*(30-10)*(30-24)*(30-26)] = √[30*20*6*4] = √14400 = 120 cm².',
    },
    {
      'question': '2. A circle has radius 13 cm. What is the circumference? (Use π ≈ 3.14)',
      'options': ['81.64 cm', '80 cm', '85 cm', '82 cm'],
      'correctIndex': 0,
      'hint': 'Circumference of a circle: C = 2πr.',
      'explanation': 'C = 2 * 3.14 * 13 = 81.64 cm.',
    },
    {
      'question': '3. A square has perimeter 40 cm. What is the length of its diagonal?',
      'options': ['10√2 cm', '8√2 cm', '12√2 cm', '9√2 cm'],
      'correctIndex': 0,
      'hint': 'Diagonal of a square: diagonal = side * √2. Side = perimeter / 4.',
      'explanation': 'Side = 40 / 4 = 10 cm. Diagonal = 10 * √2 = 10√2 cm.',
    },
    {
      'question': '4. A trapezoid has bases 14 cm and 22 cm, height 5 cm. What is its area?',
      'options': ['90 cm²', '85 cm²', '95 cm²', '100 cm²'],
      'correctIndex': 0,
      'hint': 'Area of trapezoid: A = 1/2 * (b₁ + b₂) * height.',
      'explanation': 'Area = 1/2 * (14 + 22) * 5 = 90 cm².',
    },
    {
      'question': '5. An equilateral triangle has side length 18 cm. What is its height?',
      'options': ['9√3 cm', '10√3 cm', '8√3 cm', '12 cm'],
      'correctIndex': 0,
      'hint': 'Height = (side * √3) / 2 for an equilateral triangle.',
      'explanation': 'Height = 18 * √3 / 2 = 9√3 cm.',
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
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: const Text(
          'Geometry - Hard Practise 11',
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
                    backgroundColor: Colors.cyan,
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
                  backgroundColor: Colors.cyan,
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
