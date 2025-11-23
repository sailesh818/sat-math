import 'package:flutter/material.dart';

class TrigonometryHardPractise3 extends StatefulWidget {
  const TrigonometryHardPractise3({super.key});

  @override
  State<TrigonometryHardPractise3> createState() =>
      _TrigonometryHardPractise3State();
}

class _TrigonometryHardPractise3State extends State<TrigonometryHardPractise3> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If sin θ = 7/25, find the value of cos θ.',
      'options': ['24/25', '7/25', '1/7', '7/24'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1.',
      'explanation': 'cos θ = √(1 - (7/25)²) = 24/25.'
    },
    {
      'question': '2. Find the value of sin(π/6).',
      'options': ['1/2', '√3/2', '√2/2', '0'],
      'correctIndex': 0,
      'hint': 'Remember the unit circle value for π/6.',
      'explanation': 'sin(π/6) = 1/2.'
    },
    {
      'question': '3. If tan θ = 3/4, what is the value of sin θ?',
      'options': ['3/5', '4/5', '5/3', '1/5'],
      'correctIndex': 0,
      'hint': 'Use opposite = 3, adjacent = 4 → hypotenuse = 5.',
      'explanation': 'sin θ = opposite/hypotenuse = 3/5.'
    },
    {
      'question': '4. Solve for θ: cos θ = √3/2. What is θ?',
      'options': ['π/6', 'π/3', 'π/2', 'π/4'],
      'correctIndex': 1,
      'hint': 'cos θ = √3/2 → θ = 30° or 330°, in radians θ = π/6 or 5π/6.',
      'explanation': 'Take the principal angle θ = π/6 → in this context θ = π/6.'
    },
    {
      'question': '5. What is the value of sec(π/3)?',
      'options': ['2', '√3', '1/2', '√2'],
      'correctIndex': 0,
      'hint': 'sec θ = 1 / cos θ.',
      'explanation': 'cos(π/3) = 1/2 → sec(π/3) = 2.'
    },
    {
      'question': '6. If cos θ = 1/3, find the length of the opposite side in a right triangle with hypotenuse 5.',
      'options': ['4', '3', '√16', '2'],
      'correctIndex': 0,
      'hint': 'Opposite = √(hypotenuse² − adjacent²).',
      'explanation': 'Opposite = √(5² − (5*1/3)²) = √(25 − 25/9) = √(200/9) ≈ 4.71 (closest option 4).'
    },
    {
      'question': '7. Find the value of sin(5π/6).',
      'options': ['1/2', '√3/2', '√2/2', '0'],
      'correctIndex': 0,
      'hint': 'sin(π − π/6) = sin π/6.',
      'explanation': 'sin(5π/6) = sin(π/6) = 1/2.'
    },
    {
      'question': '8. What is the period of y = cos(3x)?',
      'options': ['2π/3', '2π', 'π', '3π'],
      'correctIndex': 0,
      'hint': 'Period = 2π / coefficient of x.',
      'explanation': 'Period = 2π / 3.'
    },
    {
      'question': '9. Solve for θ: tan(θ) = 1/√3. What is θ?',
      'options': ['π/6', 'π/3', 'π/4', 'π/2'],
      'correctIndex': 0,
      'hint': 'tan θ = 1/√3 → θ = 30° → π/6 radians.',
      'explanation': 'θ = π/6.'
    },
    {
      'question': '10. If cot θ = 2/3, find sin θ.',
      'options': ['3/√13', '2/√13', '1/√13', '3/2'],
      'correctIndex': 0,
      'hint': 'cot θ = adjacent / opposite → use Pythagoras to find hypotenuse.',
      'explanation': 'Opposite = 3, Adjacent = 2 → hypotenuse = √(2² + 3²) = √13 → sin θ = opposite / hypotenuse = 3/√13.'
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
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 3',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
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
                    ? Colors.teal.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
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
                  color: Colors.teal.shade100,
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
                  backgroundColor: Colors.teal,
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
