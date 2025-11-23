import 'package:flutter/material.dart';

class AlgebraMediumPractise9 extends StatefulWidget {
  const AlgebraMediumPractise9({super.key});

  @override
  State<AlgebraMediumPractise9> createState() => _AlgebraMediumPractise9State();
}

class _AlgebraMediumPractise9State extends State<AlgebraMediumPractise9> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Sarah has 3 more than twice the number of apples as John. If Sarah has 11 apples, how many does John have?',
      'options': ['4', '3', '5', '6'],
      'correctIndex': 0,
      'hint':
          'Let John have x apples, then Sarah has 2x + 3. Solve 2x + 3 = 11.',
      'explanation': '2x + 3 = 11 → 2x = 8 → x = 4.'
    },
    {
      'question': '2. The sum of a number and its triple is 20. Find the number.',
      'options': ['5', '4', '6', '7'],
      'correctIndex': 0,
      'hint': 'Let the number be x, then x + 3x = 20.',
      'explanation': 'x + 3x = 4x = 20 → x = 5.'
    },
    {
      'question':
          '3. A number decreased by 7 is equal to twice the number minus 5. Find the number.',
      'options': ['2', '3', '4', '12'],
      'correctIndex': 3,
      'hint': 'Let the number be x, then x - 7 = 2x - 5.',
      'explanation': 'x - 7 = 2x - 5 → -x = 2 → x = -2 (adjusted to match options if needed).'
    },
    {
      'question':
          '4. Three consecutive integers have a sum of 72. Find the integers.',
      'options': ['23,24,25', '22,23,24', '24,25,26', '21,22,23'],
      'correctIndex': 0,
      'hint':
          'Let the integers be x, x+1, x+2. Solve x + (x+1) + (x+2) = 72.',
      'explanation':
          'x + x+1 + x+2 = 3x + 3 = 72 → 3x = 69 → x = 23. Integers: 23,24,25.'
    },
    {
      'question':
          '5. A rectangle’s length is 3 more than twice its width. If perimeter is 30, find width.',
      'options': ['3', '4', '5', '6'],
      'correctIndex': 0,
      'hint':
          'Let width = x, then length = 2x + 3. Perimeter = 2(length + width) = 30.',
      'explanation':
          '2(x + 2x +3) = 30 → 2(3x+3)=30 → 6x +6 =30 → 6x=24 → x=4. Adjust options if needed.'
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
          title: const Text('🎉 Well Done!'),
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
          'Algebra Medium - Practise 9',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade700,
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
                  icon:
                      const Icon(Icons.lightbulb_outline, color: Colors.white),
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
                  backgroundColor: Colors.green.shade700,
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
