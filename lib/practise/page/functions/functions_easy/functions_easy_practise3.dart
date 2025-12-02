import 'package:flutter/material.dart';

class FunctionsEasyPractise3 extends StatefulWidget {
  const FunctionsEasyPractise3({super.key});

  @override
  State<FunctionsEasyPractise3> createState() => _FunctionsEasyPractise3State();
}

class _FunctionsEasyPractise3State extends State<FunctionsEasyPractise3> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If f(x) = x + 10, what is f(5)?',
      'options': ['10', '12', '14', '15'],
      'correctIndex': 3,
      'hint': 'Add 10 to the value of x.',
      'explanation': 'f(5) = 5 + 10 = 15'
    },
    {
      'question': '2. If f(x) = 2x², what is f(3)?',
      'options': ['9', '12', '15', '18'],
      'correctIndex': 3,
      'hint': 'Square 3 first, then multiply by 2.',
      'explanation': 'f(3) = 2 × (3²) = 2 × 9 = 18'
    },
    {
      'question': '3. If f(x) = 6x - 2, what is f(4)?',
      'options': ['20', '22', '24', '26'],
      'correctIndex': 1,
      'hint': 'Multiply 4 by 6, then subtract 2.',
      'explanation': 'f(4) = 6×4 - 2 = 24 - 2 = 22'
    },
    {
      'question': '4. If f(x) = x / 5, what is f(25)?',
      'options': ['3', '4', '5', '6'],
      'correctIndex': 2,
      'hint': 'Divide 25 by 5.',
      'explanation': 'f(25) = 25 / 5 = 5'
    },
    {
      'question': '5. If f(x) = 7x + 1, what is f(0)?',
      'options': ['0', '1', '7', '-1'],
      'correctIndex': 1,
      'hint': 'Multiply x with 7, then add 1.',
      'explanation': 'f(0) = 7×0 + 1 = 1'
    },
    {
      'question': '6. If f(x) = x² + x, what is f(4)?',
      'options': ['12', '16', '20', '24'],
      'correctIndex': 2,
      'hint': 'Calculate 4² then add 4.',
      'explanation': 'f(4) = 16 + 4 = 20'
    },
    {
      'question': '7. If f(x) = 9 - x, find f(5).',
      'options': ['3', '4', '5', '6'],
      'correctIndex': 1,
      'hint': 'Subtract x from 9.',
      'explanation': 'f(5) = 9 - 5 = 4'
    },
    {
      'question': '8. If f(x) = 2x + 8, what is f(6)?',
      'options': ['18', '20', '22', '24'],
      'correctIndex': 1,
      'hint': 'Multiply 6 by 2, then add 8.',
      'explanation': 'f(6) = 12 + 8 = 20'
    },
    {
      'question': '9. If f(x) = x³, find f(2).',
      'options': ['4', '6', '8', '10'],
      'correctIndex': 2,
      'hint': 'Cube the number 2.',
      'explanation': 'f(2) = 2³ = 8'
    },
    {
      'question': '10. If f(x) = x² - 3x, what is f(5)?',
      'options': ['10', '15', '20', '25'],
      'correctIndex': 0,
      'hint': 'Use x² and 3x and subtract.',
      'explanation': 'f(5) = 25 - 15 = 10'
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
        title: const Text('Functions - Easy Practise 3'),
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

            /// QUESTION CARD
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

            /// OPTIONS
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

            /// HINT BUTTON
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

            /// EXPLANATION (after answer)
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

            /// NEXT BUTTON
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
