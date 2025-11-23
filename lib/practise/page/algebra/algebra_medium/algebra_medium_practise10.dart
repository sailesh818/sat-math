import 'package:flutter/material.dart';

class AlgebraMediumPractise10 extends StatefulWidget {
  const AlgebraMediumPractise10({super.key});

  @override
  State<AlgebraMediumPractise10> createState() =>
      _AlgebraMediumPractise10State();
}

class _AlgebraMediumPractise10State extends State<AlgebraMediumPractise10> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Solve: x² - 5x + 6 = 0',
      'options': ['x=2,3', 'x=-2,-3', 'x=1,6', 'x=-1,-6'],
      'correctIndex': 0,
      'hint': 'Factor the quadratic: x² - 5x + 6 = (x - 2)(x - 3).',
      'explanation': 'x² - 5x + 6 = (x-2)(x-3)=0 → x=2 or x=3.'
    },
    {
      'question': '2. Solve: x² + x - 6 = 0',
      'options': ['x=2,-3', 'x=-2,3', 'x=1,6', 'x=-1,-6'],
      'correctIndex': 0,
      'hint': 'Factor: x² + x - 6 = (x+3)(x-2).',
      'explanation': 'x² + x - 6 = (x+3)(x-2)=0 → x=-3 or x=2.'
    },
    {
      'question': '3. Solve: x² - 7x + 12 = 0',
      'options': ['x=3,4', 'x=-3,-4', 'x=2,6', 'x=-2,-6'],
      'correctIndex': 0,
      'hint': 'Factor: x² - 7x + 12 = (x-3)(x-4).',
      'explanation': 'x² - 7x + 12 = (x-3)(x-4)=0 → x=3 or x=4.'
    },
    {
      'question': '4. Solve: x² - 8x + 15 = 0',
      'options': ['x=3,5', 'x=-3,-5', 'x=5,3', 'x=-5,-3'],
      'correctIndex': 0,
      'hint': 'Factor: x² - 8x + 15 = (x-3)(x-5).',
      'explanation': 'x² - 8x + 15 = (x-3)(x-5)=0 → x=3 or x=5.'
    },
    {
      'question': '5. Solve: x² - 6x + 8 = 0',
      'options': ['x=2,4', 'x=-2,-4', 'x=1,8', 'x=-1,-8'],
      'correctIndex': 0,
      'hint': 'Factor: x² - 6x + 8 = (x-2)(x-4).',
      'explanation': 'x² - 6x + 8 = (x-2)(x-4)=0 → x=2 or x=4.'
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
          'Algebra Medium - Practise 10',
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
