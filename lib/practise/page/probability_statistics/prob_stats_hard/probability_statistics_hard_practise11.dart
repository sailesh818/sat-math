import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise11 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise11({super.key});

  @override
  State<ProbabilityStatisticsHardPractise11> createState() =>
      _ProbabilityStatisticsHardPractise11State();
}

class _ProbabilityStatisticsHardPractise11State
    extends State<ProbabilityStatisticsHardPractise11> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 6 blue, and 9 green marbles. Four marbles are drawn without replacement. What is the probability that exactly two are green and one is red?",
      "options": ["45/210", "50/210", "40/210", "35/210"],
      "correctIndex": 0,
      "hint": "Use combinations: C(9,2)*C(5,1)*C(6,1)/C(20,4)",
      "explanation": "Favorable = 45, total = 210 → 45/210"
    },
    {
      "question": "2. A die is rolled five times. What is the probability of getting exactly three 2s?",
      "options": ["80/7776", "75/7776", "85/7776", "90/7776"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(5,3)*(1/6)^3*(5/6)^2",
      "explanation": "P = 80/7776"
    },
    {
      "question":
          "3. In a class of 50 students, 22 are girls. If three students are selected randomly without replacement, what is the probability that all three are girls?",
      "options": ["364/19600", "350/19600", "345/19600", "360/19600"],
      "correctIndex": 0,
      "hint": "Use combinations: C(22,3)/C(50,3)",
      "explanation": "Favorable = 364, total = 19600 → 364/19600"
    },
    {
      "question":
          "4. The data set is {7, 8, 9, 9, 10, 11, 12, 12, 13, 14, 15, 16}. What is the interquartile range (IQR)?",
      "options": ["5", "6", "4", "7"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1=10, Q3=15 → IQR=15-10=5"
    },
    {
      "question": "5. A coin is flipped ten times. What is the probability of getting exactly seven heads?",
      "options": ["120/1024", "130/1024", "115/1024", "125/1024"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(10,7)/2^10",
      "explanation": "C(10,7)=120 → 120/1024"
    },
    {
      "question":
          "6. A spinner has numbers 1–48. What is the probability of spinning a number divisible by 4 or 6?",
      "options": ["28/48", "26/48", "27/48", "25/48"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion principle",
      "explanation": "Favorable = 28 → 28/48"
    },
    {
      "question":
          "7. The mean of 14 numbers is 58. If 13 numbers are 57, 59, 56, 60, 58, 61, 55, 59, 58, 60, 56, 62, 57, what is the 14th number?",
      "options": ["58", "59", "57", "60"],
      "correctIndex": 0,
      "hint": "Sum = mean*14, subtract sum of 13 numbers",
      "explanation": "Sum = 812, sum of 13 = 754 → 14th = 58"
    },
    {
      "question":
          "8. A number from 1 to 180 is chosen randomly. What is the probability that it is divisible by 5 or 9?",
      "options": ["68/180", "66/180", "70/180", "65/180"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion principle",
      "explanation": "Favorable = 68 → 68/180"
    },
    {
      "question":
          "9. The set of scores is {66, 68, 70, 72, 75, 77, 80, 82, 85, 87, 90, 92, 95}. What is the approximate standard deviation?",
      "options": ["9.2", "9.5", "9.0", "8.8"],
      "correctIndex": 0,
      "hint": "SD ≈ √(Σ(x-mean)^2/n)",
      "explanation": "SD ≈ 9.2"
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that exactly one roll shows an even number?",
      "options": ["81/256", "80/256", "79/256", "82/256"],
      "correctIndex": 0,
      "hint": "Exactly 1 even → C(4,1)*(1/2)^1*(1/2)^3",
      "explanation": "P = 81/256"
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
              'You have finished all Probability & Statistics Hard Practice 11 questions!'),
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
          'Probability & Statistics - Hard 11',
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
