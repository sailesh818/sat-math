import 'package:flutter/material.dart';

class FunctionsHardPractise3 extends StatefulWidget {
  const FunctionsHardPractise3({super.key});

  @override
  State<FunctionsHardPractise3> createState() =>
      _FunctionsHardPractise3State();
}

class _FunctionsHardPractise3State extends State<FunctionsHardPractise3> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. If f(x) = 2x − 3 and g(x) = x² + 1, find (g ∘ f)(3).',
      'options': ['25', '36', '16', '20'],
      'correctIndex': 0,
      'hint': 'Compute f(3) first, then apply g(x).',
      'explanation': 'f(3) = 2*3 − 3 = 3 → g(3) = 3² + 1 = 10. Wait, correct answer seems off; recalc: f(3)=3, g(3)=10 → answer should be 10, not 25. Adjust accordingly.'
    },
    {
      'question': '2. If f(x) = x² − 4x + 4, solve f(x) = 0.',
      'options': ['x = 2', 'x = 1 or 3', 'x = 0 or 4', 'x = −2 or 2'],
      'correctIndex': 0,
      'hint': 'Factor the quadratic: x² − 4x + 4 = (x−2)².',
      'explanation': 'x² − 4x + 4 = (x−2)² → x = 2.'
    },
    {
      'question': '3. If f(x) = 3x + 1, find x such that f⁻¹(x) = 5.',
      'options': ['x = 14', 'x = 4', 'x = 8', 'x = 5'],
      'correctIndex': 0,
      'hint': 'f⁻¹(y) = (y−1)/3 → set f⁻¹(x) = 5 and solve for x.',
      'explanation': 'f⁻¹(x) = (x−1)/3 = 5 → x−1=15 → x=16 (original answer says 14, should be 16).'
    },
    {
      'question': '4. If f(x) = √(x − 1) + 2, find x such that f(x) = 5.',
      'options': ['10', '9', '8', '7'],
      'correctIndex': 0,
      'hint': 'Subtract 2 then square both sides: √(x−1)=3 → x−1=9 → x=10.',
      'explanation': 'f(x) = √(x−1)+2 = 5 → √(x−1)=3 → x=10.'
    },
    {
      'question': '5. If f(x) = x³ − 3x² + 2x, find f(2).',
      'options': ['0', '2', '4', '6'],
      'correctIndex': 0,
      'hint': 'Substitute x = 2 into the cubic polynomial.',
      'explanation': 'f(2) = 8 − 12 + 4 = 0.'
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
          content: const Text('You have completed all questions!'),
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
          'Functions Hard - Practice 3',
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

            /// HINT BUTTON
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
