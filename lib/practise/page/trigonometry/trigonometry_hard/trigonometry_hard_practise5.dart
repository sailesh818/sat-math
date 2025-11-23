import 'package:flutter/material.dart';

class TrigonometryHardPractise5 extends StatefulWidget {
  const TrigonometryHardPractise5({super.key});

  @override
  State<TrigonometryHardPractise5> createState() =>
      _TrigonometryHardPractise5State();
}

class _TrigonometryHardPractise5State extends State<TrigonometryHardPractise5> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If sin θ = -3/5, find cos θ for the triangle.',
      'options': ['4/5', '-4/5', '3/5', '-3/5'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → cos θ = √(1 − sin²θ). Consider the quadrant of θ.',
      'explanation': 'cos θ = √(1 − (-3/5)²) = 4/5.'
    },
    {
      'question': '2. What is the value of tan(π/4)?',
      'options': ['1', '√3', '0', '-1'],
      'correctIndex': 0,
      'hint': 'tan θ = sin θ / cos θ.',
      'explanation': 'tan(π/4) = 1.'
    },
    {
      'question': '3. If sec θ = 5/4, find the value of cos θ.',
      'options': ['4/5', '5/4', '3/5', '2/5'],
      'correctIndex': 0,
      'hint': 'sec θ = 1/cos θ.',
      'explanation': 'cos θ = 1 / (5/4) = 4/5.'
    },
    {
      'question': '4. Solve for θ: cos(θ) = -√2/2. What is θ?',
      'options': ['5π/4', '3π/4', 'π/4', 'π/2'],
      'correctIndex': 0,
      'hint': 'Cos is negative in the 2nd and 3rd quadrants.',
      'explanation': 'θ = 3π/4 or 5π/4; first option considered.'
    },
    {
      'question': '5. What is the amplitude of y = -2sin(x)?',
      'options': ['2', '1', '3', '-2'],
      'correctIndex': 0,
      'hint': 'Amplitude = absolute value of coefficient of sin(x).',
      'explanation': 'Amplitude = 2.'
    },
    {
      'question': '6. If tan θ = 2/3, find sin θ.',
      'options': ['2/√13', '3/√13', '2/5', '3/5'],
      'correctIndex': 0,
      'hint': 'tan θ = opposite/adjacent → use Pythagoras to find hypotenuse → sin θ = opposite/hypotenuse.',
      'explanation': 'Opposite = 2, Adjacent = 3 → Hypotenuse = √(2²+3²) = √13 → sin θ = 2/√13.'
    },
    {
      'question': '7. Find the value of cos(3π/4).',
      'options': ['-√2/2', '√2/2', '1/2', '-1/2'],
      'correctIndex': 0,
      'hint': 'Cos is negative in the second quadrant.',
      'explanation': 'cos(3π/4) = -√2/2.'
    },
    {
      'question': '8. If sec θ = 5/3, find tan θ.',
      'options': ['4/3', '3/4', '3/5', '4/5'],
      'correctIndex': 0,
      'hint': 'sec θ = 1/cos θ, then use sin²θ + cos²θ = 1 → tan θ = sin θ / cos θ.',
      'explanation': 'cos θ = 3/5 → sin θ = 4/5 → tan θ = 4/3.'
    },
    {
      'question': '9. A triangle has sides 15, 20, and 25. What is the value of cos θ for the angle opposite the side of length 15?',
      'options': ['4/5', '3/5', '5/4', '1/2'],
      'correctIndex': 0,
      'hint': 'cos θ = adjacent/hypotenuse → hypotenuse = 25, adjacent = 20.',
      'explanation': 'cos θ = 20/25 = 4/5.'
    },
    {
      'question': '10. If sin θ = 1/2, what is θ?',
      'options': ['π/6', 'π/4', 'π/3', 'π/2'],
      'correctIndex': 0,
      'hint': 'Remember sin(π/6) = 1/2.',
      'explanation': 'θ = π/6.'
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
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 5',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
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
                    ? Colors.blue.shade200
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
                    backgroundColor: Colors.indigo,
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
                  color: Colors.blue.shade100,
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
                  color: Colors.blue.shade100,
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
                  backgroundColor: Colors.blue,
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
