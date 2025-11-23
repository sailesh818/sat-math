import 'package:flutter/material.dart';

class AlgebraMediumPractise18 extends StatefulWidget {
  const AlgebraMediumPractise18({super.key});

  @override
  State<AlgebraMediumPractise18> createState() =>
      _AlgebraMediumPractise18State();
}

class _AlgebraMediumPractise18State extends State<AlgebraMediumPractise18> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Solve: x² - 5x + 6 = 0',
      'options': ['x=2,3', 'x=1,6', 'x=2,4', 'x=3,5'],
      'correctIndex': 0,
      'hint': 'Look for two numbers that multiply to 6 and add to -5.',
      'explanation': 'x² - 5x + 6 = (x-2)(x-3) = 0 → x=2 or x=3'
    },
    {
      'question': '2. Solve: x² - 7x + 10 = 0',
      'options': ['x=2,5', 'x=5,2', 'x=3,4', 'x=1,10'],
      'correctIndex': 0,
      'hint': 'Find two numbers that multiply to 10 and add to -7.',
      'explanation': 'x² - 7x + 10 = (x-2)(x-5) = 0 → x=2 or x=5'
    },
    {
      'question': '3. Solve: x² - 8x + 15 = 0',
      'options': ['x=3,5', 'x=5,3', 'x=2,7', 'x=1,15'],
      'correctIndex': 0,
      'hint': 'Numbers multiply to 15 and add to -8.',
      'explanation': 'x² - 8x + 15 = (x-3)(x-5) = 0 → x=3 or x=5'
    },
    {
      'question': '4. Solve: x² - 9x + 20 = 0',
      'options': ['x=4,5', 'x=5,4', 'x=2,10', 'x=3,6'],
      'correctIndex': 0,
      'hint': 'Numbers multiply to 20 and add to -9.',
      'explanation': 'x² - 9x + 20 = (x-4)(x-5) = 0 → x=4 or x=5'
    },
    {
      'question': '5. Solve: x² - 6x + 8 = 0',
      'options': ['x=2,4', 'x=4,2', 'x=1,8', 'x=3,5'],
      'correctIndex': 0,
      'hint': 'Numbers multiply to 8 and add to -6.',
      'explanation': 'x² - 6x + 8 = (x-2)(x-4) = 0 → x=2 or x=4'
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
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text('Algebra Medium - Practise 18'),
        backgroundColor: Colors.green.shade700,
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
                    backgroundColor: Colors.green,
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
                  label: const Text(
                    "Hint",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
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
                  backgroundColor: Colors.green.shade700,
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
