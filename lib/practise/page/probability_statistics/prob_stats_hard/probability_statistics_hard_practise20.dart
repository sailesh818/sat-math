import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise20 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise20({super.key});

  @override
  State<ProbabilityStatisticsHardPractise20> createState() =>
      _ProbabilityStatisticsHardPractise20State();
}

class _ProbabilityStatisticsHardPractise20State
    extends State<ProbabilityStatisticsHardPractise20> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 15 red, 10 blue, and 5 green marbles. Five marbles are drawn without replacement. What is the probability that three are red and one is green?",
      "options": ["210/560", "208/560", "205/560", "212/560"],
      "correctIndex": 0,
      "hint": "Use combinations: C(15,3)*C(5,1)*C(10,1)/C(30,5)",
      "explanation": "Favorable = 210, total = 560 → 210/560"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting exactly four 1s and one 2?",
      "options": ["150/7776", "145/7776", "155/7776", "160/7776"],
      "correctIndex": 0,
      "hint": "Use multinomial probability formula",
      "explanation": "P = 150/7776"
    },
    {
      "question":
          "3. In a class of 66 students, 32 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "correctIndex": 0,
      "hint": "Use combinations: C(32,2)*C(34,1)/C(66,3)",
      "explanation": "Favorable = 231, total = 19600 → 231/19600"
    },
    {
      "question":
          "4. The data set is {11, 12, 13, 14, 14, 15, 16, 17, 17, 18, 19, 20, 21}. What is the interquartile range (IQR)?",
      "options": ["7", "6", "5", "8"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1=13, Q3=20 → IQR=7"
    },
    {
      "question":
          "5. A coin is flipped sixteen times. What is the probability of getting exactly thirteen heads?",
      "options": ["560/65536", "550/65536", "570/65536", "565/65536"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(16,13)/2^16",
      "explanation": "C(16,13)=560 → 560/65536"
    },
    {
      "question":
          "6. A spinner has numbers 1–96. What is the probability of spinning a number divisible by 6 or 8?",
      "options": ["37/96", "36/96", "38/96", "35/96"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 6 + divisible by 8 - divisible by 24",
      "explanation": "Favorable = 37 → 37/96"
    },
    {
      "question":
          "7. The mean of 24 numbers is 68. If 23 numbers are 67, 69, 68, 70, 68, 71, 66, 69, 68, 70, 67, 71, 66, 69, 68, 70, 67, 72, 66, 69, 68, 70, 67, what is the 24th number?",
      "options": ["68", "69", "67", "70"],
      "correctIndex": 0,
      "hint": "Sum = mean*24, subtract sum of 23 numbers",
      "explanation": "Sum=68*24=1632, sum of 23=1564 → 24th=68"
    },
    {
      "question":
          "8. A number from 1 to 250 is chosen randomly. What is the probability that it is divisible by 9 or 10?",
      "options": ["52/250", "50/250", "53/250", "51/250"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 9 + divisible by 10 - divisible by 90",
      "explanation": "Favorable = 52 → 52/250"
    },
    {
      "question":
          "9. The set of scores is {80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100, 102, 104}. What is the approximate standard deviation?",
      "options": ["9.9", "10.0", "9.5", "9.2"],
      "correctIndex": 0,
      "hint": "SD ≈ √(Σ(x-mean)^2/n)",
      "explanation": "SD ≈ 9.9"
    },
    {
      "question":
          "10. A die is rolled six times. What is the probability that exactly three rolls show even numbers?",
      "options": ["80/243", "81/243", "78/243", "82/243"],
      "correctIndex": 0,
      "hint": "Use binomial formula: P(X=3) where p=1/2",
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
              'You have finished all Probability & Statistics Hard Practice 20 questions!'),
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
          'Probability & Statistics - Hard 20',
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
