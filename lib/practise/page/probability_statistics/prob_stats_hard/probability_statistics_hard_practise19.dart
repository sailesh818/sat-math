import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise19 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise19({super.key});

  @override
  State<ProbabilityStatisticsHardPractise19> createState() =>
      _ProbabilityStatisticsHardPractise19State();
}

class _ProbabilityStatisticsHardPractise19State
    extends State<ProbabilityStatisticsHardPractise19> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 12 red, 8 blue, and 6 green marbles. Five marbles are drawn without replacement. What is the probability that three are red and one is blue?",
      "options": ["144/560", "145/560", "140/560", "150/560"],
      "correctIndex": 0,
      "hint": "Use combinations: C(12,3)*C(8,1)*C(6,1)/C(26,5)",
      "explanation": "Favorable = 144, total = 560 → 144/560"
    },
    {
      "question":
          "2. A die is rolled seven times. What is the probability of getting exactly three 3s and two 6s?",
      "options": ["210/279936", "220/279936", "205/279936", "215/279936"],
      "correctIndex": 0,
      "hint": "Use multinomial probability formula",
      "explanation": "P = 210/279936"
    },
    {
      "question":
          "3. In a class of 64 students, 30 are boys. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "correctIndex": 0,
      "hint": "Use combinations: C(34,2)*C(30,1)/C(64,3)",
      "explanation": "Favorable = 231, total = 19600 → 231/19600"
    },
    {
      "question":
          "4. The data set is {10, 11, 12, 13, 14, 15, 15, 16, 17, 18, 19, 20}. What is the interquartile range (IQR)?",
      "options": ["6", "5", "7", "4"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1=13, Q3=19 → IQR=6"
    },
    {
      "question":
          "5. A coin is flipped fifteen times. What is the probability of getting exactly twelve heads?",
      "options": ["455/32768", "460/32768", "450/32768", "440/32768"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(15,12)/2^15",
      "explanation": "C(15,12)=455 → 455/32768"
    },
    {
      "question":
          "6. A spinner has numbers 1–84. What is the probability of spinning a number divisible by 7 or 12?",
      "options": ["29/84", "30/84", "28/84", "31/84"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 7 + divisible by 12 - divisible by 84",
      "explanation": "Favorable = 29 → 29/84"
    },
    {
      "question":
          "7. The mean of 23 numbers is 67. If 22 numbers are 66, 68, 67, 69, 67, 70, 65, 68, 67, 69, 66, 70, 65, 68, 67, 69, 66, 71, 65, 68, 67, 69, what is the 23rd number?",
      "options": ["67", "68", "66", "69"],
      "correctIndex": 0,
      "hint": "Sum = mean*23, subtract sum of 22 numbers",
      "explanation": "Sum=67*23=1541, sum of 22=1474 → 23rd=67"
    },
    {
      "question":
          "8. A number from 1 to 240 is chosen randomly. What is the probability that it is divisible by 8 or 15?",
      "options": ["46/240", "45/240", "44/240", "47/240"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 8 + divisible by 15 - divisible by 120",
      "explanation": "Favorable = 46 → 46/240"
    },
    {
      "question":
          "9. The set of scores is {78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100, 102}. What is the approximate standard deviation?",
      "options": ["9.7", "9.5", "10.0", "9.2"],
      "correctIndex": 0,
      "hint": "SD ≈ √(Σ(x-mean)^2/n)",
      "explanation": "SD ≈ 9.7"
    },
    {
      "question":
          "10. A die is rolled five times. What is the probability that exactly two rolls show even numbers?",
      "options": ["80/243", "81/243", "78/243", "82/243"],
      "correctIndex": 0,
      "hint": "Use binomial formula: P(X=2) where p=1/2",
      "explanation": "P = 80/243"
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
          content: const Text(
              'You have finished all Probability & Statistics Hard Practice 19 questions!'),
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
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text(
          'Probability & Statistics - Hard 19',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlue,
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
                    backgroundColor: Colors.blue,
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    option,
                    style: const TextStyle(fontSize: 17),
                  ),
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
                    backgroundColor: Colors.orange,
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
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  question['hint'],
                  style: const TextStyle(fontSize: 16),
                ),
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
                  backgroundColor: Colors.lightBlue,
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
