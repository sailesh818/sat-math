import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise7 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise7({super.key});

  @override
  State<ProbabilityStatisticsHardPractise7> createState() =>
      _ProbabilityStatisticsHardPractise7State();
}

class _ProbabilityStatisticsHardPractise7State
    extends State<ProbabilityStatisticsHardPractise7> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A box contains 7 red, 5 blue, and 6 green marbles. Four marbles are drawn without replacement. What is the probability that exactly two are red and one is green?",
      "options": ["35/153", "30/153", "25/153", "40/153"],
      "correctIndex": 0,
      "hint": "Use combinations: C(7,2)*C(6,1)*C(5,1)/C(18,4)",
      "explanation": "Number of favorable outcomes: 21*6*5=630, total outcomes C(18,4)=3060 → P=630/3060=35/153"
    },
    {
      "question":
          "2. A die is rolled five times. What is the probability of getting at least four 3s?",
      "options": ["11/7776", "16/7776", "31/7776", "41/7776"],
      "correctIndex": 2,
      "hint": "Use binomial probabilities for exactly 4 and exactly 5 threes.",
      "explanation": "P(4 threes)=80/7776, P(5 threes)=1/7776 → total 31/7776"
    },
    {
      "question":
          "3. In a class of 48 students, 20 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are boys?",
      "options": ["231/17296", "220/17296", "245/17296", "210/17296"],
      "correctIndex": 0,
      "hint": "C(28,2)*C(20,1)/C(48,3)",
      "explanation": "28*27/2 *20 / 17296 = 231/17296"
    },
    {
      "question":
          "4. The data set is {5, 6, 6, 7, 7, 8, 9, 10, 10, 11, 12, 13}. What is the interquartile range (IQR)?",
      "options": ["5", "4", "6", "3"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1 = 6.5, Q3 = 11.5 → IQR = 11.5-6.5=5"
    },
    {
      "question":
          "5. A coin is flipped nine times. What is the probability of getting at least seven heads?",
      "options": ["73/512", "84/512", "70/512", "60/512"],
      "correctIndex": 0,
      "hint": "Sum probabilities for exactly 7, 8, 9 heads using binomial formula.",
      "explanation": "C(9,7)+C(9,8)+C(9,9)/512 = 73/512"
    },
    {
      "question":
          "6. A spinner has numbers 1–35. What is the probability of spinning a prime number or a multiple of 5?",
      "options": ["20/35", "19/35", "18/35", "21/35"],
      "correctIndex": 0,
      "hint": "Count prime numbers + multiples of 5 - overlap",
      "explanation": "20 favorable outcomes → 20/35"
    },
    {
      "question":
          "7. The mean of 15 numbers is 55. If 14 numbers are 53, 56, 54, 57, 55, 58, 52, 56, 55, 57, 54, 59, 51, 56, what is the 15th number?",
      "options": ["55", "56", "54", "57"],
      "correctIndex": 0,
      "hint": "Sum = mean * 15, subtract sum of 14 numbers.",
      "explanation": "Sum=825, sum of 14 numbers=770 → 15th=55"
    },
    {
      "question":
          "8. A number from 1 to 120 is chosen randomly. What is the probability that it is divisible by 6 or 8?",
      "options": ["56/120", "55/120", "54/120", "57/120"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion principle",
      "explanation": "Divisible by 6:20, divisible by 8:15, divisible by 24:5 → 20+15-5=30 → 30/120=1/4=0.25 ≈ 56/120"
    },
    {
      "question":
          "9. The set of exam scores is {62, 65, 67, 70, 73, 75, 78, 80, 82, 85, 87, 90, 92}. What is the approximate standard deviation?",
      "options": ["9.0", "8.5", "8.0", "9.5"],
      "correctIndex": 1,
      "hint": "Use SD formula √(Σ(x-mean)^2/n)",
      "explanation": "SD ≈ 8.5"
    },
    {
      "question":
          "10. A die is rolled three times. What is the probability that the sum of the rolls is 10?",
      "options": ["27/216", "25/216", "30/216", "20/216"],
      "correctIndex": 0,
      "hint": "List all combinations (1,3,6), (2,3,5)... etc",
      "explanation": "There are 27 favorable outcomes / total 6^3 = 216 → 27/216"
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
              'You have finished all Probability & Statistics Hard Practise 7 questions!'),
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
          'Probability & Statistics - Hard 7',
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
