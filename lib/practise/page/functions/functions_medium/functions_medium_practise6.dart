import 'package:flutter/material.dart';

class FunctionsMediumPractise6 extends StatefulWidget {
  const FunctionsMediumPractise6({super.key});

  @override
  State<FunctionsMediumPractise6> createState() =>
      _FunctionsMediumPractise6State();
}

class _FunctionsMediumPractise6State extends State<FunctionsMediumPractise6> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If f(x) = 3x + 2 and g(x) = x − 1, find (f ∘ g)(5).',
      'options': ['14', '15', '16', '17'],
      'answer': '14',
      'hint': '(f ∘ g)(x) = f(g(x))',
      'explanation': 'g(5)=4 ⇒ f(4)=3*4+2 = 14'
    },
    {
      'question': '2. If f(x) = x² − 2x and g(x) = x + 3, find (g ∘ f)(2).',
      'options': ['3', '5', '6', '7'],
      'answer': '5',
      'hint': '(g ∘ f)(x) = g(f(x))',
      'explanation': 'f(2)=4-4=0 ⇒ g(0)=0+3=3'
    },
    {
      'question': '3. If f(x) = 2x − 5, find x such that f(x) = 9.',
      'options': ['6', '7', '8', '9'],
      'answer': '7',
      'hint': 'Set f(x)=9 and solve',
      'explanation': '2x-5=9 ⇒ 2x=14 ⇒ x=7'
    },
    {
      'question': '4. If f(x) = x² + x − 6, find f(3).',
      'options': ['6', '8', '9', '10'],
      'answer': '6',
      'hint': 'Substitute x = 3',
      'explanation': '3²+3−6 = 9+3−6 = 6'
    },
    {
      'question': '5. If f(x) = 4x − 7, find the inverse function f⁻¹(x).',
      'options': ['(x + 7)/4', '(x − 7)/4', '(4x + 7)', '(x − 4)/7'],
      'answer': '(x + 7)/4',
      'hint': 'Swap x and y and solve for y',
      'explanation': 'y = 4x - 7 ⇒ x = 4y - 7 ⇒ y = (x+7)/4'
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
          content:
              Text('You scored $score out of ${questions.length}!'),
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
          'Functions Medium Practice 6',
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
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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

            /// OPTIONS
            ...List.generate(current['options'].length, (index) {
              final option = current['options'][index];
              final isSelected = selectedAnswer == option;
              final isCorrect =
                  answerChecked && option == current['answer'];
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
                    side: const BorderSide(color: Colors.green, width: 1.5),
                  ),
                  onPressed: () => checkAnswer(option),
                  child: Text(option),
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

            /// NEXT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1
                      ? 'Finish'
                      : 'Next Question',
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
