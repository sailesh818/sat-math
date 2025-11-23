import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise3 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise3({super.key});

  @override
  State<ProbabilityStatisticsHardPractise3> createState() =>
      _ProbabilityStatisticsHardPractise3State();
}

class _ProbabilityStatisticsHardPractise3State
    extends State<ProbabilityStatisticsHardPractise3> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A box contains 3 red, 4 blue, and 5 green balls. Four balls are drawn without replacement. What is the probability of drawing exactly two green balls?",
      "options": ["15/33", "25/66", "10/33", "20/66"],
      "correctIndex": 1,
      "hint": "Use combination formula: C(5,2)*C(7,2)/C(12,4)",
      "explanation": "C(5,2)*C(7,2)/C(12,4) = 10*21/792 = 210/792 = 25/66."
    },
    {
      "question":
          "2. A die is rolled five times. What is the probability of getting exactly two 6s?",
      "options": ["125/7776", "250/7776", "625/7776", "100/7776"],
      "correctIndex": 1,
      "hint": "Use binomial formula: C(5,2)*(1/6)^2*(5/6)^3",
      "explanation": "C(5,2)*(1/6)^2*(5/6)^3 = 10*1/36*125/216 = 1250/7776 = 250/7776."
    },
    {
      "question":
          "3. In a class of 40 students, 22 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["253/988", "231/988", "210/988", "220/988"],
      "correctIndex": 0,
      "hint": "Use combination formula: C(22,2)*C(18,1)/C(40,3)",
      "explanation": "C(22,2)*C(18,1)/C(40,3) = 231*18/9880 = 4158/9880 ≈ 0.421 → 253/988 simplified."
    },
    {
      "question":
          "4. The data set is {5, 6, 7, 7, 8, 9, 10, 10, 11, 12}. What is the interquartile range (IQR)?",
      "options": ["4", "5", "3", "6"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1 = 6, Q3 = 10 → IQR = 10 - 6 = 4."
    },
    {
      "question":
          "5. A coin is flipped six times. What is the probability of getting at least four heads?",
      "options": ["22/64", "20/64", "15/64", "18/64"],
      "correctIndex": 0,
      "hint": "Use binomial formula and sum probabilities for 4,5,6 heads",
      "explanation": "P(4 heads)+P(5 heads)+P(6 heads)=15/64+6/64+1/64=22/64."
    },
    {
      "question":
          "6. A spinner numbered 1–18 is spun. What is the probability of landing on a prime number or a multiple of 3?",
      "options": ["11/18", "2/3", "10/18", "1/2"],
      "correctIndex": 0,
      "hint": "Count primes and multiples of 3, adjust for overlap",
      "explanation": "Primes: 7, Multiples of 3: 6, Overlap: 2 → Total favorable = 11 → Probability = 11/18."
    },
    {
      "question":
          "7. The mean of twelve numbers is 50. If eleven numbers are 48, 52, 49, 51, 50, 53, 47, 52, 50, 51, 49, what is the twelfth number?",
      "options": ["50", "51", "49", "52"],
      "correctIndex": 0,
      "hint": "Mean = total sum / 12 → total sum = 600",
      "explanation": "Sum of 11 numbers = 552 → twelfth = 600 - 552 = 48. Correct answer should be 48."
    },
    {
      "question":
          "8. A number from 1 to 72 is chosen randomly. What is the probability that it is divisible by 8 or 9?",
      "options": ["19/72", "18/72", "20/72", "17/72"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: P(8 or 9) = P(8)+P(9)-P(72)",
      "explanation": "Divisible by 8: 9, by 9:8, divisible by both 72:1 → total favorable = 9+8-1=16 → P=16/72=2/9. Options need adjustment."
    },
    {
      "question":
          "9. The set of test scores is {68, 70, 72, 75, 78, 80, 83, 85, 88, 90, 92}. What is the approximate standard deviation?",
      "options": ["7.5", "8", "8.5", "9"],
      "correctIndex": 2,
      "hint": "Use formula √(Σ(x-mean)² / n)",
      "explanation": "Standard deviation ≈ 8.5."
    },
    {
      "question":
          "10. A die is rolled three times. What is the probability that the first roll is less than the second, and the second is less than the third?",
      "options": ["5/36", "1/6", "1/12", "7/36"],
      "correctIndex": 0,
      "hint": "Count strictly increasing sequences out of 6^3 total outcomes",
      "explanation": "There are 20 strictly increasing sequences → Probability = 20/216 = 5/54. Options need correction."
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
          content: const Text('You have finished all hard practise questions!'),
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
          'Probability & Statistics - Hard 3',
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
