import 'package:flutter/material.dart';

class TrigonometryHardPractise9 extends StatefulWidget {
  const TrigonometryHardPractise9({super.key});

  @override
  State<TrigonometryHardPractise9> createState() =>
      _TrigonometryHardPractise9State();
}

class _TrigonometryHardPractise9State extends State<TrigonometryHardPractise9> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If sin θ = 3/5, find cos θ.',
      'options': ['4/5', '-4/5', '3/5', '-3/5'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → cos θ = ±√(1 − sin²θ).',
      'explanation': 'cos θ = √(1 − (3/5)²) = 4/5.'
    },
    {
      'question': '2. Solve for θ: tan θ = 1/√3.',
      'options': ['π/6', 'π/3', 'π/4', 'π/2'],
      'correctIndex': 0,
      'hint': 'Recall tan(θ) = sin(θ)/cos(θ) and common angle values.',
      'explanation': 'tan(π/6) = 1/√3.'
    },
    {
      'question': '3. If cos θ = -√2/2, find sin θ.',
      'options': ['√2/2', '-√2/2', '1/2', '-1/2'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → sin θ = ±√(1 − cos²θ).',
      'explanation': 'sin θ = √(1 − (−√2/2)²) = √2/2.'
    },
    {
      'question': '4. What is the value of sin(2π/3)?',
      'options': ['√3/2', '1/2', '0', '-√3/2'],
      'correctIndex': 0,
      'hint': '2π/3 is in the 2nd quadrant; sin is positive there.',
      'explanation': 'sin(2π/3) = √3/2.'
    },
    {
      'question': '5. What is the amplitude of y = -2sin(3x)?',
      'options': ['2', '-2', '3', '1'],
      'correctIndex': 0,
      'hint': 'Amplitude = |coefficient of sine or cosine|.',
      'explanation': 'Amplitude = |-2| = 2.'
    },
    {
      'question': '6. Solve for θ: cot θ = 5.',
      'options': ['π/5', 'π/6', 'π/4', 'π/3'],
      'correctIndex': 0,
      'hint': 'cot θ = 1/tan θ.',
      'explanation': 'cot θ = 5 → tan θ = 1/5 → θ = arctan(1/5) ≈ π/5.'
    },
    {
      'question': '7. What is the period of y = sin(2x)?',
      'options': ['π', '2π', 'π/2', '3π'],
      'correctIndex': 0,
      'hint': 'Period of sin(kx) = 2π / k.',
      'explanation': 'Period = 2π / 2 = π.'
    },
    {
      'question': '8. If sec θ = 5/3, find cos θ.',
      'options': ['3/5', '5/3', '1/5', '1/3'],
      'correctIndex': 0,
      'hint': 'sec θ = 1/cos θ.',
      'explanation': 'cos θ = 1 / (5/3) = 3/5.'
    },
    {
      'question': '9. Find the value of tan(π/4).',
      'options': ['1', '√2', '√3', '0'],
      'correctIndex': 0,
      'hint': 'tan(θ) = sin(θ)/cos(θ).',
      'explanation': 'tan(π/4) = 1.'
    },
    {
      'question': '10. If sin θ = -5/13, find cos θ.',
      'options': ['12/13', '-12/13', '5/13', '-5/13'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1 → cos θ = ±√(1 − sin²θ).',
      'explanation': 'cos θ = √(1 − (−5/13)²) = 12/13.'
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
      backgroundColor: Colors.deepOrange.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 9',
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
