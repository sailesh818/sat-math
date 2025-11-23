import 'package:flutter/material.dart';

class AlgebraHardPractise20 extends StatefulWidget {
  const AlgebraHardPractise20({super.key});

  @override
  State<AlgebraHardPractise20> createState() => _AlgebraHardPractise20State();
}

class _AlgebraHardPractise20State extends State<AlgebraHardPractise20> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. If a population grows exponentially as P(t) = 100e^(0.05t), what is the population at t = 10?',
      'options': ['164', '150', '155', '170'],
      'correctIndex': 0,
      'hint': 'Use P(t) = P0 * e^(kt) and plug in t=10',
      'explanation': 'P(10) = 100 * e^(0.05*10) = 100 * e^0.5 ≈ 164'
    },
    {
      'question': '2. Solve: 2^x = 16',
      'options': ['x = 4', 'x = 2', 'x = 8', 'x = 3'],
      'correctIndex': 0,
      'hint': 'Express 16 as a power of 2',
      'explanation': '16 = 2^4 → 2^x = 2^4 → x = 4'
    },
    {
      'question':
          '3. The half-life of a substance is 5 hours. Write its exponential decay formula if initial amount is 200.',
      'options': [
        'N(t) = 200*(1/2)^(t/5)',
        'N(t) = 200*2^(t/5)',
        'N(t) = 200*(1/2)^t',
        'N(t) = 200*e^(t/5)'
      ],
      'correctIndex': 0,
      'hint': 'Use N(t) = N0*(1/2)^(t/half-life)',
      'explanation': 'Half-life formula: N(t) = 200*(1/2)^(t/5)'
    },
    {
      'question': '4. Solve: e^(2x) = 7',
      'options': ['x = ln7/2', 'x = ln7', 'x = 2ln7', 'x = ln7/4'],
      'correctIndex': 0,
      'hint': 'Take natural log both sides and divide by 2',
      'explanation': 'e^(2x)=7 → 2x = ln7 → x = ln7 / 2'
    },
    {
      'question':
          '5. A bank account grows continuously at 6% per year. If initial amount is \$1000, find amount after 3 years.',
      'options': ['\$1191.82', '\$1180', '\$1200', '\$1175'],
      'correctIndex': 0,
      'hint': 'Use A = P * e^(rt) with r = 0.06 and t = 3',
      'explanation': 'A = 1000*e^(0.06*3) ≈ 1000*e^0.18 ≈ 1191.82'
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
          content: const Text('You have finished all questions.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            )
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
        title: const Text('Algebra Hard - Practise 20'),
        backgroundColor: Colors.orange.shade700,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
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
                    backgroundColor: Colors.orange.shade700,
                    child: Text("${index + 1}",
                        style: const TextStyle(color: Colors.white)),
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
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade700,
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
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                    Text(question['hint'], style: const TextStyle(fontSize: 16)),
              ),
            const SizedBox(height: 20),
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
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
                  backgroundColor: Colors.orange.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1
                      ? "Finish"
                      : "Next Question",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
