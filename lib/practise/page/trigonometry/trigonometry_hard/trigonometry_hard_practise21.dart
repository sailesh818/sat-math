import 'package:flutter/material.dart';

class TrigonometryHardPractise21 extends StatefulWidget {
  const TrigonometryHardPractise21({super.key});

  @override
  State<TrigonometryHardPractise21> createState() =>
      _TrigonometryHardPractise21State();
}

class _TrigonometryHardPractise21State
    extends State<TrigonometryHardPractise21> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If sin θ = 8/17, find cos θ.',
      'options': ['15/17', '-15/17', '8/17', '-8/17'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → cos θ = ±√(1 − sin²θ).',
      'explanation': 'cos θ = √(1 − (8/17)²) = 15/17.'
    },
    {
      'question': '2. Solve for θ: tan θ = 3/4.',
      'options': ['arctan(3/4)', 'arctan(4/3)', 'π/4', 'π/3'],
      'correctIndex': 0,
      'hint': 'θ = arctan(3/4)',
      'explanation': 'θ = arctan(3/4).'
    },
    {
      'question': '3. If cos θ = -9/41, find sin θ.',
      'options': ['40/41', '-40/41', '9/41', '-9/41'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → sin θ = ±√(1 − cos²θ).',
      'explanation': 'sin θ = √(1 − (-9/41)²) = 40/41.'
    },
    {
      'question': '4. Find sin(5π/3).',
      'options': ['-√3/2', '√3/2', '-1/2', '1/2'],
      'correctIndex': 0,
      'hint': '5π/3 is in the 4th quadrant, sin is negative.',
      'explanation': 'sin(5π/3) = -√3/2.'
    },
    {
      'question': '5. Find the amplitude of y = -7sin(3x).',
      'options': ['7', '-7', '3', '1'],
      'correctIndex': 0,
      'hint': 'Amplitude = |coefficient of sine|.',
      'explanation': 'Amplitude = 7.'
    },
    {
      'question': '6. Solve for θ: cot θ = 11/60.',
      'options': ['arccot(11/60)', 'arctan(11/60)', 'arctan(60/11)', 'arccot(60/11)'],
      'correctIndex': 0,
      'hint': 'θ = arccot(11/60)',
      'explanation': 'θ = arccot(11/60).'
    },
    {
      'question': '7. What is the period of y = cos(7x)?',
      'options': ['2π/7', 'π/7', '2π', 'π'],
      'correctIndex': 0,
      'hint': 'Period of cos(kx) = 2π / k.',
      'explanation': 'Period = 2π / 7.'
    },
    {
      'question': '8. If sec θ = -17/8, find cos θ.',
      'options': ['-8/17', '8/17', '-17/8', '17/8'],
      'correctIndex': 0,
      'hint': 'sec θ = 1 / cos θ',
      'explanation': 'cos θ = -8/17.'
    },
    {
      'question': '9. Find tan(11π/6).',
      'options': ['1/√3', '-1/√3', '√3', '-√3'],
      'correctIndex': 1,
      'hint': '11π/6 is in the 4th quadrant, tan is negative.',
      'explanation': 'tan(11π/6) = -1/√3.'
    },
    {
      'question': '10. If sin θ = -8/17, find cos θ.',
      'options': ['15/17', '-15/17', '8/17', '-8/17'],
      'correctIndex': 1,
      'hint': 'Use sin²θ + cos²θ = 1 → cos θ = ±√(1 − sin²θ).',
      'explanation': 'cos θ = -15/17.'
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
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 21',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
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
                    ? Colors.indigo.shade200
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
                  color: Colors.indigo.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(question['hint'], style: const TextStyle(fontSize: 16)),
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
