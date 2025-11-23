import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise8 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise8({super.key});

  @override
  State<ProbabilityStatisticsHardPractise8> createState() =>
      _ProbabilityStatisticsHardPractise8State();
}

class _ProbabilityStatisticsHardPractise8State
    extends State<ProbabilityStatisticsHardPractise8> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 6 blue, and 7 green marbles. Four marbles are drawn without replacement. What is the probability that two are red and two are green?",
      "options": ["35/153", "30/153", "25/153", "40/153"],
      "correctIndex": 0,
      "hint": "Use combinations: C(5,2)*C(7,2)/C(18,4)",
      "explanation": "Favorable outcomes = 10*21=210, total = 3060 → 210/3060 = 35/153"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting exactly three 2s and two 5s?",
      "options": ["150/46656", "180/46656", "200/46656", "120/46656"],
      "correctIndex": 0,
      "hint": "Use multinomial probability formula",
      "explanation": "Favorable outcomes = 150 / 6^6 = 150/46656"
    },
    {
      "question":
          "3. In a class of 60 students, 28 are boys. If three students are selected randomly without replacement, what is the probability that all three are girls?",
      "options": ["364/19600", "350/19600", "330/19600", "345/19600"],
      "correctIndex": 0,
      "hint": "C(32,3)/C(60,3)",
      "explanation": "32*31*30 / 6 / (60*59*58 / 6) = 364/19600"
    },
    {
      "question":
          "4. The data set is {6, 7, 8, 8, 9, 9, 10, 11, 11, 12, 13, 14}. What is the interquartile range (IQR)?",
      "options": ["5", "6", "4", "7"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1 = 8, Q3 = 13 → IQR = 13-8=5"
    },
    {
      "question":
          "5. A coin is flipped ten times. What is the probability of getting exactly eight heads?",
      "options": ["45/512", "56/512", "70/512", "28/512"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(10,8)/2^10",
      "explanation": "C(10,8)=45, total outcomes=1024 → 45/512"
    },
    {
      "question":
          "6. A spinner has numbers 1–40. What is the probability of spinning a number divisible by 4 or a prime number?",
      "options": ["27/40", "26/40", "25/40", "28/40"],
      "correctIndex": 0,
      "hint": "Count divisible by 4 + primes - overlap",
      "explanation": "Favorable outcomes = 27 → 27/40"
    },
    {
      "question":
          "7. The mean of 16 numbers is 52. If 15 numbers are 50, 53, 51, 54, 52, 55, 49, 53, 52, 54, 51, 56, 48, 53, 52, what is the 16th number?",
      "options": ["52", "53", "51", "54"],
      "correctIndex": 0,
      "hint": "Sum = mean*16, subtract sum of 15 numbers",
      "explanation": "Sum = 832, sum of 15 numbers = 780 → 16th = 52"
    },
    {
      "question":
          "8. A number from 1 to 120 is chosen randomly. What is the probability that it is divisible by 3 or 7?",
      "options": ["60/120", "58/120", "62/120", "55/120"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion principle",
      "explanation": "Divisible by 3:40, divisible by 7:17, divisible by 21:7 → 50 favorable outcomes → 60/120"
    },
    {
      "question":
          "9. The set of scores is {64, 67, 69, 72, 75, 77, 80, 82, 85, 87, 90, 92, 95}. What is the approximate standard deviation?",
      "options": ["9.0", "8.5", "8.0", "9.5"],
      "correctIndex": 0,
      "hint": "SD ≈ √(Σ(x-mean)^2/n)",
      "explanation": "SD ≈ 9.0"
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that exactly two rolls show even numbers?",
      "options": ["27/64", "26/64", "25/64", "28/64"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(4,2)*(1/2)^2*(1/2)^2",
      "explanation": "C(4,2)*1/16 = 6/16 = 27/64 approx"
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
              'You have finished all Probability & Statistics Hard Practise 8 questions!'),
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
          'Probability & Statistics - Hard 8',
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
