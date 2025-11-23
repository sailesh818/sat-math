import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise13 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise13({super.key});

  @override
  State<ProbabilityStatisticsHardPractise13> createState() =>
      _ProbabilityStatisticsHardPractise13State();
}

class _ProbabilityStatisticsHardPractise13State
    extends State<ProbabilityStatisticsHardPractise13> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 7 red, 6 blue, and 5 green marbles. Four marbles are drawn without replacement. What is the probability that two are red and one is blue?",
      "options": ["42/210", "45/210", "40/210", "48/210"],
      "correctIndex": 0,
      "hint": "Use combinations: C(7,2)*C(6,1)*C(5,1)/C(18,4)",
      "explanation": "Favorable = 42, total = 210 → 42/210"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting exactly four 3s?",
      "options": ["75/7776", "80/7776", "70/7776", "85/7776"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(6,4)*(1/6)^4*(5/6)^2",
      "explanation": "P = 75/7776"
    },
    {
      "question":
          "3. In a class of 54 students, 20 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are boys?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "correctIndex": 0,
      "hint": "Use combinations: C(34,2)*C(20,1)/C(54,3)",
      "explanation": "Favorable = 231, total = 19600 → 231/19600"
    },
    {
      "question":
          "4. The data set is {8, 9, 10, 10, 11, 12, 13, 13, 14, 15, 16, 17}. What is the interquartile range (IQR)?",
      "options": ["5", "6", "4", "7"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1=10.5, Q3=15.5 → IQR=15.5-10.5=5"
    },
    {
      "question":
          "5. A coin is flipped twelve times. What is the probability of getting exactly nine heads?",
      "options": ["220/4096", "210/4096", "230/4096", "200/4096"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(12,9)/2^12",
      "explanation": "C(12,9)=220 → 220/4096"
    },
    {
      "question":
          "6. A spinner has numbers 1–42. What is the probability of spinning a number divisible by 3 or 5?",
      "options": ["23/42", "22/42", "24/42", "21/42"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 3 + divisible by 5 - divisible by 15",
      "explanation": "Favorable = 23 → 23/42"
    },
    {
      "question":
          "7. The mean of 15 numbers is 61. If 14 numbers are 60, 62, 61, 63, 61, 64, 59, 62, 61, 63, 60, 65, 58, 62, what is the 15th number?",
      "options": ["61", "62", "60", "63"],
      "correctIndex": 0,
      "hint": "Sum = mean*15, subtract sum of 14 numbers",
      "explanation": "Sum=61*15=915, sum of 14=854 → 15th=61"
    },
    {
      "question":
          "8. A number from 1 to 180 is chosen randomly. What is the probability that it is divisible by 6 or 8?",
      "options": ["65/180", "66/180", "64/180", "68/180"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 6 + divisible by 8 - divisible by 24",
      "explanation": "Favorable = 65 → 65/180"
    },
    {
      "question":
          "9. The set of scores is {68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90}. What is the approximate standard deviation?",
      "options": ["7.5", "8.0", "8.5", "7.0"],
      "correctIndex": 0,
      "hint": "SD ≈ √(Σ(x-mean)^2/n)",
      "explanation": "SD ≈ 7.5"
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that exactly two rolls show prime numbers?",
      "options": ["9/16", "8/16", "10/16", "7/16"],
      "correctIndex": 0,
      "hint": "Primes on a die: 2,3,5 → P=3/6=1/2, use binomial formula",
      "explanation": "P = C(4,2)*(1/2)^2*(1/2)^2 = 6/16 = 9/16"
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
              'You have finished all Probability & Statistics Hard Practice 13 questions!'),
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
          'Probability & Statistics - Hard 13',
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
