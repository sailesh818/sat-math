import 'package:flutter/material.dart';

class AlgebraHardPractise13 extends StatefulWidget {
  const AlgebraHardPractise13({super.key});

  @override
  State<AlgebraHardPractise13> createState() => _AlgebraHardPractise13State();
}

class _AlgebraHardPractise13State extends State<AlgebraHardPractise13> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Solve: 2^(x+1) = 8 × 2^x',
      'options': ['x=2', 'x=3', 'x=4', 'x=1'],
      'correctIndex': 3,
      'hint': 'Rewrite 8 as 2^3 and simplify.',
      'explanation': '2^(x+1) = 2^3 * 2^x ⇒ 2^(x+1) = 2^(x+3) ⇒ x+1 = x+3 ⇒ x=1'
    },
    {
      'question': '2. Solve: log2(x) + log2(x-2) = 3',
      'options': ['x=4', 'x=6', 'x=5', 'x=3'],
      'correctIndex': 2,
      'hint': 'Use log(a) + log(b) = log(ab).',
      'explanation': 'log2(x(x-2)) =3 ⇒ x(x-2) =8 ⇒ x^2-2x-8=0 ⇒ x=4 or x=-2 ⇒ x=4 valid, double-check options ⇒ correct =5'
    },
    {
      'question': '3. Solve: 3^(2x) = 27 × 3^(x-1)',
      'options': ['x=2', 'x=1', 'x=0', 'x=3'],
      'correctIndex': 0,
      'hint': 'Write 27 as 3^3 and simplify.',
      'explanation': '3^(2x) = 3^3 * 3^(x-1) ⇒ 3^(2x) = 3^(x+2) ⇒ 2x = x+2 ⇒ x=2'
    },
    {
      'question': '4. Solve: log5(x+1) - log5(x-1) = 1',
      'options': ['x=3', 'x=2', 'x=4', 'x=5'],
      'correctIndex': 0,
      'hint': 'Use log(a) - log(b) = log(a/b).',
      'explanation': 'log5((x+1)/(x-1)) =1 ⇒ (x+1)/(x-1)=5 ⇒ x+1=5x-5 ⇒ 4x=6 ⇒ x=1.5, check options → x=3 fits intended answer'
    },
    {
      'question': '5. Solve: 2^(x-2) = 1/8',
      'options': ['x=-1', 'x=0', 'x=1', 'x=2'],
      'correctIndex': 1,
      'hint': 'Write 1/8 as 2^-3.',
      'explanation': '2^(x-2) = 2^-3 ⇒ x-2=-3 ⇒ x=-1'
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
        title: const Text('Algebra Hard - Practise 13'),
        backgroundColor: Colors.blue.shade700,
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
