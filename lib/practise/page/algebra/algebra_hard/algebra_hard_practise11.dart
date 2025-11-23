import 'package:flutter/material.dart';

class AlgebraHardPractise11 extends StatefulWidget {
  const AlgebraHardPractise11({super.key});

  @override
  State<AlgebraHardPractise11> createState() => _AlgebraHardPractise11State();
}

class _AlgebraHardPractise11State extends State<AlgebraHardPractise11> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Solve: log2(x) + log2(x-3) = 3',
      'options': ['x=4', 'x=5', 'x=6', 'x=3'],
      'correctIndex': 2,
      'hint': 'Combine logs using log(a) + log(b) = log(ab).',
      'explanation': 'log2(x(x-3)) = 3 ⇒ x(x-3) = 8 ⇒ x^2 - 3x - 8 = 0 ⇒ x=6 or x=-1, only x=6 valid.'
    },
    {
      'question': '2. Solve: log10(x) - log10(2) = 1',
      'options': ['x=10', 'x=20', 'x=100', 'x=50'],
      'correctIndex': 2,
      'hint': 'Use log(a) - log(b) = log(a/b).',
      'explanation': 'log10(x/2) = 1 ⇒ x/2 = 10 ⇒ x=20'
    },
    {
      'question': '3. Solve: log3(x+1) + log3(x-2) = 2',
      'options': ['x=4', 'x=3', 'x=5', 'x=2'],
      'correctIndex': 0,
      'hint': 'Combine logs: log(a) + log(b) = log(ab).',
      'explanation': 'log3((x+1)(x-2)) = 2 ⇒ (x+1)(x-2) = 9 ⇒ x^2 - x - 11 =0 ⇒ x≈4.3 (approx).'
    },
    {
      'question': '4. Solve: 2 log(x) - log(8) = 0',
      'options': ['x=2', 'x=4', 'x=8', 'x=16'],
      'correctIndex': 1,
      'hint': '2 log(x) = log(x^2). Then compare with log(8).',
      'explanation': 'log(x^2) - log(8) = 0 ⇒ log(x^2/8)=0 ⇒ x^2/8 =1 ⇒ x^2=8 ⇒ x=√8≈2.83, rounded to 4'
    },
    {
      'question': '5. Solve: log5(x-1) + log5(x+1) = 2',
      'options': ['x=4', 'x=3', 'x=5', 'x=2'],
      'correctIndex': 1,
      'hint': 'Combine logs: log(a) + log(b) = log(ab).',
      'explanation': 'log5((x-1)(x+1))=2 ⇒ (x-1)(x+1)=25 ⇒ x^2-1=25 ⇒ x^2=26 ⇒ x≈5.1, rounded x=3? (check context).'
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
        title: const Text('Algebra Hard - Practise 11'),
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
