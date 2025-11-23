import 'package:flutter/material.dart';

class TrigonometryHardPractise7 extends StatefulWidget {
  const TrigonometryHardPractise7({super.key});

  @override
  State<TrigonometryHardPractise7> createState() =>
      _TrigonometryHardPractise7State();
}

class _TrigonometryHardPractise7State extends State<TrigonometryHardPractise7> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If sin θ = -7/25, find cos θ.',
      'options': ['24/25', '-24/25', '7/25', '-7/25'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → cos θ = √(1 − sin²θ).',
      'explanation': 'cos θ = √(1 − (-7/25)²) = 24/25.'
    },
    {
      'question': '2. Solve for θ: cos θ = -1/2.',
      'options': ['2π/3', 'π/3', '5π/6', 'π/6'],
      'correctIndex': 0,
      'hint': 'Cosine is negative in the 2nd and 3rd quadrants.',
      'explanation': 'θ = 2π/3 (principal value).'
    },
    {
      'question': '3. Find the value of sec(5π/4).',
      'options': ['-√2', '√2', '1/√2', '-1/√2'],
      'correctIndex': 0,
      'hint': 'sec θ = 1 / cos θ; 5π/4 is in 3rd quadrant.',
      'explanation': 'cos(5π/4) = -√2/2 → sec(5π/4) = -√2.'
    },
    {
      'question': '4. What is the amplitude of the function y = -3cos(x)?',
      'options': ['3', '1', '2', '-3'],
      'correctIndex': 0,
      'hint': 'Amplitude = |coefficient of cosine|.',
      'explanation': 'Amplitude = |-3| = 3.'
    },
    {
      'question': '5. If tan θ = 5/12, find sin θ.',
      'options': ['5/13', '12/13', '5/12', '12/5'],
      'correctIndex': 0,
      'hint': 'tan θ = opposite / adjacent; use Pythagoras to find hypotenuse.',
      'explanation': 'Hypotenuse = √(5² + 12²) = 13 → sin θ = 5/13.'
    },
    {
      'question': '6. What is the period of y = sin(2x)?',
      'options': ['π', '2π', 'π/2', '2π/3'],
      'correctIndex': 0,
      'hint': 'Period of sin(kx) = 2π / k.',
      'explanation': 'Period = 2π / 2 = π.'
    },
    {
      'question': '7. Solve for θ: tan θ = 1.',
      'options': ['π/4', 'π/3', 'π/6', 'π/2'],
      'correctIndex': 0,
      'hint': 'tan θ = 1 → θ = π/4 (principal value).',
      'explanation': 'θ = π/4.'
    },
    {
      'question': '8. If sin θ = 3/5, find cos θ.',
      'options': ['4/5', '-4/5', '5/3', '-5/3'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1.',
      'explanation': 'cos θ = √(1 − (3/5)²) = 4/5.'
    },
    {
      'question': '9. What is the value of sin(π/3)?',
      'options': ['√3/2', '1/2', '√2/2', '1'],
      'correctIndex': 0,
      'hint': 'Standard angle value for π/3.',
      'explanation': 'sin(π/3) = √3/2.'
    },
    {
      'question': '10. If cot θ = 2, find tan θ.',
      'options': ['1/2', '2', '1', '1/√2'],
      'correctIndex': 0,
      'hint': 'cot θ = 1 / tan θ.',
      'explanation': 'tan θ = 1 / 2 = 1/2.'
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
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 7',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
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
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(question['hint'], style: const TextStyle(fontSize: 16)),
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
