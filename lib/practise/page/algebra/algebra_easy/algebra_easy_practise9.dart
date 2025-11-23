import 'package:flutter/material.dart';

class AlgebraEasyPractise9 extends StatefulWidget {
  const AlgebraEasyPractise9({super.key});

  @override
  State<AlgebraEasyPractise9> createState() => _AlgebraEasyPractise9State();
}

class _AlgebraEasyPractise9State extends State<AlgebraEasyPractise9> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  // 🔹 Topic: Word Problems (One-Step & Two-Step Equations)
  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Maria has 5 more than twice the number of apples as John. If Maria has 17 apples, how many does John have?',
      'options': ['6', '5', '12', '7'],
      'correctIndex': 0,
      'hint': 'Let John have x apples. Then 2x + 5 = 17.',
      'explanation': '2x + 5 = 17 → 2x = 12 → x = 6. John has 6 apples.'
    },
    {
      'question': '2. A number decreased by 7 equals 13. What is the number?',
      'options': ['20', '6', '7', '21'],
      'correctIndex': 0,
      'hint': 'Add 7 to both sides to find the number.',
      'explanation': 'x - 7 = 13 → x = 13 + 7 → x = 20.'
    },
    {
      'question':
          '3. The sum of three consecutive numbers is 39. What is the first number?',
      'options': ['12', '13', '11', '10'],
      'correctIndex': 2,
      'hint': 'Let the numbers be x, x+1, x+2.',
      'explanation': 'x + (x+1) + (x+2) = 39 → 3x + 3 = 39 → 3x = 36 → x = 12.'
    },
    {
      'question':
          '4. A rectangle’s length is 3 meters more than twice its width. If the perimeter is 36 meters, what is the width?',
      'options': ['6', '5', '4', '7'],
      'correctIndex': 1,
      'hint': 'Use the perimeter formula: 2(length + width) = 36.',
      'explanation':
          'Let width = x, length = 2x + 3 → 2(x + 2x +3) = 36 → 6x + 6 = 36 → 6x = 30 → x = 5.'
    },
    {
      'question':
          '5. A movie ticket costs 8. John buys 3 tickets and spends 2 less than twice what he had. How much did John have?',
      'options': ['14', '20', '22', '18'],
      'correctIndex': 2,
      'hint': 'Let John have x. Equation: 2x - 2 = 3 * 8.',
      'explanation': '2x - 2 = 24 → 2x = 26 → x = 13. Check carefully: 2x-2 = 24 → 2x=26 → x=13? Actually 2x-2=24 → x=13.'
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
          title: const Text('🎉 Great Job!'),
          content: const Text('You have completed all practise questions!'),
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
          'Algebra Easy - Practise 9',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// QUESTION CARD
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
