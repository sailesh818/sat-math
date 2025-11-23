import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise12 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise12({super.key});

  @override
  State<ProbabilityStatisticsHardPractise12> createState() =>
      _ProbabilityStatisticsHardPractise12State();
}

class _ProbabilityStatisticsHardPractise12State
    extends State<ProbabilityStatisticsHardPractise12> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 red, 5 blue, and 7 green marbles. Five marbles are drawn without replacement. What is the probability that exactly two are blue and two are green?",
      "options": ["35/210", "40/210", "45/210", "50/210"],
      "correctIndex": 0,
      "hint": "Use combinations: C(5,2)*C(7,2)*C(6,1)/C(18,5)",
      "explanation": "Favorable = 35, total = 210 → 35/210"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting at least four 5s?",
      "options": ["31/7776", "30/7776", "28/7776", "35/7776"],
      "correctIndex": 0,
      "hint": "Use binomial formula: sum of probabilities for 4,5,6 fives",
      "explanation": "P = 31/7776"
    },
    {
      "question":
          "3. In a class of 60 students, 28 are boys. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "correctIndex": 0,
      "hint": "Use combinations: C(32,2)*C(28,1)/C(60,3)",
      "explanation": "Favorable = 231, total = 19600 → 231/19600"
    },
    {
      "question":
          "4. The data set is {6, 7, 8, 8, 9, 10, 11, 12, 12, 13, 14, 15}. What is the interquartile range (IQR)?",
      "options": ["5", "6", "4", "7"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1=8.5, Q3=13.5 → IQR=13.5-8.5=5"
    },
    {
      "question":
          "5. A coin is flipped eleven times. What is the probability of getting exactly eight heads?",
      "options": ["165/2048", "155/2048", "160/2048", "170/2048"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(11,8)/2^11",
      "explanation": "C(11,8)=165 → 165/2048"
    },
    {
      "question":
          "6. A spinner has numbers 1–36. What is the probability of spinning a number divisible by 3 or 4?",
      "options": ["24/36", "22/36", "23/36", "25/36"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 3 + divisible by 4 - divisible by 12",
      "explanation": "Favorable = 24 → 24/36"
    },
    {
      "question":
          "7. The mean of 16 numbers is 62. If 15 numbers are 61, 63, 60, 64, 62, 65, 59, 63, 62, 64, 60, 66, 58, 63, 62, what is the 16th number?",
      "options": ["62", "63", "61", "64"],
      "correctIndex": 0,
      "hint": "Sum = mean*16, subtract sum of 15 numbers",
      "explanation": "Sum=62*16=992, sum of 15=930 → 16th=62"
    },
    {
      "question":
          "8. A number from 1 to 150 is chosen randomly. What is the probability that it is divisible by 7 or 10?",
      "options": ["43/150", "45/150", "41/150", "40/150"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 7 + divisible by 10 - divisible by 70",
      "explanation": "Favorable = 43 → 43/150"
    },
    {
      "question":
          "9. The set of scores is {65, 68, 70, 73, 75, 78, 80, 83, 85, 88, 90, 93, 95}. What is the approximate standard deviation?",
      "options": ["9.0", "9.5", "8.5", "10.0"],
      "correctIndex": 1,
      "hint": "SD ≈ √(Σ(x-mean)^2/n)",
      "explanation": "SD ≈ 9.5"
    },
    {
      "question":
          "10. A die is rolled five times. What is the probability that exactly three rolls show odd numbers?",
      "options": ["80/243", "75/243", "85/243", "90/243"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(5,3)*(1/2)^3*(1/2)^2",
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
              'You have finished all Probability & Statistics Hard Practice 12 questions!'),
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
          'Probability & Statistics - Hard 12',
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
