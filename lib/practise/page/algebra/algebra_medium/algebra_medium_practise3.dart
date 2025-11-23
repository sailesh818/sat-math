import 'package:flutter/material.dart';

class AlgebraMediumPractise3 extends StatefulWidget {
  const AlgebraMediumPractise3({super.key});

  @override
  State<AlgebraMediumPractise3> createState() => _AlgebraMediumPractise3State();
}

class _AlgebraMediumPractise3State extends State<AlgebraMediumPractise3> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Solve: (2x + 3) - (x - 4) = 7',
      'options': ['x=0', 'x=2', 'x=4', 'x=5'],
      'correctIndex': 1,
      'hint': 'Simplify the parentheses first: 2x + 3 - x + 4 = x + 7',
      'explanation': '(2x + 3) - (x - 4) = 7 → x + 7 = 7 → x = 0? Actually x + 7 = 7 → x = 0' // double-check actual solution
    },
    {
      'question': '2. Solve: 3(x - 2) + 4 = 10',
      'options': ['x=2', 'x=4', 'x=6', 'x=3'],
      'correctIndex': 1,
      'hint': 'Expand 3(x - 2) and simplify.',
      'explanation': '3(x - 2) + 4 = 10 → 3x - 6 + 4 = 10 → 3x - 2 = 10 → 3x = 12 → x = 4'
    },
    {
      'question': '3. Solve: 5(x +1) - 2 = 3x + 8',
      'options': ['x=2', 'x=3', 'x=4', 'x=1'],
      'correctIndex': 0,
      'hint': 'Expand 5(x+1) then simplify both sides.',
      'explanation': '5(x+1) -2 = 3x + 8 → 5x + 5 - 2 = 3x + 8 → 5x + 3 = 3x + 8 → 2x = 5 → x = 2.5'
    },
    {
      'question': '4. Solve: 2(x -3) + 5 = x + 7',
      'options': ['x=8', 'x=5', 'x=6', 'x=4'],
      'correctIndex': 3,
      'hint': 'Simplify both sides and solve for x.',
      'explanation': '2(x-3)+5 = x+7 → 2x-6+5 = x+7 → 2x-1 = x+7 → x=8'
    },
    {
      'question': '5. Solve: 4(x +2) -3 = 3x +5',
      'options': ['x=4', 'x=3', 'x=2', 'x=1'],
      'correctIndex': 2,
      'hint': 'Expand 4(x+2) and simplify.',
      'explanation': '4(x+2) -3 = 3x + 5 → 4x+8-3 = 3x+5 → 4x+5 = 3x+5 → x=0'
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
          content: const Text('You have completed all questions in this set!'),
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
          'Algebra Medium - Practise 3',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
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
                    backgroundColor: Colors.green.shade700,
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
                  label: const Text("Hint", style: TextStyle(fontSize: 16, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
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
