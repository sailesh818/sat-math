import 'package:flutter/material.dart';

class TrigonometryHardPractise18 extends StatefulWidget {
  const TrigonometryHardPractise18({super.key});

  @override
  State<TrigonometryHardPractise18> createState() =>
      _TrigonometryHardPractise18State();
}

class _TrigonometryHardPractise18State
    extends State<TrigonometryHardPractise18> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If sin θ = 9/41, find cos θ.',
      'options': ['40/41', '-40/41', '9/41', '-9/41'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → cos θ = ±√(1 − sin²θ).',
      'explanation': 'cos θ = √(1 − (9/41)²) = 40/41.'
    },
    {
      'question': '2. Solve for θ: tan θ = 1/√3.',
      'options': ['π/6', 'π/3', 'π/4', 'π/2'],
      'correctIndex': 0,
      'hint': 'tan θ = 1/√3 → θ = π/6',
      'explanation': 'θ = π/6.'
    },
    {
      'question': '3. If cos θ = -12/13, find sin θ.',
      'options': ['5/13', '-5/13', '12/13', '-12/13'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → sin θ = ±√(1 − cos²θ).',
      'explanation': 'sin θ = √(1 − (-12/13)²) = 5/13.'
    },
    {
      'question': '4. Find the value of sin(5π/4).',
      'options': ['-√2/2', '√2/2', '-1/2', '1/2'],
      'correctIndex': 0,
      'hint': '5π/4 is in the 3rd quadrant, sin is negative.',
      'explanation': 'sin(5π/4) = -√2/2.'
    },
    {
      'question': '5. Find the amplitude of y = 6cos(5x).',
      'options': ['6', '-6', '5', '1'],
      'correctIndex': 0,
      'hint': 'Amplitude = |coefficient of cosine|.',
      'explanation': 'Amplitude = 6.'
    },
    {
      'question': '6. Solve for θ: cot θ = 24/7.',
      'options': ['arccot(24/7)', 'arctan(24/7)', 'arctan(7/24)', 'arccot(7/24)'],
      'correctIndex': 0,
      'hint': 'θ = arccot(24/7)',
      'explanation': 'θ = arccot(24/7).'
    },
    {
      'question': '7. What is the period of y = sin(11x)?',
      'options': ['2π/11', 'π/11', '2π', 'π'],
      'correctIndex': 0,
      'hint': 'Period of sin(kx) = 2π / k.',
      'explanation': 'Period = 2π / 11.'
    },
    {
      'question': '8. If sec θ = -13/12, find cos θ.',
      'options': ['-12/13', '12/13', '-13/12', '13/12'],
      'correctIndex': 0,
      'hint': 'sec θ = 1 / cos θ',
      'explanation': 'cos θ = -12/13.'
    },
    {
      'question': '9. Find the value of tan(7π/6).',
      'options': ['1/√3', '-1/√3', '√3', '-√3'],
      'correctIndex': 3,
      'hint': '7π/6 is in the 3rd quadrant, tan is positive.',
      'explanation': 'tan(7π/6) = -√3.'
    },
    {
      'question': '10. If sin θ = -9/41, find cos θ.',
      'options': ['40/41', '-40/41', '9/41', '-9/41'],
      'correctIndex': 1,
      'hint': 'Use sin²θ + cos²θ = 1 → cos θ = ±√(1 − sin²θ).',
      'explanation': 'cos θ = -40/41.'
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
          title: const Text('🎉 Completed!'),
          content: const Text('You have finished all questions!'),
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
      backgroundColor: Colors.deepOrange.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 18',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
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
                    ? Colors.deepOrange.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepOrange,
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
                  color: Colors.deepOrange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(question['hint'], style: const TextStyle(fontSize: 16)),
              ),
            const SizedBox(height: 20),
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.deepOrange.shade100,
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
                  backgroundColor: Colors.deepOrange,
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
