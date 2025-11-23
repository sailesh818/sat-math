import 'package:flutter/material.dart';

class TrigonometryHardPractise16 extends StatefulWidget {
  const TrigonometryHardPractise16({super.key});

  @override
  State<TrigonometryHardPractise16> createState() =>
      _TrigonometryHardPractise16State();
}

class _TrigonometryHardPractise16State
    extends State<TrigonometryHardPractise16> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If sin θ = 5/13, find cos θ.',
      'options': ['12/13', '-12/13', '5/13', '-5/13'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → cos θ = ±√(1 − sin²θ).',
      'explanation': 'cos θ = √(1 − (5/13)²) = 12/13.'
    },
    {
      'question': '2. Solve for θ: tan θ = 2.',
      'options': ['arctan(2)', 'arctan(1/2)', 'π/4', 'π/6'],
      'correctIndex': 0,
      'hint': 'θ = arctan(2)',
      'explanation': 'θ = arctan(2).'
    },
    {
      'question': '3. If cos θ = -3/5, find sin θ.',
      'options': ['4/5', '-4/5', '3/5', '-3/5'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → sin θ = ±√(1 − cos²θ).',
      'explanation': 'sin θ = √(1 − (-3/5)²) = 4/5.'
    },
    {
      'question': '4. What is the value of sin(7π/6)?',
      'options': ['-1/2', '1/2', '-√3/2', '√3/2'],
      'correctIndex': 0,
      'hint': '7π/6 is in the 3rd quadrant, sin is negative.',
      'explanation': 'sin(7π/6) = -1/2.'
    },
    {
      'question': '5. Find the amplitude of y = -7cos(3x).',
      'options': ['7', '-7', '3', '1'],
      'correctIndex': 0,
      'hint': 'Amplitude = |coefficient of cosine|.',
      'explanation': 'Amplitude = 7.'
    },
    {
      'question': '6. Solve for θ: cot θ = 5/12.',
      'options': ['arccot(5/12)', 'arctan(5/12)', 'arctan(12/5)', 'arccot(12/5)'],
      'correctIndex': 0,
      'hint': 'θ = arccot(5/12)',
      'explanation': 'θ = arccot(5/12).'
    },
    {
      'question': '7. What is the period of y = sin(9x)?',
      'options': ['2π/9', 'π/9', '2π', 'π'],
      'correctIndex': 0,
      'hint': 'Period of sin(kx) = 2π / k.',
      'explanation': 'Period = 2π / 9.'
    },
    {
      'question': '8. If sec θ = -13/5, find cos θ.',
      'options': ['-5/13', '5/13', '-13/5', '13/5'],
      'correctIndex': 0,
      'hint': 'sec θ = 1 / cos θ',
      'explanation': 'cos θ = -5/13.'
    },
    {
      'question': '9. Find the value of tan(4π/3).',
      'options': ['√3', '-√3', '1/√3', '-1/√3'],
      'correctIndex': 1,
      'hint': '4π/3 is in the 3rd quadrant, tan is positive.',
      'explanation': 'tan(4π/3) = -√3.'
    },
    {
      'question': '10. If sin θ = -5/13, find cos θ.',
      'options': ['12/13', '-12/13', '5/13', '-5/13'],
      'correctIndex': 1,
      'hint': 'Use sin²θ + cos²θ = 1 → cos θ = ±√(1 − sin²θ).',
      'explanation': 'cos θ = -12/13.'
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
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 16',
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
                    backgroundColor: Colors.teal,
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
