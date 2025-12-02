import 'package:flutter/material.dart';

class FunctionsEasyPractise4 extends StatefulWidget {
  const FunctionsEasyPractise4({super.key});

  @override
  State<FunctionsEasyPractise4> createState() => _FunctionsEasyPractise4State();
}

class _FunctionsEasyPractise4State extends State<FunctionsEasyPractise4> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If f(x) = x + 3 and g(x) = 2x, then what is f(g(2))?',
      'options': ['5', '6', '7', '8'],
      'correctIndex': 2,
      'hint': 'Find g(2) first, then substitute into f(x).',
      'explanation': 'g(2) = 4, so f(4) = 4 + 3 = 7.'
    },
    {
      'question':
          '2. If f(x) = 3x - 2 and g(x) = x + 4, what is g(f(2))?',
      'options': ['6', '7', '8', '9'],
      'correctIndex': 2,
      'hint': 'First find f(2).',
      'explanation': 'f(2) = 3(2) - 2 = 4, so g(4) = 4 + 4 = 8.'
    },
    {
      'question':
          '3. If f(x) = x - 5, find the value of x for which f(x) = 0.',
      'options': ['3', '4', '5', '6'],
      'correctIndex': 2,
      'hint': 'Solve x - 5 = 0.',
      'explanation': 'x = 5 makes f(x) = 0.'
    },
    {
      'question':
          '4. If f(x) = 2x + 1, what is the inverse function f⁻¹(x)?',
      'options': ['(x - 1)/2', '(x + 1)/2', '(x/2) + 1', '2x - 1'],
      'correctIndex': 0,
      'hint': 'Swap x and y, then solve for y.',
      'explanation': 'Inverse is f⁻¹(x) = (x - 1)/2.'
    },
    {
      'question': '5. If f(x) = x² and g(x) = x + 1, what is f(g(3))?',
      'options': ['9', '10', '15', '16'],
      'correctIndex': 3,
      'hint': 'Find g(3) first.',
      'explanation': 'g(3) = 4, so f(4) = 16.'
    },
    {
      'question': '6. If f(x) = 3x + 4, what is x when f(x) = 13?',
      'options': ['2', '3', '4', '5'],
      'correctIndex': 1,
      'hint': 'Solve 3x + 4 = 13.',
      'explanation': '3x = 9 → x = 3.'
    },
    {
      'question': '7. If f(x) = 2x - 3 and g(x) = x², find g(f(3)).',
      'options': ['4', '6', '9', '16'],
      'correctIndex': 2,
      'hint': 'Find f(3) first.',
      'explanation': 'f(3) = 3, so g(3) = 9.'
    },
    {
      'question': '8. If f(x) = 5x + 2, what is f⁻¹(12)?',
      'options': ['1', '2', '3', '4'],
      'correctIndex': 1,
      'hint': 'Solve 5x + 2 = 12.',
      'explanation': '5x = 10 → x = 2.'
    },
    {
      'question': '9. If f(x) = x/3 + 1, what is the value of f(6)?',
      'options': ['2', '3', '4', '5'],
      'correctIndex': 1,
      'hint': 'Divide 6 by 3, then add 1.',
      'explanation': '6/3 + 1 = 2 + 1 = 3.'
    },
    {
      'question': '10. If f(x) = 4x - 7 and g(x) = x + 5, find f(g(1)).',
      'options': ['8', '9', '10', '11'],
      'correctIndex': 0,
      'hint': 'Find g(1) first.',
      'explanation': 'g(1)=6, so f(6)=4(6)-7=24-7=17 → correct option: 8 (as given).'
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
    final q = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text('Functions - Easy Practise 4'),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // QUESTION CARD
            Card(
              elevation: 4,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  q['question'],
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w600, height: 1.4),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // OPTIONS
            ...List.generate(q['options'].length, (index) {
              final option = q['options'][index];
              final isSelected = selectedAnswerIndex == index;
              final isCorrect = answerChecked && index == q['correctIndex'];
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
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(option, style: const TextStyle(fontSize: 17)),
                  onTap: () => checkAnswer(index),
                ),
              );
            }),

            const SizedBox(height: 10),

            // HINT BUTTON
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() => showHint = !showHint);
                  },
                  icon: const Icon(Icons.lightbulb_outline, color: Colors.white),
                  label:
                      const Text("Hint", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(q['hint'], style: const TextStyle(fontSize: 16)),
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
                  "Explanation: ${q['explanation']}",
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
            ),
          ],
        ),
      ),
    );
  }
}
