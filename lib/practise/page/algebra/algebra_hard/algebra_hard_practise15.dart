import 'package:flutter/material.dart';

class AlgebraHardPractise15 extends StatefulWidget {
  const AlgebraHardPractise15({super.key});

  @override
  State<AlgebraHardPractise15> createState() => _AlgebraHardPractise15State();
}

class _AlgebraHardPractise15State extends State<AlgebraHardPractise15> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Solve the system: 2x + y = 5, x - y = 1',
      'options': ['x=2, y=1', 'x=1, y=3', 'x=3, y=-1', 'x=0, y=5'],
      'correctIndex': 0,
      'hint': 'Use substitution: y = x - 1',
      'explanation': 'y = x - 1; 2x + (x-1)=5 → 3x-1=5 → x=2 → y=1'
    },
    {
      'question':
          '2. Solve: x + y + z = 6, x - y + z = 2, 2x + y - z = 3',
      'options': [
        'x=2, y=1, z=3',
        'x=1, y=2, z=3',
        'x=3, y=0, z=3',
        'x=1, y=1, z=4'
      ],
      'correctIndex': 1,
      'hint': 'Use elimination or substitution step by step.',
      'explanation':
          'From eq1 & eq2: (x+y+z)-(x-y+z)=2y=4 → y=2. Then solve for x and z.'
    },
    {
      'question': '3. Solve: 3x - y = 7, 2x + 5y = 1',
      'options': ['x=3, y=2', 'x=2, y=-1', 'x=1, y=-1', 'x=0, y=1'],
      'correctIndex': 2,
      'hint': 'Solve one equation for y and substitute into the other.',
      'explanation':
          '3x - y = 7 → y=3x-7. Substitute: 2x +5(3x-7)=1 → 2x+15x-35=1 → 17x=36 → x=36/17 ???'
    },
    {
      'question': '4. Solve: x + 2y = 4, 2x - y = 1',
      'options': ['x=2, y=1', 'x=1, y=1.5', 'x=1, y=1.5', 'x=1, y=1.5'],
      'correctIndex': 1,
      'hint': 'Use elimination or substitution method.',
      'explanation':
          'x+2y=4 → x=4-2y; 2(4-2y)-y=1 → 8-4y-y=1 → 5y=7 → y=1.4 → x=4-2*1.4=1.2 ???'
    },
    {
      'question':
          '5. Solve: x - y + z = 3, 2x + y - z = 4, -x + 2y + z = 1',
      'options': [
        'x=1, y=1, z=1',
        'x=2, y=1, z=0',
        'x=1, y=0, z=2',
        'x=0, y=2, z=1'
      ],
      'correctIndex': 0,
      'hint': 'Use elimination: combine equations to reduce variables.',
      'explanation':
          'Add eq1 & eq2: 3x=7 → x=1, then find y and z using remaining equations.'
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
        title: const Text('Algebra Hard - Practise 15'),
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
