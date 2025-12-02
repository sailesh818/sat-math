import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise2 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise2({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise2> createState() =>
      _ProbabilityStatisticsEasyPractise2State();
}

class _ProbabilityStatisticsEasyPractise2State
    extends State<ProbabilityStatisticsEasyPractise2> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. A spinner has 4 equal sections numbered 1, 2, 3, and 4. What is the probability of landing on an even number?',
      'options': ['1/4', '1/2', '2/3', '3/4'],
      'correctIndex': 1,
      'hint': 'Even numbers are 2 and 4.',
      'explanation': 'Favorable outcomes = 2, total outcomes = 4 → Probability = 2/4 = 1/2'
    },
    {
      'question': '2. What is the range of the data set: 3, 9, 7, 4, 10?',
      'options': ['6', '7', '5', '8'],
      'correctIndex': 1,
      'hint': 'Range = Maximum - Minimum',
      'explanation': 'Max = 10, Min = 3 → Range = 10 - 3 = 7'
    },
    {
      'question':
          '3. A bag contains 5 green marbles and 5 yellow marbles. What is the probability of selecting a yellow marble?',
      'options': ['1/5', '1/2', '2/5', '3/5'],
      'correctIndex': 1,
      'hint': 'Probability = favorable / total',
      'explanation': 'Favorable = 5 yellow, total = 10 → Probability = 5/10 = 1/2'
    },
    {
      'question':
          '4. The mean of five numbers is 12. If four of the numbers are 10, 11, 13, and 14, what is the fifth number?',
      'options': ['10', '12', '14', '15'],
      'correctIndex': 1,
      'hint': 'Mean × total numbers = sum of numbers',
      'explanation': 'Sum = 12×5=60, sum of four numbers = 48 → fifth number = 60-48=12'
    },
    {
      'question':
          '5. A number cube (die) is rolled once. What is the probability of rolling a number greater than 4?',
      'options': ['1/6', '2/6', '3/6', '4/6'],
      'correctIndex': 1,
      'hint': 'Numbers greater than 4 are 5 and 6',
      'explanation': 'Favorable = 2, total = 6 → Probability = 2/6'
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
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('🎯 Practice Completed!'),
          content: Text(
            'You completed all questions!',
            style: const TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back', style: TextStyle(color: Colors.green)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  currentQuestionIndex = 0;
                  selectedAnswerIndex = null;
                  answerChecked = false;
                  showHint = false;
                });
              },
              child:
                  const Text('Restart', style: TextStyle(color: Colors.green)),
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
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Probability & Statistics - Easy Practise 2',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.blue,
              backgroundColor: Colors.blue.shade100,
            ),
            const SizedBox(height: 20),
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
                    borderRadius: BorderRadius.circular(14)),
                child: ListTile(
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
                  onPressed: () => setState(() => showHint = !showHint),
                  icon: const Icon(Icons.lightbulb_outline, color: Colors.white),
                  label:
                      const Text("Hint", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
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
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(question['hint'], style: const TextStyle(fontSize: 16)),
              ),
            const SizedBox(height: 20),
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("Explanation: ${question['explanation']}",
                    style: const TextStyle(fontSize: 16)),
              ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: answerChecked ? nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
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
            ),
          ],
        ),
      ),
    );
  }
}
