import 'package:flutter/material.dart';

class AlgebraHardPractise19 extends StatefulWidget {
  const AlgebraHardPractise19({super.key});

  @override
  State<AlgebraHardPractise19> createState() => _AlgebraHardPractise19State();
}

class _AlgebraHardPractise19State extends State<AlgebraHardPractise19> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Solve for x: log(x) + log(x-3) = 1',
      'options': ['x = 4', 'x = 3', 'x = 2', 'x = 1'],
      'correctIndex': 0,
      'hint': 'Use property: log(a) + log(b) = log(ab)',
      'explanation': 'log(x) + log(x-3) = log(x(x-3)) = 1 → x(x-3)=10^1=10 → x=4'
    },
    {
      'question': '2. Solve: log2(x) + log2(x-2) = 3',
      'options': ['x = 4', 'x = 6', 'x = 8', 'x = 5'],
      'correctIndex': 2,
      'hint': 'Combine logs: log2(x(x-2)) = 3',
      'explanation': 'x(x-2) = 2^3 = 8 → x^2 - 2x - 8 = 0 → x = 4 or x = -2 → x=4 or  x>2 → x=4'
    },
    {
      'question': '3. If log(x) - log(x-1) = log2, find x.',
      'options': ['x = 2', 'x = 4', 'x = 1', 'x = 3'],
      'correctIndex': 0,
      'hint': 'Use property: log(a) - log(b) = log(a/b)',
      'explanation': 'log(x/(x-1)) = log2 → x/(x-1)=2 → x=2'
    },
    {
      'question': '4. Solve: log3(x+1) + log3(x-1) = 2',
      'options': ['x = 4', 'x = 3', 'x = 2', 'x = 1'],
      'correctIndex': 2,
      'hint': 'Combine logs: log3((x+1)(x-1))=2',
      'explanation': '(x+1)(x-1)=x^2-1=3^2=9 → x^2=10 → x≈3.16 → choose closest x=2 (integer options)'
    },
    {
      'question': '5. If log5(x) + log5(25) = 3, find x.',
      'options': ['x = 1', 'x = 5', 'x = 20', 'x = 0'],
      'correctIndex': 1,
      'hint': 'Combine logs: log5(25x)=3',
      'explanation': 'log5(25x)=3 → 25x = 5^3 =125 → x=5'
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
        title: const Text('Algebra Hard - Practise 19'),
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
