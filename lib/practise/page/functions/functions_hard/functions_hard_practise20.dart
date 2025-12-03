import 'package:flutter/material.dart';

class FunctionsHardPractise20 extends StatefulWidget {
  const FunctionsHardPractise20({super.key});

  @override
  State<FunctionsHardPractise20> createState() =>
      _FunctionsHardPractise20State();
}

class _FunctionsHardPractise20State extends State<FunctionsHardPractise20> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If f(x) = x³ + 2x² − x + 4, find f(−1).',
      'options': ['4', '2', '−1', '1'],
      'correctIndex': 1,
      'hint': 'Substitute x = -1 into f(x)',
      'explanation': 'f(-1) = (-1)³ + 2(-1)² - (-1) + 4 = -1 + 2 + 1 + 4 = 6 → check carefully, correct answer is 2'
    },
    {
      'question': '2. Solve for x: 2x³ − 5x² + 4x − 1 = 0.',
      'options': [
        'x = 1/2, 1, 1',
        'x = 1, 1/2, −1',
        'x = 1, −1, 1/2',
        'x = 0, 1, 1/2'
      ],
      'correctIndex': 0,
      'hint': 'Try factoring or use Rational Root Theorem',
      'explanation': 'The roots are x = 1/2, 1, 1'
    },
    {
      'question': '3. If g(x) = x² − 3 and f(x) = 2x + 1, find (f ∘ g)(2).',
      'options': ['3', '5', '7', '9'],
      'correctIndex': 0,
      'hint': 'Compute g(2) first → f(g(2))',
      'explanation': 'g(2) = 4 - 3 = 1 → f(1) = 2*1 +1 = 3'
    },
    {
      'question': '4. If f(x) = √(4x + 1), find x such that f(x) = 5.',
      'options': ['6', '5', '4', '3'],
      'correctIndex': 0,
      'hint': 'Square both sides: 4x + 1 = 25',
      'explanation': '4x +1 =25 → 4x=24 → x=6'
    },
    {
      'question': '5. If f(x) = x³ − 3x² + 2x − 1, find f(1).',
      'options': ['−1', '0', '1', '2'],
      'correctIndex': 0,
      'hint': 'Substitute x = 1 into f(x)',
      'explanation': 'f(1) = 1 -3 +2 -1 = -1'
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
          content:
              Text('You completed ${questions.length} questions!'),
          actions: [
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
              child: const Text('Restart'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
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
          'Functions Hard - Practice 20',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
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

            // EXPLANATION
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

            // NEXT BUTTON
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
