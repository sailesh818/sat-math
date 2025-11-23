import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise15 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise15({super.key});

  @override
  State<ProbabilityStatisticsHardPractise15> createState() =>
      _ProbabilityStatisticsHardPractise15State();
}

class _ProbabilityStatisticsHardPractise15State
    extends State<ProbabilityStatisticsHardPractise15> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 7 blue, and 8 green marbles. Four marbles are drawn without replacement. What is the probability that two are blue and one is red?",
      "options": ["70/380", "75/380", "65/380", "68/380"],
      "correctIndex": 0,
      "hint": "Use combinations: C(7,2)*C(5,1)*C(8,1)/C(20,4)",
      "explanation": "Favorable = 70, total = 380 → 70/380"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting exactly three 2s and exactly one 5?",
      "options": ["90/7776", "85/7776", "80/7776", "95/7776"],
      "correctIndex": 0,
      "hint": "Use multinomial probability: C(6,3,1,2)*(1/6)^4*(5/6)^2",
      "explanation": "P = 90/7776"
    },
    {
      "question":
          "3. In a class of 60 students, 25 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "correctIndex": 0,
      "hint": "Use combinations: C(25,2)*C(35,1)/C(60,3)",
      "explanation": "Favorable = 231, total = 19600 → 231/19600"
    },
    {
      "question":
          "4. The data set is {8, 9, 10, 11, 11, 12, 13, 14, 15, 15, 16, 17}. What is the interquartile range (IQR)?",
      "options": ["6", "5", "4", "7"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1=11, Q3=17 → IQR=6"
    },
    {
      "question":
          "5. A coin is flipped ten times. What is the probability of getting exactly eight heads?",
      "options": ["45/1024", "50/1024", "48/1024", "40/1024"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(10,8)/2^10",
      "explanation": "C(10,8)=45 → 45/1024"
    },
    {
      "question":
          "6. A spinner has numbers 1–48. What is the probability of spinning a number divisible by 4 or 6?",
      "options": ["28/48", "26/48", "27/48", "25/48"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 4 + divisible by 6 - divisible by 12",
      "explanation": "Favorable = 28 → 28/48"
    },
    {
      "question":
          "7. The mean of 20 numbers is 64. If 19 numbers are 63, 65, 64, 66, 64, 67, 62, 65, 64, 66, 63, 68, 61, 65, 64, 66, 63, 69, 62, what is the 20th number?",
      "options": ["64", "65", "63", "66"],
      "correctIndex": 0,
      "hint": "Sum = mean*20, subtract sum of 19 numbers",
      "explanation": "Sum=64*20=1280, sum of 19=1216 → 20th=64"
    },
    {
      "question":
          "8. A number from 1 to 200 is chosen randomly. What is the probability that it is divisible by 7 or 11?",
      "options": ["41/200", "42/200", "43/200", "40/200"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 7 + divisible by 11 - divisible by 77",
      "explanation": "Favorable = 41 → 41/200"
    },
    {
      "question":
          "9. The set of scores is {70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98}. What is the approximate standard deviation?",
      "options": ["9.5", "10.0", "9.0", "9.8"],
      "correctIndex": 0,
      "hint": "SD ≈ √(Σ(x-mean)^2/n)",
      "explanation": "SD ≈ 9.5"
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that exactly two rolls show even numbers?",
      "options": ["27/64", "28/64", "26/64", "25/64"],
      "correctIndex": 0,
      "hint": "Even numbers on a die: 2,4,6 → P=1/2, use binomial formula",
      "explanation": "P = 27/64"
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
              'You have finished all Probability & Statistics Hard Practice 15 questions!'),
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
          'Probability & Statistics - Hard 15',
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
