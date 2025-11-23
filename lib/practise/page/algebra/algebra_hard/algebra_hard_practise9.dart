import 'package:flutter/material.dart';

class AlgebraHardPractise9 extends StatefulWidget {
  const AlgebraHardPractise9({super.key});

  @override
  State<AlgebraHardPractise9> createState() => _AlgebraHardPractise9State();
}

class _AlgebraHardPractise9State extends State<AlgebraHardPractise9> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Solve the inequality: x^2 - 5x + 6 < 0',
      'options': ['1 < x < 3', '2 < x < 3', 'x < 2 or x > 3', 'x > 1 and x < 2'],
      'correctIndex': 0,
      'hint': 'Factor the quadratic: x^2 -5x +6 = (x-2)(x-3). Determine where the product is negative.',
      'explanation': 'The inequality is negative between the roots: 1 < x < 3.'
    },
    {
      'question': '2. Solve: x^2 + x - 6 ≥ 0',
      'options': ['x ≤ -3 or x ≥ 2', 'x ≤ 2 or x ≥ -3', 'x < -3 or x > 2', 'x > -3 and x < 2'],
      'correctIndex': 0,
      'hint': 'Factor: x^2 + x -6 = (x+3)(x-2) and find intervals where the product is ≥ 0.',
      'explanation': 'Product ≥ 0 when x ≤ -3 or x ≥ 2.'
    },
    {
      'question': '3. Solve: -x^2 + 4x + 5 > 0',
      'options': ['x < -1 or x > 5', 'x > -1 and x < 5', 'x < 1 or x > -5', 'x > 1 and x < 5'],
      'correctIndex': 1,
      'hint': 'Multiply by -1 to get x^2 -4x -5 < 0, then factor and solve.',
      'explanation': 'Factor: (x-5)(x+1) < 0 ⇒ -1 < x < 5.'
    },
    {
      'question': '4. Solve: 2x^2 - 3x - 2 ≤ 0',
      'options': ['-0.5 ≤ x ≤ 2', '-2 ≤ x ≤ 0.5', 'x ≤ -0.5 or x ≥ 2', 'x < -2 or x > 0.5'],
      'correctIndex': 0,
      'hint': 'Factor or use quadratic formula to find roots, then check intervals for ≤ 0.',
      'explanation': 'Roots: x=-0.5 and x=2 ⇒ inequality holds for -0.5 ≤ x ≤ 2.'
    },
    {
      'question': '5. Solve: x^2 - 4x + 3 > 0',
      'options': ['x < 1 or x > 3', '1 < x < 3', 'x < -1 or x > 3', 'x > 1 and x < 3'],
      'correctIndex': 0,
      'hint': 'Factor: x^2-4x+3 = (x-1)(x-3). Solve where product > 0.',
      'explanation': 'The inequality is positive outside the roots: x < 1 or x > 3.'
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
          title: const Text('🎉 Completed!'),
          content: const Text('You have finished all questions.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text('Algebra Hard - Practise 9'),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
                    backgroundColor: Colors.blue,
                    child: Text("${index + 1}",
                        style: const TextStyle(color: Colors.white)),
                  ),
                  title: Text(option, style: const TextStyle(fontSize: 17)),
                  onTap: () => checkAnswer(index),
                ),
              );
            }),
            const SizedBox(height: 10),
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
                  label: const Text("Hint",
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ],
            ),
            if (showHint)
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                    Text(question['hint'], style: const TextStyle(fontSize: 16)),
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1
                      ? "Finish"
                      : "Next Question",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
