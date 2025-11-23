import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise17 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise17({super.key});

  @override
  State<ProbabilityStatisticsHardPractise17> createState() =>
      _ProbabilityStatisticsHardPractise17State();
}

class _ProbabilityStatisticsHardPractise17State
    extends State<ProbabilityStatisticsHardPractise17> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 9 red, 6 blue, and 5 green marbles. Five marbles are drawn without replacement. What is the probability that three are red and one is blue?",
      "options": ["84/380", "85/380", "80/380", "82/380"],
      "correctIndex": 0,
      "hint": "Use combinations: C(9,3)*C(6,1)*C(5,1)/C(20,5)",
      "explanation": "Favorable = 84, total = 380 → 84/380"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting exactly two 6s and one 3?",
      "options": ["90/7776", "85/7776", "95/7776", "80/7776"],
      "correctIndex": 0,
      "hint": "Use multinomial probability formula",
      "explanation": "P = 90/7776"
    },
    {
      "question":
          "3. In a class of 58 students, 26 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "correctIndex": 0,
      "hint": "Use combinations: C(26,2)*C(32,1)/C(58,3)",
      "explanation": "Favorable = 231, total = 19600 → 231/19600"
    },
    {
      "question":
          "4. The data set is {8, 9, 10, 10, 11, 12, 13, 14, 14, 15, 16, 17, 18}. What is the interquartile range (IQR)?",
      "options": ["6", "5", "7", "4"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1=10, Q3=16 → IQR=6"
    },
    {
      "question":
          "5. A coin is flipped thirteen times. What is the probability of getting exactly ten heads?",
      "options": ["286/8192", "280/8192", "290/8192", "300/8192"],
      "correctIndex": 0,
      "hint": "Use binomial coefficient: C(13,10)/2^13",
      "explanation": "C(13,10)=286 → 286/8192"
    },
    {
      "question":
          "6. A spinner has numbers 1–60. What is the probability of spinning a number divisible by 4 or 5?",
      "options": ["33/60", "32/60", "34/60", "31/60"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion principle",
      "explanation": "Favorable = 33 → 33/60"
    },
    {
      "question":
          "7. The mean of 21 numbers is 65. If 20 numbers are 64, 66, 65, 67, 65, 68, 63, 66, 65, 67, 64, 69, 62, 66, 65, 67, 64, 68, 63, 66, what is the 21st number?",
      "options": ["65", "66", "64", "67"],
      "correctIndex": 0,
      "hint": "Sum = mean*21, subtract sum of 20 numbers",
      "explanation": "Sum=65*21=1365, sum of 20=1300 → 21st=65"
    },
    {
      "question":
          "8. A number from 1 to 210 is chosen randomly. What is the probability that it is divisible by 7 or 10?",
      "options": ["57/210", "55/210", "56/210", "58/210"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 7 + divisible by 10 - divisible by 70",
      "explanation": "Favorable = 57 → 57/210"
    },
    {
      "question":
          "9. The set of scores is {72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100}. What is the approximate standard deviation?",
      "options": ["9.6", "9.5", "10.0", "9.0"],
      "correctIndex": 0,
      "hint": "SD ≈ √(Σ(x-mean)^2/n)",
      "explanation": "SD ≈ 9.6"
    },
    {
      "question":
          "10. A die is rolled five times. What is the probability that exactly three rolls show odd numbers?",
      "options": ["80/243", "81/243", "85/243", "75/243"],
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
              'You have finished all Probability & Statistics Hard Practice 17 questions!'),
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
          'Probability & Statistics - Hard 17',
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
