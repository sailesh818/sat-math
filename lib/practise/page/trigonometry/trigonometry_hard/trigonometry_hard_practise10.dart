import 'package:flutter/material.dart';

class TrigonometryHardPractise10 extends StatefulWidget {
  const TrigonometryHardPractise10({super.key});

  @override
  State<TrigonometryHardPractise10> createState() =>
      _TrigonometryHardPractise10State();
}

class _TrigonometryHardPractise10State
    extends State<TrigonometryHardPractise10> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If sin θ = 4/5, find tan θ.',
      'options': ['3/5', '4/5', '5/4', '3/4'],
      'correctIndex': 0,
      'hint': 'Use tan θ = sin θ / cos θ. Find cos θ first using sin²θ + cos²θ = 1.',
      'explanation': 'cos θ = √(1 - (4/5)²) = 3/5 → tan θ = (4/5)/(3/5) = 4/3.'
    },
    {
      'question': '2. Solve for θ: tan θ = -1.',
      'options': ['3π/4', '5π/4', 'π/4', '7π/4'],
      'correctIndex': 0,
      'hint': 'Tan is negative in the 2nd and 4th quadrants.',
      'explanation': 'θ = 3π/4 (2nd quadrant) or 7π/4 (4th quadrant).'
    },
    {
      'question': '3. If cos θ = -1/3, find sin θ.',
      'options': ['√8/3', '-√8/3', '2/3', '-2/3'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → sin θ = ±√(1 − cos²θ).',
      'explanation': 'sin θ = √(1 − (−1/3)²) = √(8/9) = √8/3.'
    },
    {
      'question': '4. What is the amplitude of y = 6cos(x)?',
      'options': ['6', '-6', '3', '1'],
      'correctIndex': 0,
      'hint': 'Amplitude = |coefficient of cosine|.',
      'explanation': 'Amplitude = |6| = 6.'
    },
    {
      'question': '5. Find the value of sec(5π/3).',
      'options': ['2', '-2', '1/2', '-1/2'],
      'correctIndex': 0,
      'hint': 'sec θ = 1/cos θ. 5π/3 is in 4th quadrant.',
      'explanation': 'cos(5π/3) = 1/2 → sec(5π/3) = 1 / (1/2) = 2.'
    },
    {
      'question': '6. What is the value of cos(3π/2)?',
      'options': ['0', '-1', '1', '√2/2'],
      'correctIndex': 0,
      'hint': 'cos θ = x-coordinate on the unit circle.',
      'explanation': 'cos(3π/2) = 0.'
    },
    {
      'question': '7. Find the period of y = cos(4x).',
      'options': ['π/2', 'π', '2π', '4π'],
      'correctIndex': 0,
      'hint': 'Period of cos(kx) = 2π / k.',
      'explanation': 'Period = 2π / 4 = π/2.'
    },
    {
      'question': '8. If sec θ = 4/3, find cos θ.',
      'options': ['3/4', '4/3', '1/4', '1/3'],
      'correctIndex': 0,
      'hint': 'sec θ = 1 / cos θ.',
      'explanation': 'cos θ = 1 / (4/3) = 3/4.'
    },
    {
      'question': '9. Solve for θ: sin θ = 3/5.',
      'options': ['4/5', '2/5', '3/4', '2/3'],
      'correctIndex': 0,
      'hint': 'θ = arcsin(3/5).',
      'explanation': 'θ = arcsin(3/5).'
    },
    {
      'question': '10. What is the value of tan(π/4)?',
      'options': ['1', '0', '√3', '2'],
      'correctIndex': 0,
      'hint': 'tan θ = sin θ / cos θ.',
      'explanation': 'tan(π/4) = 1.'
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
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 10',
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
