import 'package:flutter/material.dart';

class AlgebraHardPractise7 extends StatefulWidget {
  const AlgebraHardPractise7({super.key});

  @override
  State<AlgebraHardPractise7> createState() => _AlgebraHardPractise7State();
}

class _AlgebraHardPractise7State extends State<AlgebraHardPractise7> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Solve the system: \n x + y + z = 6\n 2x - y + z = 3\n x + 2y - z = 4',
      'options': ['x=1,y=2,z=3', 'x=2,y=1,z=3', 'x=3,y=2,z=1', 'x=1,y=3,z=2'],
      'correctIndex': 0,
      'hint': 'Try eliminating one variable at a time using addition or subtraction.',
      'explanation': 'Eliminate z: (1)+(2)-(3) ⇒ solve for x, y, then z ⇒ x=1, y=2, z=3'
    },
    {
      'question': '2. Solve: \n x + y + z = 9\n 2x - y + 3z = 16\n 3x + 2y - z = 5',
      'options': ['x=3,y=2,z=4', 'x=2,y=3,z=4', 'x=4,y=2,z=3', 'x=3,y=4,z=2'],
      'correctIndex': 1,
      'hint': 'Use elimination or substitution to reduce to two equations with two variables.',
      'explanation': 'Solve first two for x,y in terms of z then plug into third ⇒ x=2, y=3, z=4'
    },
    {
      'question': '3. Solve: \n x + 2y + z = 7\n 2x + y + 3z = 14\n 3x - y + z = 8',
      'options': ['x=2,y=1,z=2', 'x=1,y=2,z=2', 'x=2,y=2,z=1', 'x=1,y=1,z=3'],
      'correctIndex': 2,
      'hint': 'Eliminate one variable, then solve the remaining two-variable system.',
      'explanation': 'Eliminate y: solve x and z ⇒ then back-substitute to find y ⇒ x=2,y=2,z=1'
    },
    {
      'question': '4. Solve: \n x + y - z = 2\n 2x - y + z = 3\n x - 2y + 3z = 5',
      'options': ['x=2,y=1,z=1', 'x=1,y=2,z=1', 'x=1,y=1,z=2', 'x=2,y=2,z=0'],
      'correctIndex': 1,
      'hint': 'Use elimination to reduce the system step by step.',
      'explanation': 'Combine first two equations to eliminate z, then solve for x and y, finally z ⇒ x=1,y=2,z=1'
    },
    {
      'question': '5. Solve: \n 3x + y - z = 4\n x - y + 2z = 3\n 2x + 2y + z = 7',
      'options': ['x=1,y=2,z=1', 'x=2,y=1,z=1', 'x=1,y=1,z=2', 'x=2,y=2,z=1'],
      'correctIndex': 0,
      'hint': 'Reduce the system by eliminating variables in pairs.',
      'explanation': 'Eliminate y: solve x and z, then back-substitute to find y ⇒ x=1,y=2,z=1'
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
        title: const Text('Algebra Hard - Practise 7'),
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
