import 'package:flutter/material.dart';

class FunctionsMediumPractise19 extends StatefulWidget {
  const FunctionsMediumPractise19({super.key});

  @override
  State<FunctionsMediumPractise19> createState() =>
      _FunctionsMediumPractise19State();
}

class _FunctionsMediumPractise19State extends State<FunctionsMediumPractise19> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If f(x) = x² − x + 2, find f(3).',
      'options': ['8', '7', '6', '9'],
      'correctIndex': 0,
      'hint': 'Substitute x = 3 into f(x).',
      'explanation': 'f(3) = 9 − 3 + 2 = 8.'
    },
    {
      'question': '2. If f(x) = 2x + 1 and g(x) = x², find (g ∘ f)(2).',
      'options': ['16', '9', '25', '36'],
      'correctIndex': 2,
      'hint': 'Compute f(2) first, then square it for g.',
      'explanation': 'f(2) = 2*2 + 1 = 5 → g(5) = 25.'
    },
    {
      'question': '3. If f(x) = 3x − 4, find x such that f(x) = 11.',
      'options': ['4', '5', '6', '7'],
      'correctIndex': 1,
      'hint': 'Solve 3x − 4 = 11.',
      'explanation': '3x − 4 = 11 → 3x = 15 → x = 5.'
    },
    {
      'question': '4. If f(x) = 5x + 3, find the inverse function f⁻¹(x).',
      'options': ['(x − 3)/5', '(x + 3)/5', '(5x + 3)/1', '(x − 5)/3'],
      'correctIndex': 0,
      'hint': 'Swap x and y, then solve for y.',
      'explanation': 'y = 5x + 3 → x = 5y + 3 → y = (x − 3)/5.'
    },
    {
      'question': '5. If f(x) = x² − 6x + 8, find f(4).',
      'options': ['0', '2', '4', '8'],
      'correctIndex': 0,
      'hint': 'Substitute x = 4 into f(x).',
      'explanation': 'f(4) = 16 − 24 + 8 = 0.'
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
          title: const Text('🎯 Practice Complete'),
          content: Text('You have completed all questions!'),
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
          'Functions Medium - Practice 19',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// QUESTION
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

            /// OPTIONS
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

            /// HINT
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
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
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

            /// NEXT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
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
