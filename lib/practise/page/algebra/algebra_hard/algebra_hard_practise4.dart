import 'package:flutter/material.dart';

class AlgebraHardPractise4 extends StatefulWidget {
  const AlgebraHardPractise4({super.key});

  @override
  State<AlgebraHardPractise4> createState() => _AlgebraHardPractise4State();
}

class _AlgebraHardPractise4State extends State<AlgebraHardPractise4> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Factor completely: x^3 - 6x^2 + 11x - 6',
      'options': ['(x-1)(x-2)(x-3)', '(x+1)(x+2)(x+3)', '(x-1)(x+1)(x-6)', '(x-2)(x-3)(x-1)'],
      'correctIndex': 0,
      'hint': 'Try factoring by grouping or use roots trial.',
      'explanation': 'The polynomial factors as (x-1)(x-2)(x-3).'
    },
    {
      'question': '2. Factor: x^3 + 3x^2 - 4x - 12',
      'options': ['(x+3)(x-2)(x+2)', '(x+3)(x-1)(x+4)', '(x+2)(x-2)(x+3)', '(x+1)(x-2)(x+6)'],
      'correctIndex': 0,
      'hint': 'Use grouping: (x^3 + 3x^2) - (4x + 12)',
      'explanation': 'Factor by grouping: x^2(x+3) - 4(x+3) = (x+3)(x^2-4) = (x+3)(x-2)(x+2)'
    },
    {
      'question': '3. Factor: x^3 - 7x + 6',
      'options': ['(x-1)(x-2)(x+3)', '(x+1)(x-2)(x-3)', '(x-1)(x+2)(x-3)', '(x-1)(x-6)(x+1)'],
      'correctIndex': 0,
      'hint': 'Find integer roots using trial and error.',
      'explanation': 'x^3 -7x +6 = (x-1)(x-2)(x+3)'
    },
    {
      'question': '4. Factor: 2x^3 + 5x^2 - 4x - 10',
      'options': ['(2x+5)(x-1)(x+2)', '(2x-1)(x+2)(x+5)', '(2x+5)(x+1)(x-2)', '(2x+1)(x+2)(x-5)'],
      'correctIndex': 0,
      'hint': 'Try grouping: (2x^3 + 5x^2) - (4x +10)',
      'explanation': 'Factor by grouping: x^2(2x+5) -2(x+5)= (2x+5)(x-1)(x+2)'
    },
    {
      'question': '5. Factor: x^3 + x^2 - x - 1',
      'options': ['(x+1)(x-1)(x+1)', '(x-1)(x+1)(x-1)', '(x+1)(x+1)(x-1)', '(x-1)(x-1)(x+1)'],
      'correctIndex': 0,
      'hint': 'Use grouping: (x^3 + x^2) - (x +1)',
      'explanation': 'Factor by grouping: x^2(x+1)-1(x+1)=(x+1)(x^2-1)=(x+1)(x-1)(x+1)'
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
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text('Algebra Hard - Practise 4'),
        backgroundColor: Colors.blue.shade700,
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
                    backgroundColor: Colors.blue,
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
                    backgroundColor: Colors.blue,
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
                  color: Colors.blue.shade100,
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
                  backgroundColor: Colors.blue.shade700,
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
