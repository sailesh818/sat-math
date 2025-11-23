import 'package:flutter/material.dart';

class TrigonometryHardPractise8 extends StatefulWidget {
  const TrigonometryHardPractise8({super.key});

  @override
  State<TrigonometryHardPractise8> createState() =>
      _TrigonometryHardPractise8State();
}

class _TrigonometryHardPractise8State extends State<TrigonometryHardPractise8> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If cos θ = -5/13, find sin θ.',
      'options': ['12/13', '-12/13', '5/13', '-5/13'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → sin θ = ±√(1 − cos²θ).',
      'explanation': 'sin θ = √(1 − (-5/13)²) = 12/13.'
    },
    {
      'question': '2. What is the value of cos(7π/6)?',
      'options': ['-√3/2', '√3/2', '1/2', '-1/2'],
      'correctIndex': 0,
      'hint': '7π/6 is in the 3rd quadrant where cos is negative.',
      'explanation': 'cos(7π/6) = -√3/2.'
    },
    {
      'question': '3. Find the value of sec(π/4).',
      'options': ['√2', '2', '1/√2', '1'],
      'correctIndex': 0,
      'hint': 'sec θ = 1 / cos θ; cos(π/4) = √2/2.',
      'explanation': 'sec(π/4) = 1 / (√2/2) = √2.'
    },
    {
      'question': '4. Solve for θ: tan θ = -1.',
      'options': ['5π/4', '7π/4', 'π/4', '3π/4'],
      'correctIndex': 0,
      'hint': 'Tangent is negative in the 2nd and 4th quadrants.',
      'explanation': 'θ = 5π/4 (principal value).'
    },
    {
      'question': '5. Find the period of y = 3cos(5x).',
      'options': ['2π/5', 'π/5', '2π', 'π'],
      'correctIndex': 0,
      'hint': 'Period of cos(kx) = 2π / k.',
      'explanation': 'Period = 2π / 5.'
    },
    {
      'question': '6. What is the amplitude of y = 4sin(x)?',
      'options': ['4', '1', '2', '3'],
      'correctIndex': 0,
      'hint': 'Amplitude = |coefficient of sine|.',
      'explanation': 'Amplitude = 4.'
    },
    {
      'question': '7. If cot θ = 3/4, find sin θ.',
      'options': ['3/5', '4/5', '5/4', '3/4'],
      'correctIndex': 0,
      'hint': 'cot θ = adjacent / opposite. Use Pythagoras to find hypotenuse.',
      'explanation': 'Hypotenuse = √(3² + 4²) = 5 → sin θ = opposite/hypotenuse = 3/5.'
    },
    {
      'question': '8. What is the value of sin(π/6)?',
      'options': ['1/2', '√3/2', '1', '√2/2'],
      'correctIndex': 0,
      'hint': 'Standard angle value.',
      'explanation': 'sin(π/6) = 1/2.'
    },
    {
      'question': '9. Solve for θ: cos θ = √3/2.',
      'options': ['π/6', 'π/4', 'π/3', 'π/2'],
      'correctIndex': 0,
      'hint': 'Cosine is positive in the 1st and 4th quadrants.',
      'explanation': 'θ = π/6.'
    },
    {
      'question': '10. If sin θ = -4/5, find cos θ.',
      'options': ['3/5', '-3/5', '4/5', '-4/5'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → cos θ = ±√(1 − sin²θ).',
      'explanation': 'cos θ = √(1 − (-4/5)²) = 3/5.'
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
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 8',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
                child: Text(question['hint'], style: const TextStyle(fontSize: 16)),
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
