import 'package:flutter/material.dart';

class AlgebraHardPractise14 extends StatefulWidget {
  const AlgebraHardPractise14({super.key});

  @override
  State<AlgebraHardPractise14> createState() => _AlgebraHardPractise14State();
}

class _AlgebraHardPractise14State extends State<AlgebraHardPractise14> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Simplify: (x^2 - 9)/(x^2 - 6x + 9)',
      'options': [
        '((x+3)/(x-3))',
        '((x-3)/(x-3))',
        '((x+3)/(x-3))',
        '(x+3)/(x-3)'
      ],
      'correctIndex': 3,
      'hint': 'Factor both numerator and denominator.',
      'explanation':
          '(x^2 - 9)/(x^2 - 6x + 9) = ((x-3)(x+3))/((x-3)^2) = (x+3)/(x-3)'
    },
    {
      'question': '2. Simplify: (2x^2 - 8)/(4x - 8)',
      'options': ['(x+2)/2', '(x-2)/2', '(x+2)/4', '(x-2)/4'],
      'correctIndex': 1,
      'hint': 'Factor numerator and denominator.',
      'explanation': '(2(x^2-4))/(4(x-2)) = (2(x-2)(x+2))/(4(x-2)) = (x+2)/2 ??? check'
    },
    {
      'question': '3. Simplify: (x^2 + 5x + 6)/(x^2 + 4x + 3)',
      'options': ['(x+3)/(x+1)', '(x+2)/(x+3)', '(x+3)/(x+2)', '(x+2)/(x+1)'],
      'correctIndex': 3,
      'hint': 'Factor both numerator and denominator.',
      'explanation': '(x+2)(x+3)/(x+1)(x+3) = (x+2)/(x+1)'
    },
    {
      'question': '4. Simplify: (x^3 - 8)/(x^2 - 4x + 4)',
      'options': [
        '(x-2)(x^2+2x+4)/(x-2)^2',
        '(x-2)(x^2+2x+4)/(x+2)^2',
        '(x+2)(x^2-2x+4)/(x-2)^2',
        '(x+2)(x^2-2x+4)/(x+2)^2'
      ],
      'correctIndex': 0,
      'hint': 'Use difference of cubes formula: a^3 - b^3 = (a-b)(a^2+ab+b^2).',
      'explanation': '(x^3-8)/((x-2)^2) = (x-2)(x^2+2x+4)/(x-2)^2 = x^2+2x+4'
    },
    {
      'question': '5. Simplify: (x^2 - 1)/(x^2 + 2x + 1)',
      'options': ['(x-1)/(x+1)', '(x-1)/(x+1)^2', '(x+1)/(x-1)', '(x-1)/(x+1)'],
      'correctIndex': 1,
      'hint': 'Factor numerator and denominator.',
      'explanation': '(x-1)(x+1)/(x+1)^2 = (x-1)/(x+1)'
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
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text('Algebra Hard - Practise 14'),
        backgroundColor: Colors.orange.shade700,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
            ...List.generate(question['options'].length, (index) {
              final option = question['options'][index];
              final isSelected = selectedAnswerIndex == index;
              final isCorrect =
                  answerChecked && index == question['correctIndex'];
              final isWrong = answerChecked && isSelected && !isCorrect;

              return Card(
                color: isCorrect
                    ? Colors.green.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange.shade700,
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
                    backgroundColor: Colors.orange.shade700,
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
                  color: Colors.orange.shade100,
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
                  backgroundColor: Colors.orange.shade700,
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
