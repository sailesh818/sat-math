import 'package:flutter/material.dart';

class TrigonometryHardPractise1 extends StatefulWidget {
  const TrigonometryHardPractise1({super.key});

  @override
  State<TrigonometryHardPractise1> createState() =>
      _TrigonometryHardPractise1State();
}

class _TrigonometryHardPractise1State
    extends State<TrigonometryHardPractise1> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If sin θ = 3/5 and cos θ = 4/5, find tan θ.',
      'options': ['3/4', '4/3', '5/4', '5/3'],
      'correctIndex': 0,
      'hint': 'tan θ = sin θ / cos θ.',
      'explanation': 'tan θ = (3/5) ÷ (4/5) = 3/4.'
    },
    {
      'question': '2. What is the value of sin 90° × cos 90°?',
      'options': ['0', '1', 'sin 0°', 'cos 0°'],
      'correctIndex': 0,
      'hint': 'sin 90° = 1, cos 90° = 0.',
      'explanation': '1 × 0 = 0.'
    },
    {
      'question': '3. A triangle has sides 7, 24, and 25. What is the value of cos θ?',
      'options': ['7/25', '24/25', '25/7', '7/24'],
      'correctIndex': 1,
      'hint': 'cos θ = adjacent / hypotenuse.',
      'explanation': 'cos θ = 24 / 25.'
    },
    {
      'question': '4. If tan θ = 1/√3, what is sin θ?',
      'options': ['1/2', '√3/2', '1/√3', '√2/2'],
      'correctIndex': 0,
      'hint': 'tan θ = sin θ / cos θ, θ = 30° → sin 30° = 1/2.',
      'explanation': 'sin θ = 1/2.'
    },
    {
      'question': '5. Solve for θ: cos θ = 1/2. What is θ in radians?',
      'options': ['π/3', 'π/6', 'π/4', 'π/2'],
      'correctIndex': 0,
      'hint': 'cos θ = 1/2 → θ = 60° = π/3.',
      'explanation': 'θ = π/3 radians.'
    },
    {
      'question': '6. Find the exact value of tan(π/4).',
      'options': ['1', '√2', '0', '√3'],
      'correctIndex': 0,
      'hint': 'tan π/4 = 1.',
      'explanation': 'tan(π/4) = 1.'
    },
    {
      'question': '7. If sin θ = 5/13, find the length of the adjacent side in a right triangle.',
      'options': ['12', '13', '5', '7'],
      'correctIndex': 0,
      'hint': 'Adjacent = √(hypotenuse² − opposite²).',
      'explanation': '√(13² − 5²) = √(169−25) = 12.'
    },
    {
      'question': '8. What is the period of the function y = sin(2x)?',
      'options': ['π', '2π', 'π/2', 'π/4'],
      'correctIndex': 0,
      'hint': 'Period = 2π / coefficient of x.',
      'explanation': 'Period = 2π / 2 = π.'
    },
    {
      'question': '9. Find the value of sec θ if cos θ = 4/5.',
      'options': ['5/4', '4/5', '25/16', '1/5'],
      'correctIndex': 0,
      'hint': 'sec θ = 1 / cos θ.',
      'explanation': 'sec θ = 1 ÷ (4/5) = 5/4.'
    },
    {
      'question': '10. If tan θ = 1, find the value of sin θ.',
      'options': ['1/√2', '√2/2', '1/2', '0'],
      'correctIndex': 1,
      'hint': 'tan θ = 1 → θ = 45° → sin 45° = √2/2.',
      'explanation': 'sin θ = √2/2.'
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
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 1',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
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
                    backgroundColor: Colors.indigo,
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
                  color: Colors.indigo.shade100,
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
                  backgroundColor: Colors.indigo,
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
