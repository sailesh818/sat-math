import 'package:flutter/material.dart';

class AlgebraMediumPractise16 extends StatefulWidget {
  const AlgebraMediumPractise16({super.key});

  @override
  State<AlgebraMediumPractise16> createState() =>
      _AlgebraMediumPractise16State();
}

class _AlgebraMediumPractise16State extends State<AlgebraMediumPractise16> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Solve: |x + 3| = 7',
      'options': ['x=4,-10', 'x=3,-7', 'x=5,-8', 'x=6,-9'],
      'correctIndex': 0,
      'hint': 'Remember |A| = B → A = B or A = -B',
      'explanation': '|x + 3| = 7 → x + 3 = 7 or x + 3 = -7 → x = 4 or x = -10'
    },
    {
      'question': '2. Solve: |2x - 1| = 5',
      'options': ['x=3,-2', 'x=2,-1', 'x=1,3', 'x=4,-2'],
      'correctIndex': 0,
      'hint': 'Split into positive and negative cases.',
      'explanation': '2x - 1 = 5 or 2x - 1 = -5 → x = 3 or x = -2'
    },
    {
      'question': '3. Solve: |x - 4| = 6',
      'options': ['x=10,-2', 'x=8,-2', 'x=9,-1', 'x=7,-3'],
      'correctIndex': 0,
      'hint': 'Set x - 4 = 6 and x - 4 = -6',
      'explanation': 'x - 4 = 6 → x=10, x - 4 = -6 → x=-2'
    },
    {
      'question': '4. Solve: |3x + 2| = 11',
      'options': ['x=3,-13/3', 'x=2,-11/3', 'x=1,-10/3', 'x=4,-12/3'],
      'correctIndex': 0,
      'hint': 'Divide by 3 after isolating x.',
      'explanation': '3x + 2 = 11 → x=3, 3x + 2 = -11 → x=-13/3'
    },
    {
      'question': '5. Solve: |x - 5| = 9',
      'options': ['x=14,-4', 'x=13,-4', 'x=15,-5', 'x=12,-3'],
      'correctIndex': 0,
      'hint': 'Remember to consider both positive and negative cases.',
      'explanation': 'x - 5 = 9 → x=14, x - 5 = -9 → x=-4'
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
        title: const Text('Algebra Medium - Practise 16'),
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
                child: Text(question['hint'], style: const TextStyle(fontSize: 16)),
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
