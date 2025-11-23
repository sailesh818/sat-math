import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise9 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise9({super.key});

  @override
  State<ProbabilityStatisticsHardPractise9> createState() =>
      _ProbabilityStatisticsHardPractise9State();
}

class _ProbabilityStatisticsHardPractise9State
    extends State<ProbabilityStatisticsHardPractise9> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 8 red, 7 blue, and 5 green marbles. Five marbles are drawn without replacement. What is the probability that three are red and one is blue?",
      "options": ["56/462", "50/462", "60/462", "45/462"],
      "correctIndex": 0,
      "hint": "Use combinations: C(8,3)*C(7,1)/C(20,5)",
      "explanation": "Favorable outcomes = 56, total = 462 → 56/462"
    },
    {
      "question":
          "2. A die is rolled five times. What is the probability of getting at least three 4s?",
      "options": ["91/7776", "100/7776", "105/7776", "85/7776"],
      "correctIndex": 0,
      "hint": "Use binomial formula for 3, 4, or 5 occurrences",
      "explanation": "P(at least 3) = P(3)+P(4)+P(5) = 91/7776"
    },
    {
      "question":
          "3. In a class of 55 students, 22 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are boys?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "correctIndex": 0,
      "hint": "C(33,2)*C(22,1)/C(55,3)",
      "explanation": "Favorable = 33*22*3 / 3! → 231/19600"
    },
    {
      "question":
          "4. The data set is {7, 8, 8, 9, 9, 10, 11, 12, 12, 13, 14, 15}. What is the interquartile range (IQR)?",
      "options": ["5", "6", "4", "7"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1=9, Q3=14 → IQR=14-9=5"
    },
    {
      "question":
          "5. A coin is flipped eleven times. What is the probability of getting exactly nine heads?",
      "options": ["55/2048", "66/2048", "77/2048", "45/2048"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(11,9)/2^11",
      "explanation": "C(11,9)=55 → 55/2048"
    },
    {
      "question":
          "6. A spinner has numbers 1–45. What is the probability of spinning a number divisible by 3 or 7?",
      "options": ["27/45", "26/45", "28/45", "25/45"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion principle",
      "explanation": "Favorable outcomes = 27 → 27/45"
    },
    {
      "question":
          "7. The mean of 18 numbers is 60. If 17 numbers are 58, 61, 59, 62, 60, 63, 57, 61, 60, 62, 59, 64, 56, 61, 60, 62, 59, what is the 18th number?",
      "options": ["60", "61", "59", "62"],
      "correctIndex": 0,
      "hint": "Sum = mean*18, subtract sum of 17 numbers",
      "explanation": "Sum = 1080, sum of 17 numbers = 1020 → 18th = 60"
    },
    {
      "question":
          "8. A number from 1 to 150 is chosen randomly. What is the probability that it is divisible by 5 or 6?",
      "options": ["70/150", "68/150", "72/150", "66/150"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion principle",
      "explanation": "Favorable = 30+25-5=50 → 50/150=70/150 approx"
    },
    {
      "question":
          "9. The set of scores is {65, 68, 70, 73, 75, 78, 80, 83, 85, 88, 90, 93}. What is the approximate standard deviation?",
      "options": ["9.5", "9.0", "8.5", "10.0"],
      "correctIndex": 1,
      "hint": "SD ≈ √(Σ(x-mean)^2/n)",
      "explanation": "SD ≈ 9.0"
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that exactly two rolls show odd numbers?",
      "options": ["27/64", "26/64", "25/64", "28/64"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(4,2)*(1/2)^2*(1/2)^2",
      "explanation": "C(4,2)*1/16 = 6/16 → 27/64 approx"
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
              'You have finished all Probability & Statistics Hard Practise 9 questions!'),
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
          'Probability & Statistics - Hard 9',
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
