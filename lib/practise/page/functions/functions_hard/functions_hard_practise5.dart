import 'package:flutter/material.dart';

class FunctionsHardPractise5 extends StatefulWidget {
  const FunctionsHardPractise5({super.key});

  @override
  State<FunctionsHardPractise5> createState() =>
      _FunctionsHardPractise5State();
}

class _FunctionsHardPractise5State extends State<FunctionsHardPractise5> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If f(x) = 2x² + 3x − 5, find f(2).',
      'options': ['9', '7', '5', '6'],
      'correctIndex': 0,
      'hint': 'Compute 2*2² + 3*2 − 5',
      'explanation': 'f(2) = 2*4 + 6 − 5 = 8 + 6 − 5 = 9'
    },
    {
      'question': '2. If f(x) = x² − 6x + 8, solve f(x) = 0.',
      'options': ['x = 2 or 4', 'x = 1 or 8', 'x = −2 or 4', 'x = 3 or 2'],
      'correctIndex': 0,
      'hint': 'Factor the quadratic: x² − 6x + 8 = (x − 2)(x − 4)',
      'explanation': 'x² − 6x + 8 = 0 → (x − 2)(x − 4) = 0 → x = 2 or 4'
    },
    {
      'question': '3. If f(x) = 3x + 2 and g(x) = x² − 1, find (g ∘ f)(1).',
      'options': ['24', '16', '12', '8'],
      'correctIndex': 1,
      'hint': 'Compute f(1) first, then g(f(1))',
      'explanation': 'f(1) = 3*1 + 2 = 5 → g(5) = 25 − 1 = 24'
    },
    {
      'question': '4. If f(x) = √(3x + 1), find x such that f(x) = 4.',
      'options': ['5', '6', '7', '8'],
      'correctIndex': 0,
      'hint': 'Square both sides: 3x + 1 = 16 → x = 5',
      'explanation': '√(3x + 1) = 4 → 3x + 1 = 16 → x = 5'
    },
    {
      'question': '5. If f(x) = x³ − 2x² + x − 1, find f(1).',
      'options': ['−1', '0', '1', '2'],
      'correctIndex': 0,
      'hint': 'Substitute x = 1 into the cubic expression',
      'explanation': 'f(1) = 1 − 2 + 1 − 1 = −1'
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
          'Functions Hard - Practice 5',
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
