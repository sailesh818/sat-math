import 'package:flutter/material.dart';

class AlgebraHardPractise3 extends StatefulWidget {
  const AlgebraHardPractise3({super.key});

  @override
  State<AlgebraHardPractise3> createState() => _AlgebraHardPractise3State();
}

class _AlgebraHardPractise3State extends State<AlgebraHardPractise3> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Solve using the quadratic formula: x^2 - 5x + 6 = 0',
      'options': ['x=2,3', 'x=-2, -3', 'x=1,6', 'x=-1, -6'],
      'correctIndex': 0,
      'hint': 'Use the formula x = [-b ± √(b²-4ac)] / 2a',
      'explanation': 'a=1, b=-5, c=6 ⇒ x = [5 ± √(25-24)]/2 ⇒ x=2 or x=3'
    },
    {
      'question': '2. Solve: 2x^2 - 7x + 3 = 0',
      'options': ['x=3/2,1', 'x=1,3/2', 'x=-1, -3/2', 'x=1,2'],
      'correctIndex': 0,
      'hint': 'Apply quadratic formula with a=2, b=-7, c=3',
      'explanation': 'x = [7 ± √(49-24)]/4 ⇒ x = 3/2 or 1'
    },
    {
      'question': '3. Solve: x^2 + x - 12 = 0',
      'options': ['x=3, -4', 'x=-3,4', 'x=4,-3', 'x=-4,3'],
      'correctIndex': 0,
      'hint': 'Factor or use quadratic formula',
      'explanation': 'x^2 + x - 12 = (x-3)(x+4)=0 ⇒ x=3 or -4'
    },
    {
      'question': '4. Solve: 3x^2 - 2x - 1 = 0',
      'options': ['x=1,-1/3', 'x=-1,1/3', 'x=1/3,-1', 'x=-1/3,1'],
      'correctIndex': 0,
      'hint': 'Use quadratic formula with a=3, b=-2, c=-1',
      'explanation': 'x = [2 ± √(4+12)]/6 ⇒ x=1 or -1/3'
    },
    {
      'question': '5. Solve: 5x^2 + x - 6 = 0',
      'options': ['x=1, -6/5', 'x=-1, 6/5', 'x=6/5, -1', 'x=-6/5,1'],
      'correctIndex': 0,
      'hint': 'Use quadratic formula: a=5, b=1, c=-6',
      'explanation': 'x = [-1 ± √(1+120)]/10 ⇒ x=1 or -6/5'
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
        title: const Text('Algebra Hard - Practise 3'),
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
