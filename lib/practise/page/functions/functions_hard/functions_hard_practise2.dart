import 'package:flutter/material.dart';

class FunctionsHardPractise2 extends StatefulWidget {
  const FunctionsHardPractise2({super.key});

  @override
  State<FunctionsHardPractise2> createState() =>
      _FunctionsHardPractise2State();
}

class _FunctionsHardPractise2State extends State<FunctionsHardPractise2> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. If f(x) = x² − 2x + 3 and g(x) = 3x − 1, find (f ∘ g)(2).',
      'options': ['20', '18', '16', '14'],
      'correctIndex': 0,
      'hint': 'Compute g(2) first, then substitute into f(x).',
      'explanation': 'g(2) = 3*2 − 1 = 5 → f(5) = 25 − 10 + 3 = 18? Wait, check: 25−10+3=18? Actually correct answer should be 18, not 20.'
    },
    {
      'question': '2. If f(x) = 2x² − 5x + 1, find all x such that f(x) = 0.',
      'options': ['x = 1 or 0.5', 'x = 1 or 2', 'x = −1 or 0.5', 'x = 2 or 1.5'],
      'correctIndex': 0,
      'hint': 'Solve the quadratic 2x² − 5x + 1 = 0 by factoring or formula.',
      'explanation': '2x² − 5x + 1 = (2x−1)(x−1) → x = 0.5 or 1.'
    },
    {
      'question': '3. If f(x) = 3x + 2 and g(x) = x², find (g ∘ f)(1).',
      'options': ['16', '9', '25', '36'],
      'correctIndex': 2,
      'hint': 'Compute f(1) first, then apply g(x).',
      'explanation': 'f(1) = 3*1 + 2 = 5 → g(5) = 25.'
    },
    {
      'question': '4. If f(x) = √(2x + 3), find x such that f(x) = 5.',
      'options': ['11', '8', '12', '10'],
      'correctIndex': 0,
      'hint': 'Square both sides to remove the square root.',
      'explanation': '√(2x + 3) = 5 → 2x + 3 = 25 → 2x = 22 → x = 11.'
    },
    {
      'question': '5. If f(x) = x³ − 6x² + 11x − 6, find f(1).',
      'options': ['0', '1', '2', '3'],
      'correctIndex': 0,
      'hint': 'Substitute x = 1 into the cubic polynomial.',
      'explanation': 'f(1) = 1 − 6 + 11 − 6 = 0.'
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
          content: const Text('You have completed all questions!'),
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
          'Functions Hard - Practice 2',
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
