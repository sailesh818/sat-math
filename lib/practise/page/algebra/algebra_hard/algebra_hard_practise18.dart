import 'package:flutter/material.dart';

class AlgebraHardPractise18 extends StatefulWidget {
  const AlgebraHardPractise18({super.key});

  @override
  State<AlgebraHardPractise18> createState() => _AlgebraHardPractise18State();
}

class _AlgebraHardPractise18State extends State<AlgebraHardPractise18> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Identify the vertical asymptote of f(x) = (x+2)/(x^2 - 4)',
      'options': ['x = 2 and x = -2', 'x = -2 only', 'x = 2 only', 'x = 0'],
      'correctIndex': 0,
      'hint': 'Vertical asymptotes occur where denominator = 0',
      'explanation': 'x^2-4=0 → x=2, x=-2'
    },
    {
      'question': '2. Find the horizontal asymptote of f(x) = (3x^2 - 2)/(x^2 + 5)',
      'options': ['y = 3', 'y = 0', 'y = -2', 'y = 1'],
      'correctIndex': 0,
      'hint': 'Compare degrees of numerator and denominator',
      'explanation': 'Degree equal → ratio of leading coefficients → y=3/1=3'
    },
    {
      'question': '3. Determine vertical asymptotes of f(x) = 1/(x^2 - x - 6)',
      'options': ['x = 3 and x = -2', 'x = 2 and x = -3', 'x = 1 and x = -6', 'x = 0 and x = 6'],
      'correctIndex': 1,
      'hint': 'Factor denominator: x^2 - x -6 = (x-3)(x+2)?',
      'explanation': 'x^2 - x -6=(x-3)(x+2) → vertical asymptotes at x=3, x=-2'
    },
    {
      'question': '4. For f(x) = (2x+1)/(x-4), find the horizontal asymptote.',
      'options': ['y = 2', 'y = 0', 'y = 1', 'y = -1/4'],
      'correctIndex': 0,
      'hint': 'Degree numerator = degree denominator? use ratio of leading coefficients',
      'explanation': 'Degree equal → leading coefficients ratio = 2/1 = 2 → y=2'
    },
    {
      'question': '5. Identify the vertical asymptotes of f(x) = (x^2 - 1)/(x^2 - x - 2)',
      'options': ['x = 2 and x = -1', 'x = 1 and x = -2', 'x = -1 only', 'x = 2 only'],
      'correctIndex': 1,
      'hint': 'Set denominator = 0 → x^2 - x - 2 = 0',
      'explanation': 'x^2-x-2=(x-2)(x+1) → vertical asymptotes at x=2, x=-1'
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
        title: const Text('Algebra Hard - Practise 18'),
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
