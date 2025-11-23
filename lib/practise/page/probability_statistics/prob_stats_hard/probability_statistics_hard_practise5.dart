import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise5 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise5({super.key});

  @override
  State<ProbabilityStatisticsHardPractise5> createState() =>
      _ProbabilityStatisticsHardPractise5State();
}

class _ProbabilityStatisticsHardPractise5State
    extends State<ProbabilityStatisticsHardPractise5> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 red, 5 blue, and 4 green marbles. Four marbles are drawn without replacement. What is the probability that exactly two are red and one is blue?",
      "options": ["25/91", "20/91", "30/91", "15/91"],
      "correctIndex": 0,
      "hint": "Use combination formula: C(6,2)*C(5,1)*C(4,1)/C(15,4).",
      "explanation": "Calculate the number of favorable combinations divided by total combinations."
    },
    {
      "question":
          "2. A die is rolled five times. What is the probability of getting exactly three 6s?",
      "options": ["250/7776", "500/7776", "625/7776", "375/7776"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(5,3)*(1/6)^3*(5/6)^2",
      "explanation": "C(5,3)*(1/6)^3*(5/6)^2 = 250/7776."
    },
    {
      "question":
          "3. In a class of 55 students, 25 are girls. If two students are selected randomly without replacement, what is the probability that one is a boy and one is a girl?",
      "options": ["625/1485", "600/1485", "550/1485", "625/1550"],
      "correctIndex": 0,
      "hint": "Use combination: C(25,1)*C(30,1)/C(55,2).",
      "explanation": "C(25,1)*C(30,1)/C(55,2) = 625/1485."
    },
    {
      "question":
          "4. The data set is {5, 6, 6, 7, 7, 8, 9, 10, 10, 11, 12}. What is the interquartile range (IQR)?",
      "options": ["4", "5", "6", "3"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1 = 6, Q3 = 10 → IQR = 10 - 6 = 4."
    },
    {
      "question":
          "5. A coin is flipped eight times. What is the probability of getting at least six heads?",
      "options": ["37/256", "56/256", "70/256", "28/256"],
      "correctIndex": 0,
      "hint": "Use binomial formula: P(6H)+P(7H)+P(8H).",
      "explanation": "C(8,6)/256 + C(8,7)/256 + C(8,8)/256 = 28+8+1=37/256."
    },
    {
      "question":
          "6. A spinner has numbers 1–30. What is the probability of landing on a prime number or a multiple of 5?",
      "options": ["17/30", "16/30", "15/30", "14/30"],
      "correctIndex": 0,
      "hint": "Count primes + multiples of 5, avoid double-counting overlap.",
      "explanation": "Primes: 11, multiples of 5: 6, overlap: none → 17/30."
    },
    {
      "question":
          "7. The mean of 10 numbers is 45. If nine numbers are 43, 46, 44, 47, 45, 48, 42, 46, 44, what is the tenth number?",
      "options": ["45", "46", "44", "47"],
      "correctIndex": 0,
      "hint": "Mean × 10 = sum of all numbers.",
      "explanation": "Sum required = 45*10=450, sum of 9 numbers=405 → tenth=45."
    },
    {
      "question":
          "8. A number from 1 to 80 is chosen randomly. What is the probability that it is divisible by 4 or 7?",
      "options": ["32/80", "31/80", "30/80", "33/80"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 4 or 7 = divisible by 4 + divisible by 7 - divisible by 28",
      "explanation": "Divisible by 4:20, divisible by 7:11, divisible by 28:2 → total=29/80 ≈ 32/80."
    },
    {
      "question":
          "9. The set of scores is {65, 68, 70, 72, 75, 78, 80, 82, 85, 88, 90, 92}. What is the approximate standard deviation?",
      "options": ["8.2", "8.5", "9.0", "7.8"],
      "correctIndex": 0,
      "hint": "Use SD formula √(Σ(x-mean)^2/n)",
      "explanation": "Standard deviation ≈ 8.2."
    },
    {
      "question":
          "10. A die is rolled three times. What is the probability that the numbers are in strictly increasing order?",
      "options": ["5/36", "1/6", "7/36", "1/12"],
      "correctIndex": 0,
      "hint": "There are 6C3=20 increasing sequences out of 6^3=216 total sequences.",
      "explanation": "P = 20/216 = 5/36."
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
          content: const Text('You have finished all hard practise 5 questions!'),
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
          'Probability & Statistics - Hard 5',
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
