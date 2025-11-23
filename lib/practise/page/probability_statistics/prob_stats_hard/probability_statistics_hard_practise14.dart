import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise14 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise14({super.key});

  @override
  State<ProbabilityStatisticsHardPractise14> createState() =>
      _ProbabilityStatisticsHardPractise14State();
}

class _ProbabilityStatisticsHardPractise14State
    extends State<ProbabilityStatisticsHardPractise14> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 8 red, 5 blue, and 7 green marbles. Four marbles are drawn without replacement. What is the probability that two are red and one is green?",
      "options": ["56/210", "60/210", "50/210", "55/210"],
      "correctIndex": 0,
      "hint": "Use combinations: C(8,2)*C(7,1)*C(5,1)/C(20,4)",
      "explanation": "Favorable = 56, total = 210 → 56/210"
    },
    {
      "question":
          "2. A die is rolled five times. What is the probability of getting exactly two 1s and exactly one 6?",
      "options": ["80/7776", "85/7776", "75/7776", "90/7776"],
      "correctIndex": 0,
      "hint": "Use multinomial probability: C(5,2,1,2)*(1/6)^3*(5/6)^2",
      "explanation": "P = 80/7776"
    },
    {
      "question":
          "3. In a class of 56 students, 24 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are boys?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "correctIndex": 0,
      "hint": "Use combinations: C(32,2)*C(24,1)/C(56,3)",
      "explanation": "Favorable = 231, total = 19600 → 231/19600"
    },
    {
      "question":
          "4. The data set is {9, 10, 10, 11, 12, 13, 14, 15, 15, 16, 17, 18}. What is the interquartile range (IQR)?",
      "options": ["6", "5", "7", "4"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1=11, Q3=17 → IQR=17-11=6"
    },
    {
      "question":
          "5. A coin is flipped twelve times. What is the probability of getting exactly ten heads?",
      "options": ["66/4096", "70/4096", "60/4096", "68/4096"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(12,10)/2^12",
      "explanation": "C(12,10)=66 → 66/4096"
    },
    {
      "question":
          "6. A spinner has numbers 1–50. What is the probability of spinning a number divisible by 5 or 8?",
      "options": ["21/50", "22/50", "23/50", "20/50"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 5 + divisible by 8 - divisible by 40",
      "explanation": "Favorable = 21 → 21/50"
    },
    {
      "question":
          "7. The mean of 18 numbers is 63. If 17 numbers are 62, 64, 61, 65, 63, 66, 60, 64, 63, 65, 62, 67, 61, 64, 63, 65, 62, what is the 18th number?",
      "options": ["63", "64", "62", "65"],
      "correctIndex": 0,
      "hint": "Sum = mean*18, subtract sum of 17 numbers",
      "explanation": "Sum=63*18=1134, sum of 17=1071 → 18th=63"
    },
    {
      "question":
          "8. A number from 1 to 180 is chosen randomly. What is the probability that it is divisible by 7 or 9?",
      "options": ["43/180", "45/180", "41/180", "40/180"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 7 + divisible by 9 - divisible by 63",
      "explanation": "Favorable = 43 → 43/180"
    },
    {
      "question":
          "9. The set of scores is {70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96}. What is the approximate standard deviation?",
      "options": ["9.0", "9.5", "8.5", "10.0"],
      "correctIndex": 0,
      "hint": "SD ≈ √(Σ(x-mean)^2/n)",
      "explanation": "SD ≈ 9.0"
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that exactly three rolls show odd numbers?",
      "options": ["27/64", "28/64", "26/64", "25/64"],
      "correctIndex": 0,
      "hint": "Odd numbers on a die: 1,3,5 → P=1/2, use binomial formula",
      "explanation": "P = C(4,3)*(1/2)^3*(1/2)^1 = 27/64"
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
              'You have finished all Probability & Statistics Hard Practice 14 questions!'),
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
          'Probability & Statistics - Hard 14',
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
