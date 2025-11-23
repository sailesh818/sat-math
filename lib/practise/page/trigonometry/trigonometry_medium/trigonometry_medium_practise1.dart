import 'package:flutter/material.dart';

class TrigonometryMediumPractise1 extends StatefulWidget {
  const TrigonometryMediumPractise1({super.key});

  @override
  State<TrigonometryMediumPractise1> createState() =>
      _TrigonometryMediumPractise1State();
}

class _TrigonometryMediumPractise1State
    extends State<TrigonometryMediumPractise1> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. In a right triangle, sin θ = 3/5. What is cos θ?',
      'options': ['4/5', '3/5', '5/3', '1/2'],
      'correctIndex': 0,
      'hint': 'Use Pythagorean identity: sin²θ + cos²θ = 1',
      'explanation': 'cos θ = √(1 - (3/5)²) = 4/5'
    },
    {
      'question':
          '2. A right triangle has sides 7, 24, and 25. What is tan θ where θ is opposite the side of length 7?',
      'options': ['7/24', '24/7', '7/25', '24/25'],
      'correctIndex': 0,
      'hint': 'tan θ = opposite / adjacent',
      'explanation': 'tan θ = 7/24'
    },
    {
      'question': '3. Find the exact value of sin 45° × cos 45°.',
      'options': ['1/2', '1/√2', '1/4', '√2/2'],
      'correctIndex': 0,
      'hint': 'sin 45° = cos 45° = √2/2',
      'explanation': 'sin 45° × cos 45° = (√2/2)*(√2/2) = 1/2'
    },
    {
      'question': '4. If cos θ = 5/13, find sin θ in a right triangle.',
      'options': ['12/13', '5/12', '13/12', '12/5'],
      'correctIndex': 0,
      'hint': 'Use sin²θ + cos²θ = 1',
      'explanation': 'sin θ = √(1 - (5/13)²) = 12/13'
    },
    {
      'question':
          '5. The hypotenuse of a right triangle is 10 and one leg is 6. What is tan θ where θ is opposite the leg of length 6?',
      'options': ['3/4', '6/8', '4/3', '6/10'],
      'correctIndex': 0,
      'hint': 'Find the other leg using Pythagoras, then tan θ = opposite/adjacent',
      'explanation': 'Other leg = √(10²-6²) = 8, tan θ = 6/8 = 3/4'
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
          content: const Text('You have completed all medium-level practise questions!'),
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
          'Trigonometry Medium - Practise 1',
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
                  borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w600, height: 1.4),
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
                    ? Colors.green.shade200
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
                  label: const Text("Hint",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade700,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
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
                    borderRadius: BorderRadius.circular(12)),
                child: Text(question['hint'], style: const TextStyle(fontSize: 16)),
              ),

            const SizedBox(height: 20),

            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(12)),
                child: Text("Explanation: ${question['explanation']}",
                    style: const TextStyle(fontSize: 16)),
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
