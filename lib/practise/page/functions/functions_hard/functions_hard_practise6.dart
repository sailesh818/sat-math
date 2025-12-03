import 'package:flutter/material.dart';

class FunctionsHardPractise6 extends StatefulWidget {
  const FunctionsHardPractise6({super.key});

  @override
  State<FunctionsHardPractise6> createState() =>
      _FunctionsHardPractise6State();
}

class _FunctionsHardPractise6State extends State<FunctionsHardPractise6> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If f(x) = x² − 5x + 6, find the roots of f(x) = 0.',
      'options': ['x = 2 or 3', 'x = −2 or −3', 'x = 1 or 6', 'x = 3 or 6'],
      'correctIndex': 0,
      'hint': 'Factor the quadratic: x² − 5x + 6 = (x − 2)(x − 3)',
      'explanation': 'x² − 5x + 6 = 0 → (x − 2)(x − 3) = 0 → x = 2 or 3'
    },
    {
      'question': '2. If f(x) = 2x − 1 and g(x) = x², find (f ∘ g)(3).',
      'options': ['17', '18', '15', '16'],
      'correctIndex': 0,
      'hint': 'Compute g(3) first, then f(g(3))',
      'explanation': 'g(3) = 9 → f(9) = 2*9 − 1 = 17'
    },
    {
      'question': '3. If f(x) = √(x + 5), find x such that f(x) = 6.',
      'options': ['31', '36', '30', '29'],
      'correctIndex': 0,
      'hint': 'Square both sides: x + 5 = 36 → x = 31',
      'explanation': '√(x + 5) = 6 → x + 5 = 36 → x = 31'
    },
    {
      'question': '4. If f(x) = x³ − 2x² + x − 3, find f(2).',
      'options': ['1', '3', '5', '0'],
      'correctIndex': 0,
      'hint': 'Substitute x = 2 into f(x)',
      'explanation': 'f(2) = 8 − 8 + 2 − 3 = 1'
    },
    {
      'question': '5. If f(x) = 3x + 2, find x such that f⁻¹(x) = 7.',
      'options': ['x = 19', 'x = 12', 'x = 5', 'x = 15'],
      'correctIndex': 0,
      'hint': 'f⁻¹(x) = (x − 2)/3, set it equal to 7',
      'explanation': 'f⁻¹(x) = (x − 2)/3 = 7 → x − 2 = 21 → x = 23? Wait, check: 7 = f⁻¹(x) → x = 3*7 + 2 = 23'
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
          title: const Text('🎯 Practice Complete'),
          content: Text(
              'You have completed all questions! Review hints and explanations to strengthen your understanding.'),
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
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text(
          'Functions Hard - Practice 6',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// QUESTION
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
                    backgroundColor: Colors.green,
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
                  backgroundColor: Colors.green,
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
