import 'package:flutter/material.dart';

class AlgebraHardPractise1 extends StatefulWidget {
  const AlgebraHardPractise1({super.key});

  @override
  State<AlgebraHardPractise1> createState() => _AlgebraHardPractise1State();
}

class _AlgebraHardPractise1State extends State<AlgebraHardPractise1> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Solve the system of equations: 2x + 3y = 12, x - y = 1',
      'options': ['x=3, y=2', 'x=4, y=2', 'x=2, y=3', 'x=5, y=1'],
      'correctIndex': 0,
      'hint': 'Use substitution or elimination method.',
      'explanation':
          'From x - y = 1 ⇒ x = y + 1. Substitute into 2x + 3y = 12: 2(y+1) + 3y = 12 ⇒ 5y+2=12 ⇒ y=2 ⇒ x=3'
    },
    {
      'question': '2. Solve for x: x^2 - 7x + 10 = 0 using factoring',
      'options': ['x=5,2', 'x=1,10', 'x=3,4', 'x=2,5'],
      'correctIndex': 0,
      'hint': 'Factor as (x-5)(x-2)=0',
      'explanation': 'x^2 - 7x + 10 = (x-5)(x-2) ⇒ x=5 or x=2'
    },
    {
      'question': '3. Simplify: (x^2 - 9)/(x + 3)',
      'options': ['x - 3', 'x + 3', 'x^2 + 3', 'x - 9'],
      'correctIndex': 0,
      'hint': 'Factor numerator as difference of squares.',
      'explanation': 'x^2 - 9 = (x-3)(x+3). Divide by (x+3) ⇒ x-3'
    },
    {
      'question': '4. Solve: 3/(x-1) + 2 = 5',
      'options': ['x=2', 'x=3', 'x=4', 'x=1'],
      'correctIndex': 0,
      'hint': 'Subtract 2 and multiply by (x-1)',
      'explanation': '3/(x-1)+2=5 ⇒ 3/(x-1)=3 ⇒ x-1=1 ⇒ x=2'
    },
    {
      'question': '5. If 2x/3 - 4 = 2, find x',
      'options': ['x=9', 'x=8', 'x=7', 'x=6'],
      'correctIndex': 0,
      'hint': 'Add 4 and multiply by 3/2',
      'explanation': '2x/3 - 4 = 2 ⇒ 2x/3=6 ⇒ x=9'
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
        title: const Text('Algebra Hard - Practise 1'),
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
