import 'package:flutter/material.dart';

class TrigonometryHardPractise4 extends StatefulWidget {
  const TrigonometryHardPractise4({super.key});

  @override
  State<TrigonometryHardPractise4> createState() =>
      _TrigonometryHardPractise4State();
}

class _TrigonometryHardPractise4State extends State<TrigonometryHardPractise4> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If cos θ = 5/13, find the value of tan θ.',
      'options': ['12/5', '5/12', '13/5', '12/13'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → sin θ = √(1 − cos²θ) → tan θ = sin θ / cos θ.',
      'explanation': 'sin θ = √(1 − (5/13)²) = 12/13 → tan θ = (12/13)/(5/13) = 12/5.'
    },
    {
      'question': '2. Solve for θ: sin θ = 1/√2. What is θ?',
      'options': ['π/4', 'π/3', 'π/2', 'π/6'],
      'correctIndex': 0,
      'hint': 'Remember sin π/4 = 1/√2.',
      'explanation': 'θ = π/4.'
    },
    {
      'question': '3. What is the value of cos(2π/3)?',
      'options': ['-1/2', '1/2', '√3/2', '0'],
      'correctIndex': 0,
      'hint': 'cos(2π/3) is in the second quadrant → negative.',
      'explanation': 'cos(2π/3) = -1/2.'
    },
    {
      'question': '4. If tan θ = √3, what is the value of cos θ?',
      'options': ['1/2', '1/√2', '√3/2', '1/√3'],
      'correctIndex': 0,
      'hint': 'tan θ = √3 → opposite/adjacent = √3/1 → hypotenuse = 2 → cos θ = adjacent/hypotenuse.',
      'explanation': 'cos θ = 1/2.'
    },
    {
      'question': '5. A triangle has sides 9, 12, and 15. What is the value of sin θ for the angle opposite the side of length 9?',
      'options': ['3/5', '9/15', '12/15', '9/12'],
      'correctIndex': 0,
      'hint': 'Use opposite/hypotenuse.',
      'explanation': 'sin θ = 9/15 = 3/5.'
    },
    {
      'question': '6. If cos θ = 3/5, find the value of sec θ.',
      'options': ['5/3', '3/5', '√2/5', '2/5'],
      'correctIndex': 0,
      'hint': 'sec θ = 1 / cos θ.',
      'explanation': 'sec θ = 5/3.'
    },
    {
      'question': '7. Find the exact value of sin(3π/4).',
      'options': ['√2/2', '1/2', '√3/2', '√2/3'],
      'correctIndex': 0,
      'hint': 'sin(π − π/4) = sin(π/4).',
      'explanation': 'sin(3π/4) = √2/2.'
    },
    {
      'question': '8. If cot θ = 4/3, find sin θ.',
      'options': ['3/5', '4/5', '5/4', '3/4'],
      'correctIndex': 0,
      'hint': 'cot θ = adjacent/opposite → use Pythagoras to find hypotenuse → sin θ = opposite/hypotenuse.',
      'explanation': 'opposite = 3, adjacent = 4 → hypotenuse = 5 → sin θ = 3/5.'
    },
    {
      'question': '9. What is the amplitude of the function y = 3sin(x)?',
      'options': ['3', '1', '0', 'π'],
      'correctIndex': 0,
      'hint': 'Amplitude = coefficient of sin.',
      'explanation': 'Amplitude = 3.'
    },
    {
      'question': '10. If cos θ = 1/√2, find tan θ.',
      'options': ['1', '√2', '0', '√3'],
      'correctIndex': 0,
      'hint': 'tan θ = sin θ / cos θ → sin θ = √(1 − cos²θ).',
      'explanation': 'cos θ = 1/√2 → sin θ = 1/√2 → tan θ = 1.'
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
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 4',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
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
                    ? Colors.orange.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange,
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
                    backgroundColor: Colors.deepOrange,
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
                  color: Colors.orange.shade100,
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
                  backgroundColor: Colors.orange,
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
