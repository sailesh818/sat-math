import 'package:flutter/material.dart';

class TrigonometryHardPractise19 extends StatefulWidget {
  const TrigonometryHardPractise19({super.key});

  @override
  State<TrigonometryHardPractise19> createState() =>
      _TrigonometryHardPractise19State();
}

class _TrigonometryHardPractise19State
    extends State<TrigonometryHardPractise19> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If sin θ = 7/25, find cos θ.',
      'options': ['24/25', '-24/25', '7/25', '-7/25'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → cos θ = ±√(1 − sin²θ).',
      'explanation': 'cos θ = √(1 − (7/25)²) = 24/25.'
    },
    {
      'question': '2. Solve for θ: tan θ = 2√3.',
      'options': ['arctan(2√3)', 'arctan(√3/2)', 'π/3', 'π/6'],
      'correctIndex': 0,
      'hint': 'θ = arctan(2√3)',
      'explanation': 'θ = arctan(2√3).'
    },
    {
      'question': '3. If cos θ = -5/13, find sin θ.',
      'options': ['12/13', '-12/13', '5/13', '-5/13'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → sin θ = ±√(1 − cos²θ).',
      'explanation': 'sin θ = √(1 − (-5/13)²) = 12/13.'
    },
    {
      'question': '4. Find the value of sin(11π/6).',
      'options': ['-1/2', '1/2', '-√3/2', '√3/2'],
      'correctIndex': 0,
      'hint': '11π/6 is in the 4th quadrant, sin is negative.',
      'explanation': 'sin(11π/6) = -1/2.'
    },
    {
      'question': '5. Find the amplitude of y = -4sin(8x).',
      'options': ['4', '-4', '8', '1'],
      'correctIndex': 0,
      'hint': 'Amplitude = |coefficient of sine|.',
      'explanation': 'Amplitude = 4.'
    },
    {
      'question': '6. Solve for θ: cot θ = 1/2.',
      'options': ['arccot(1/2)', 'arctan(1/2)', 'arctan(2)', 'arccot(2)'],
      'correctIndex': 0,
      'hint': 'θ = arccot(1/2)',
      'explanation': 'θ = arccot(1/2).'
    },
    {
      'question': '7. What is the period of y = cos(6x)?',
      'options': ['π/3', 'π/6', '2π', 'π'],
      'correctIndex': 0,
      'hint': 'Period of cos(kx) = 2π / k.',
      'explanation': 'Period = 2π / 6 = π/3.'
    },
    {
      'question': '8. If sec θ = -25/24, find cos θ.',
      'options': ['-24/25', '24/25', '-25/24', '25/24'],
      'correctIndex': 0,
      'hint': 'sec θ = 1 / cos θ',
      'explanation': 'cos θ = -24/25.'
    },
    {
      'question': '9. Find the value of tan(3π/4).',
      'options': ['1', '-1', '√3', '-√3'],
      'correctIndex': 1,
      'hint': '3π/4 is in the 2nd quadrant, tan is negative.',
      'explanation': 'tan(3π/4) = -1.'
    },
    {
      'question': '10. If sin θ = -7/25, find cos θ.',
      'options': ['24/25', '-24/25', '7/25', '-7/25'],
      'correctIndex': 1,
      'hint': 'Use sin²θ + cos²θ = 1 → cos θ = ±√(1 − sin²θ).',
      'explanation': 'cos θ = -24/25.'
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
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 19',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
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
                    ? Colors.purple.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
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
                    backgroundColor: Colors.purple,
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
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(question['hint'], style: const TextStyle(fontSize: 16)),
              ),
            const SizedBox(height: 20),
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
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
                  backgroundColor: Colors.purple,
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
