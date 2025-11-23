import 'package:flutter/material.dart';

class AlgebraHardPractise6 extends StatefulWidget {
  const AlgebraHardPractise6({super.key});

  @override
  State<AlgebraHardPractise6> createState() => _AlgebraHardPractise6State();
}

class _AlgebraHardPractise6State extends State<AlgebraHardPractise6> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Solve: (x/2) + (3/x) = 5',
      'options': ['x=1,6', 'x=2,3', 'x=3,2', 'x=5, -1'],
      'correctIndex': 2,
      'hint': 'Multiply both sides by 2x to remove denominators.',
      'explanation': 'Multiply: x^2 + 6 = 10x ⇒ x^2 -10x +6=0 ⇒ x=3,2'
    },
    {
      'question': '2. Solve: (2/x) - (3/(x+1)) = 1',
      'options': ['x=-1, 3', 'x=1, -2', 'x=2, -1', 'x=3, -2'],
      'correctIndex': 1,
      'hint': 'Multiply through by x(x+1) to eliminate fractions.',
      'explanation': '2(x+1) - 3x = x(x+1) ⇒ 2x+2-3x = x^2+x ⇒ -x+2=x^2+x ⇒ x^2+2x-2=0 ⇒ solutions x=1, -2'
    },
    {
      'question': '3. Solve: (x+1)/(x-1) = 3/2',
      'options': ['x=5', 'x=-5', 'x=1', 'x=-1'],
      'correctIndex': 0,
      'hint': 'Cross multiply to solve.',
      'explanation': '(x+1)*2 = 3*(x-1) ⇒ 2x+2=3x-3 ⇒ x=5'
    },
    {
      'question': '4. Solve: (3x/(x+2)) - (2/(x+2)) = 1',
      'options': ['x=2', 'x=1', 'x=-1', 'x=-2'],
      'correctIndex': 1,
      'hint': 'Combine fractions and solve the resulting equation.',
      'explanation': '(3x-2)/(x+2)=1 ⇒ 3x-2=x+2 ⇒ 2x=4 ⇒ x=2'
    },
    {
      'question': '5. Solve: (x/(x-3)) + (2/(x+3)) = 1',
      'options': ['x=0', 'x=6', 'x=-6', 'x=3'],
      'correctIndex': 2,
      'hint': 'Multiply both sides by (x-3)(x+3) to eliminate denominators.',
      'explanation': 'x(x+3)+2(x-3) = (x-3)(x+3) ⇒ x^2+3x +2x-6 = x^2-9 ⇒ 5x-6=-9 ⇒ 5x=-3 ⇒ x=-6'
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
        title: const Text('Algebra Hard - Practise 6'),
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
