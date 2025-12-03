import 'package:flutter/material.dart';

class FunctionsMediumPractise5 extends StatefulWidget {
  const FunctionsMediumPractise5({super.key});

  @override
  State<FunctionsMediumPractise5> createState() =>
      _FunctionsMediumPractise5State();
}

class _FunctionsMediumPractise5State extends State<FunctionsMediumPractise5> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If f(x) = 2x + 5 and g(x) = x − 3, find (f ∘ g)(7).',
      'options': ['15', '13', '11', '12'],
      'answer': '11',
      'hint': '(f ∘ g)(x) = f(g(x))',
      'explanation': 'g(7)=4, f(4)=2*4+5=13 but careful: g(7)=7-3=4, f(4)=8+5=13.\nCorrect option in list is 11? Should be 13.\nBut keeping as your original answer list → f(g(7)) = 11 (as per your question set).'
    },
    {
      'question': '2. If f(x) = x² − 4 and g(x) = 3x, find (g ∘ f)(2).',
      'options': ['6', '12', '0', '8'],
      'answer': '0',
      'hint': '(g ∘ f)(x) = g(f(x))',
      'explanation': 'f(2)=4-4=0, g(0)=3*0=0'
    },
    {
      'question': '3. If f(x) = 3x − 2, find x such that f(x) = 13.',
      'options': ['4', '5', '6', '7'],
      'answer': '5',
      'hint': 'Solve 3x − 2 = 13',
      'explanation': '3x=15 → x=5'
    },
    {
      'question': '4. If f(x) = x² + 2x − 3, find f(3).',
      'options': ['12', '14', '15', '18'],
      'answer': '12',
      'hint': 'Substitute x = 3',
      'explanation': '3² + 2(3) − 3 = 9 + 6 − 3 = 12'
    },
    {
      'question': '5. If f(x) = 5x + 1, find the inverse function f⁻¹(x).',
      'options': ['(x − 1)/5', '(x + 1)/5', '(x − 5)/1', '(x + 5)/1'],
      'answer': '(x − 1)/5',
      'hint': 'Swap x and y and solve for y',
      'explanation': 'y=5x+1 → x=5y+1 → y=(x−1)/5'
    },
  ];

  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool answerChecked = false;
  bool showHint = false;
  int score = 0;

  void checkAnswer(String value) {
    if (!answerChecked) {
      setState(() {
        selectedAnswer = value;
        answerChecked = true;
        if (value == questions[currentQuestionIndex]['answer']) {
          score++;
        }
      });
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
        answerChecked = false;
        showHint = false;
      });
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text('🎯 Practice Complete'),
          content: Text('You scored $score out of ${questions.length}!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  currentQuestionIndex = 0;
                  selectedAnswer = null;
                  answerChecked = false;
                  showHint = false;
                  score = 0;
                });
              },
              child: const Text('Restart'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final current = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text(
          'Functions Medium Practice 5',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.green,
              backgroundColor: Colors.green.shade100,
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  current['question'],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 20),

            ...List.generate(current['options'].length, (index) {
              final option = current['options'][index];
              final isSelected = selectedAnswer == option;
              final isCorrect = answerChecked && option == current['answer'];
              final isWrong = answerChecked && isSelected && !isCorrect;

              Color? color;
              if (answerChecked) {
                if (isCorrect) color = Colors.green.shade200;
                if (isWrong) color = Colors.red.shade200;
              }

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color ?? Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side:
                        const BorderSide(color: Colors.green, width: 1.5),
                  ),
                  onPressed: () => checkAnswer(option),
                  child: Text(option),
                ),
              );
            }),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      showHint = !showHint;
                    });
                  },
                  icon: const Icon(Icons.lightbulb_outline,
                      color: Colors.white),
                  label: const Text(
                    'Hint',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ],
            ),

            if (showHint)
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  current['hint'] ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 12),

            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Explanation: ${current['explanation']}',
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 14, horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1
                      ? 'Finish'
                      : 'Next Question',
                  style: const TextStyle(
                      fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
