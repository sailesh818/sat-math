import 'package:flutter/material.dart';

class FunctionsEasyPractise2 extends StatefulWidget {
  const FunctionsEasyPractise2({super.key});

  @override
  State<FunctionsEasyPractise2> createState() => _FunctionsEasyPractise2State();
}

class _FunctionsEasyPractise2State extends State<FunctionsEasyPractise2> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If f(x) = x + 5, what is f(3)?',
      'options': ['5', '7', '8', '9'],
      'correctIndex': 2,
      'hint': 'Substitute x = 3 into the function.',
      'explanation': 'f(3) = 3 + 5 = 8'
    },
    {
      'question': '2. If f(x) = 4x, what is f(6)?',
      'options': ['10', '20', '24', '26'],
      'correctIndex': 2,
      'hint': 'Multiply 6 by 4.',
      'explanation': 'f(6) = 4 × 6 = 24'
    },
    {
      'question': '3. If f(x) = x² + 2, what is f(3)?',
      'options': ['9', '10', '11', '12'],
      'correctIndex': 2,
      'hint': 'Square 3 first, then add 2.',
      'explanation': 'f(3) = 3² + 2 = 9 + 2 = 11'
    },
    {
      'question': '4. If f(x) = 2x - 1, find f(7).',
      'options': ['13', '14', '15', '12'],
      'correctIndex': 0,
      'hint': 'Multiply 7 by 2 then subtract 1.',
      'explanation': 'f(7) = 2(7) - 1 = 14 - 1 = 13'
    },
    {
      'question': '5. If f(x) = x / 4, what is f(12)?',
      'options': ['2', '3', '4', '6'],
      'correctIndex': 1,
      'hint': 'Divide 12 by 4.',
      'explanation': 'f(12) = 12/4 = 3'
    },
    {
      'question': '6. If f(x) = 3x + 2, what is f(0)?',
      'options': ['2', '0', '3', '-2'],
      'correctIndex': 0,
      'hint': 'Multiply 0 by 3 then add 2.',
      'explanation': 'f(0) = 3(0) + 2 = 2'
    },
    {
      'question': '7. If f(x) = x - 8, what is f(15)?',
      'options': ['5', '6', '7', '8'],
      'correctIndex': 2,
      'hint': 'Subtract 8 from 15.',
      'explanation': 'f(15) = 15 - 8 = 7'
    },
    {
      'question': '8. If f(x) = 5x, what is f(2)?',
      'options': ['7', '8', '9', '10'],
      'correctIndex': 3,
      'hint': 'Multiply 5 with 2.',
      'explanation': 'f(2) = 5 × 2 = 10'
    },
    {
      'question': '9. If f(x) = x², find f(8).',
      'options': ['16', '32', '64', '81'],
      'correctIndex': 2,
      'hint': 'Square the number 8.',
      'explanation': 'f(8) = 8² = 64'
    },
    {
      'question': '10. If f(x) = x + x, what is f(9)?',
      'options': ['9', '18', '27', '36'],
      'correctIndex': 1,
      'hint': 'x + x means 2x.',
      'explanation': 'f(9) = 9 + 9 = 18'
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
                child: const Text('OK')),
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
        title: const Text('Functions - Easy Practise 2'),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.green,
              backgroundColor: Colors.green.shade200,
            ),
            const SizedBox(height: 20),

            // QUESTION CARD
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w600, height: 1.4),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // OPTIONS
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
                    borderRadius: BorderRadius.circular(14)),
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

            const SizedBox(height: 12),

            // HINT BUTTON
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() => showHint = !showHint);
                  },
                  icon: const Icon(Icons.lightbulb_outline, color: Colors.white),
                  label: const Text("Hint",
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12)),
                ),
              ],
            ),

            if (showHint)
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                    Text(question['hint'], style: const TextStyle(fontSize: 16)),
              ),

            const SizedBox(height: 20),

            // EXPLANATION
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

            // NEXT BUTTON
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
