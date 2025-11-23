import 'package:flutter/material.dart';

class FunctionsEasyPractise7 extends StatefulWidget {
  const FunctionsEasyPractise7({super.key});

  @override
  State<FunctionsEasyPractise7> createState() => _FunctionsEasyPractise7State();
}

class _FunctionsEasyPractise7State extends State<FunctionsEasyPractise7> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. The table shows values of f(x):\n\nx: 1, 2, 3, 4\nf(x): 2, 4, 6, 8\n\nWhich of the following defines f(x)?',
      'options': ['f(x) = x + 2', 'f(x) = 2x', 'f(x) = x²', 'f(x) = x - 2'],
      'correctIndex': 1,
      'hint': 'Look at how f(x) changes as x increases.',
      'explanation': 'f(x) doubles x, so f(x) = 2x.'
    },
    {
      'question': '2. A graph of a function passes through (0, 2). What is f(0)?',
      'options': ['0', '1', '2', '3'],
      'correctIndex': 2,
      'hint': 'The y-value when x = 0 gives f(0).',
      'explanation': 'Point (0, 2) means f(0) = 2.'
    },
    {
      'question':
          '3. The table shows:\n\nx: -1, 0, 1\nf(x): 1, 0, 1\n\nWhich equation could represent f(x)?',
      'options': ['f(x) = x²', 'f(x) = x', 'f(x) = |x|', 'f(x) = x + 1'],
      'correctIndex': 2,
      'hint': 'Look for a function that is 0 at x = 0 and 1 at x = ±1.',
      'explanation': 'The absolute value function f(x) = |x| fits.'
    },
    {
      'question':
          '4. If the graph of a function is a straight line passing through the origin (0,0), what type of function is it?',
      'options': [
        'Constant function',
        'Linear function',
        'Quadratic function',
        'Exponential function'
      ],
      'correctIndex': 1,
      'hint': 'A straight line through origin has the form y = mx.',
      'explanation': 'It is a linear function.'
    },
    {
      'question':
          '5. The function f(x) = 3x is shown on a graph. What is the slope of the line?',
      'options': ['1', '2', '3', '0'],
      'correctIndex': 2,
      'hint': 'Slope is the coefficient of x in f(x).',
      'explanation': 'Slope = 3.'
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
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text('Functions Easy - Practise 7'),
        backgroundColor: Colors.green,
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
                    backgroundColor: Colors.green,
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
                  label:
                      const Text("Hint", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
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
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(question['hint'], style: const TextStyle(fontSize: 16)),
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
                  backgroundColor: Colors.green,
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
