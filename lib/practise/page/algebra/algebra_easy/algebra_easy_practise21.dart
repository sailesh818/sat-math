import 'package:flutter/material.dart';

class AlgebraEasyPractise21 extends StatefulWidget {
  const AlgebraEasyPractise21({super.key});

  @override
  State<AlgebraEasyPractise21> createState() => _AlgebraEasyPractise21State();
}

class _AlgebraEasyPractise21State extends State<AlgebraEasyPractise21> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Factorize: x² + 5x + 6',
      'options': ['(x + 2)(x + 3)', '(x + 1)(x + 6)', '(x + 3)(x + 3)', '(x + 2)(x + 2)'],
      'correctIndex': 0,
      'hint': 'Find two numbers that multiply to 6 and add to 5.',
      'explanation': '(x + 2)(x + 3) because 2×3=6 and 2+3=5'
    },
    {
      'question': '2. Factorize: x² + 7x + 10',
      'options': ['(x + 5)(x + 2)', '(x + 10)(x + 1)', '(x + 3)(x + 4)', '(x + 2)(x + 5)'],
      'correctIndex': 0,
      'hint': 'Two numbers multiply to 10 and sum to 7.',
      'explanation': '(x + 5)(x + 2) because 5×2=10 and 5+2=7'
    },
    {
      'question': '3. Factorize: x² + 8x + 15',
      'options': ['(x + 5)(x + 3)', '(x + 1)(x + 15)', '(x + 3)(x + 5)', '(x + 2)(x + 6)'],
      'correctIndex': 0,
      'hint': 'Two numbers multiply to 15 and add to 8.',
      'explanation': '(x + 5)(x + 3) because 5×3=15 and 5+3=8'
    },
    {
      'question': '4. Factorize: x² + 6x + 9',
      'options': ['(x + 3)(x + 3)', '(x + 9)(x + 1)', '(x + 2)(x + 4)', '(x + 1)(x + 6)'],
      'correctIndex': 0,
      'hint': 'Perfect square trinomial: a² + 2ab + b² = (a + b)²',
      'explanation': '(x + 3)(x + 3) because 3×3=9 and 3+3=6'
    },
    {
      'question': '5. Factorize: x² + 9x + 20',
      'options': ['(x + 4)(x + 5)', '(x + 2)(x + 10)', '(x + 5)(x + 5)', '(x + 1)(x + 20)'],
      'correctIndex': 0,
      'hint': 'Two numbers multiply to 20 and sum to 9.',
      'explanation': '(x + 4)(x + 5) because 4×5=20 and 4+5=9'
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
          title: const Text('🎉 Well Done!'),
          content: const Text('You have completed all simple quadratic practise questions!'),
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
          'Algebra Easy - Practise 21',
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
