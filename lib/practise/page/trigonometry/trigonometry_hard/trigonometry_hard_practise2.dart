import 'package:flutter/material.dart';

class TrigonometryHardPractise2 extends StatefulWidget {
  const TrigonometryHardPractise2({super.key});

  @override
  State<TrigonometryHardPractise2> createState() =>
      _TrigonometryHardPractise2State();
}

class _TrigonometryHardPractise2State extends State<TrigonometryHardPractise2> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If sin θ = 4/5, find cos θ for the right triangle.',
      'options': ['3/5', '4/5', '5/4', '2/5'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1.',
      'explanation': 'cos θ = √(1 - (4/5)²) = 3/5.'
    },
    {
      'question': '2. What is the value of tan(π/3)?',
      'options': ['√3', '1', '0', '1/√3'],
      'correctIndex': 0,
      'hint': 'tan π/3 = sin π/3 ÷ cos π/3.',
      'explanation': 'tan π/3 = (√3/2) ÷ (1/2) = √3.'
    },
    {
      'question': '3. If cos θ = 1/2, find the value of sin θ in the right triangle.',
      'options': ['√3/2', '1/2', '√2/2', '1/√3'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1.',
      'explanation': 'sin θ = √(1 - (1/2)²) = √3/2.'
    },
    {
      'question': '4. Solve for θ: cos(2θ) = 1/2. What is θ?',
      'options': ['π/3', 'π/6', 'π/4', 'π/2'],
      'correctIndex': 1,
      'hint': 'cos(2θ) = 1/2 → 2θ = π/3 → θ = π/6.',
      'explanation': 'θ = π/6.'
    },
    {
      'question': '5. A triangle has sides 7, 24, and 25. What is tan θ for the angle opposite the side of length 7?',
      'options': ['7/24', '24/7', '7/25', '25/7'],
      'correctIndex': 0,
      'hint': 'tan θ = opposite / adjacent.',
      'explanation': 'tan θ = 7 / 24.'
    },
    {
      'question': '6. If tan θ = √3, what is the value of sin θ?',
      'options': ['√3/2', '1/2', '1/√3', '√3/2'], 
      'correctIndex': 0,
      'hint': 'tan θ = sin θ / cos θ → θ = π/3 → sin π/3 = √3/2.',
      'explanation': 'sin θ = √3/2.'
    },
    {
      'question': '7. Find the exact value of sin(2π/3).',
      'options': ['√3/2', '1/2', '0', '√2/2'],
      'correctIndex': 0,
      'hint': 'sin(2π/3) = sin(π - π/3) = sin π/3.',
      'explanation': 'sin(2π/3) = √3/2.'
    },
    {
      'question': '8. If sec θ = 2, find cos θ.',
      'options': ['1/2', '2', '1', '1/√2'],
      'correctIndex': 0,
      'hint': 'sec θ = 1 / cos θ.',
      'explanation': 'cos θ = 1 / 2.'
    },
    {
      'question': '9. If sin θ = 3/5, find the length of the adjacent side in a right triangle.',
      'options': ['4', '5', '3', '2'],
      'correctIndex': 0,
      'hint': 'Adjacent = √(hypotenuse² − opposite²).',
      'explanation': '√(5² − 3²) = √(25−9) = 4.'
    },
    {
      'question': '10. Solve for θ: tan θ = 1. What is θ in radians?',
      'options': ['π/4', 'π/3', 'π/2', 'π/6'],
      'correctIndex': 0,
      'hint': 'tan θ = 1 → θ = 45° → π/4 radians.',
      'explanation': 'θ = π/4.'
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
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 2',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
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
                    ? Colors.deepPurple.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
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
                  color: Colors.deepPurple.shade100,
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
                  backgroundColor: Colors.deepPurple,
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
