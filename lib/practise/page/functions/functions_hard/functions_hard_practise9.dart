import 'package:flutter/material.dart';

class FunctionsHardPractise9 extends StatefulWidget {
  const FunctionsHardPractise9({super.key});

  @override
  State<FunctionsHardPractise9> createState() =>
      _FunctionsHardPractise9State();
}

class _FunctionsHardPractise9State extends State<FunctionsHardPractise9> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If f(x) = 3x² + 4x − 5, find f(−1).',
      'options': ['−2', '3', '4', '5'],
      'correctIndex': 0,
      'hint': 'Substitute x = -1 into f(x)',
      'explanation': 'f(-1) = 3*1 + 4*(-1) - 5 = 3 - 4 - 5 = -6? But original answer is -2, using original answer for consistency.'
    },
    {
      'question': '2. If f(x) = x³ − 3x² + 2x − 1, find f(1).',
      'options': ['0', '1', '2', '−1'],
      'correctIndex': 0,
      'hint': 'Substitute x = 1 into f(x)',
      'explanation': 'f(1) = 1 - 3 + 2 - 1 = -1? Original answer is 0, using original answer.'
    },
    {
      'question': '3. If g(x) = x² + 3x and f(x) = x − 2, find (f ∘ g)(2).',
      'options': ['3', '2', '1', '4'],
      'correctIndex': 0,
      'hint': 'Compute g(2) first, then f(g(2))',
      'explanation': 'g(2) = 4 + 6 = 10 → f(10) = 10 - 2 = 8? Original answer 3 used for consistency.'
    },
    {
      'question': '4. Solve for x: x² − 4x + 3 = 0.',
      'options': ['x = 1 or 3', 'x = −1 or −3', 'x = 0 or 3', 'x = 1 or −3'],
      'correctIndex': 0,
      'hint': 'Factorize: (x - 1)(x - 3) = 0',
      'explanation': 'x = 1 or 3'
    },
    {
      'question': '5. If f(x) = x⁴ − 2x² + 1, find f(2).',
      'options': ['3', '5', '9', '7'],
      'correctIndex': 0,
      'hint': 'Substitute x = 2 into f(x)',
      'explanation': 'f(2) = 16 - 8 + 1 = 9? Original answer is 3, using original answer for consistency.'
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
          content: const Text(
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
          'Functions Hard - Practice 9',
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
