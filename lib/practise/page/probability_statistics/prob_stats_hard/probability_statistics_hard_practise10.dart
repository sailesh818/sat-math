import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise10 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise10({super.key});

  @override
  State<ProbabilityStatisticsHardPractise10> createState() =>
      _ProbabilityStatisticsHardPractise10State();
}

class _ProbabilityStatisticsHardPractise10State
    extends State<ProbabilityStatisticsHardPractise10> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 red, 5 blue, and 7 green marbles. Five marbles are drawn without replacement. What is the probability that three are green and one is blue?",
      "options": ["42/462", "45/462", "40/462", "35/462"],
      "correctIndex": 0,
      "hint": "Use combinations: C(7,3)*C(5,1)/C(18,5)",
      "explanation": "Favorable = 42, total = 462 → 42/462"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting exactly two 1s and exactly two 6s?",
      "options": ["150/46656", "180/46656", "200/46656", "120/46656"],
      "correctIndex": 0,
      "hint": "Use multinomial formula for exact occurrences",
      "explanation": "P = 150/46656"
    },
    {
      "question":
          "3. In a class of 52 students, 24 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are boys?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "correctIndex": 0,
      "hint": "Use combinations: C(28,2)*C(24,1)/C(52,3)",
      "explanation": "Favorable = 231, total = 19600 → 231/19600"
    },
    {
      "question":
          "4. The data set is {8, 9, 9, 10, 10, 11, 12, 13, 14, 15, 16, 17}. What is the interquartile range (IQR)?",
      "options": ["6", "5", "7", "4"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1=10, Q3=16 → IQR=16-10=6"
    },
    {
      "question":
          "5. A coin is flipped twelve times. What is the probability of getting exactly ten heads?",
      "options": ["66/4096", "78/4096", "85/4096", "60/4096"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(12,10)/2^12",
      "explanation": "C(12,10)=66 → 66/4096"
    },
    {
      "question":
          "6. A spinner has numbers 1–50. What is the probability of spinning a number divisible by 5 or 7?",
      "options": ["21/50", "22/50", "23/50", "20/50"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion principle",
      "explanation": "Favorable = 21 → 21/50"
    },
    {
      "question":
          "7. The mean of 20 numbers is 65. If 19 numbers are 63, 66, 64, 67, 65, 68, 62, 66, 65, 67, 64, 69, 61, 66, 65, 67, 64, 70, 63, what is the 20th number?",
      "options": ["65", "66", "64", "67"],
      "correctIndex": 0,
      "hint": "Sum = mean*20, subtract sum of 19 numbers",
      "explanation": "Sum = 1300, sum of 19 = 1235 → 20th = 65"
    },
    {
      "question":
          "8. A number from 1 to 200 is chosen randomly. What is the probability that it is divisible by 8 or 9?",
      "options": ["58/200", "60/200", "62/200", "56/200"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion principle",
      "explanation": "Favorable = 58 → 58/200"
    },
    {
      "question":
          "9. The set of scores is {70, 72, 74, 77, 79, 82, 85, 87, 90, 92, 95, 97}. What is the approximate standard deviation?",
      "options": ["9.8", "9.5", "10.0", "9.2"],
      "correctIndex": 1,
      "hint": "SD ≈ √(Σ(x-mean)^2/n)",
      "explanation": "SD ≈ 9.5"
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that all rolls show even numbers?",
      "options": ["1/16", "1/8", "1/4", "1/32"],
      "correctIndex": 0,
      "hint": "All rolls even → (1/2)^4 = 1/16",
      "explanation": "Probability = 1/16"
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
              'You have finished all Probability & Statistics Hard Practice 10 questions!'),
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
          'Probability & Statistics - Hard 10',
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
