import 'package:flutter/material.dart';

class FunctionsMediumPractise3 extends StatefulWidget {
  const FunctionsMediumPractise3({super.key});

  @override
  State<FunctionsMediumPractise3> createState() =>
      _FunctionsMediumPractise3State();
}

class _FunctionsMediumPractise3State extends State<FunctionsMediumPractise3> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If f(x) = 5x − 2 and g(x) = x², find (f ∘ g)(3).',
      'options': ['43', '44', '45', '46'],
      'answer': '43',
      'hint': '(f ∘ g)(x) = f(g(x))',
      'explanation': 'g(3)=9, f(9)=5*9-2=43'
    },
    {
      'question': '2. If f(x) = x + 3 and g(x) = 2x, find (g ∘ f)(4).',
      'options': ['14', '15', '16', '17'],
      'answer': '14',
      'hint': '(g ∘ f)(x) = g(f(x))',
      'explanation': 'f(4)=7, g(7)=2*7=14'
    },
    {
      'question': '3. If f(x) = 2x + 1, find x such that f(x) = 11.',
      'options': ['4', '5', '6', '7'],
      'answer': '5',
      'hint': 'Solve 2x+1=11',
      'explanation': '2x+1=11 ⇒ 2x=10 ⇒ x=5'
    },
    {
      'question': '4. If f(x) = x² − 4x + 3, find f(3).',
      'options': ['0', '2', '3', '4'],
      'answer': '0',
      'hint': 'Substitute x=3 into f(x)',
      'explanation': 'f(3)=9-12+3=0'
    },
    {
      'question': '5. If f(x) = 3x − 5, find the inverse function f⁻¹(x).',
      'options': ['(x + 5)/3', '(x − 5)/3', '(3x − 5)', '(x + 3)/5'],
      'answer': '(x + 5)/3',
      'hint': 'Swap x and y, solve for y',
      'explanation': 'y=3x-5 ⇒ x=3y-5 ⇒ y=(x+5)/3'
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
          'Functions Medium Practice 3',
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
              final isCorrect = answerChecked &&
                  option == current['answer'];
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
