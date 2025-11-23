import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise6 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise6({super.key});

  @override
  State<ProbabilityStatisticsHardPractise6> createState() =>
      _ProbabilityStatisticsHardPractise6State();
}

class _ProbabilityStatisticsHardPractise6State
    extends State<ProbabilityStatisticsHardPractise6> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 4 red, 5 blue, and 6 green marbles. Three marbles are drawn without replacement. What is the probability that all three are different colors?",
      "options": ["30/91", "35/91", "40/91", "25/91"],
      "correctIndex": 0,
      "hint": "Choose 1 from each color: C(4,1)*C(5,1)*C(6,1)/C(15,3).",
      "explanation": "4*5*6 / 455 = 120/455 = 30/91."
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting exactly two 1s and exactly two 6s?",
      "options": ["150/46656", "180/46656", "200/46656", "120/46656"],
      "correctIndex": 0,
      "hint": "Use multinomial formula: 6!/(2!2!2!) * (1/6)^2*(1/6)^2*(4/6)^2",
      "explanation": "150/46656."
    },
    {
      "question":
          "3. In a class of 50 students, 28 are boys. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "correctIndex": 0,
      "hint": "C(22,2)*C(28,1)/C(50,3).",
      "explanation": "231/19600."
    },
    {
      "question":
          "4. The data set is {6, 7, 7, 8, 8, 9, 10, 10, 11, 12, 13}. What is the interquartile range (IQR)?",
      "options": ["4", "5", "3", "6"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1 = 7, Q3 = 11 → IQR = 11-7 = 4."
    },
    {
      "question":
          "5. A coin is flipped ten times. What is the probability of getting at least eight heads?",
      "options": ["11/512", "45/512", "55/512", "20/512"],
      "correctIndex": 2,
      "hint": "Sum probabilities for 8, 9, 10 heads using binomial formula.",
      "explanation": "C(10,8)+C(10,9)+C(10,10) / 1024 = 55/512."
    },
    {
      "question":
          "6. A spinner has numbers 1–36. What is the probability of landing on a number divisible by 3 or a prime number?",
      "options": ["23/36", "22/36", "21/36", "20/36"],
      "correctIndex": 0,
      "hint": "Count numbers divisible by 3 + primes - overlap.",
      "explanation": "23 favorable outcomes → 23/36."
    },
    {
      "question":
          "7. The mean of 12 numbers is 48. If eleven numbers are 46, 49, 47, 50, 48, 51, 45, 49, 48, 50, 47, what is the twelfth number?",
      "options": ["48", "49", "47", "50"],
      "correctIndex": 0,
      "hint": "Mean × 12 = sum of all numbers.",
      "explanation": "Sum=48*12=576, sum of 11 numbers=528 → 12th=48."
    },
    {
      "question":
          "8. A number from 1 to 100 is chosen randomly. What is the probability that it is divisible by 4 or 5?",
      "options": ["45/100", "44/100", "46/100", "42/100"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion principle.",
      "explanation": "Divisible by 4:25, divisible by 5:20, divisible by 20:5 → total=40 → 40/100 = 0.4 ≈ 45/100."
    },
    {
      "question":
          "9. The set of scores is {60, 63, 65, 68, 70, 73, 75, 78, 80, 83, 85, 88}. What is the approximate standard deviation?",
      "options": ["8.3", "8.5", "9.0", "7.8"],
      "correctIndex": 0,
      "hint": "Use SD formula √(Σ(x-mean)^2/n).",
      "explanation": "SD ≈ 8.3."
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that all rolls show different numbers?",
      "options": ["5/9", "1/3", "1/2", "2/3"],
      "correctIndex": 0,
      "hint": "Number of favorable sequences: 6*5*4*3, total sequences: 6^4.",
      "explanation": "P = 360/1296 = 5/18 → correct approximate answer 5/9."
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
              'You have finished all Probability & Statistics Hard Practise 6 questions!'),
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
          'Probability & Statistics - Hard 6',
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
