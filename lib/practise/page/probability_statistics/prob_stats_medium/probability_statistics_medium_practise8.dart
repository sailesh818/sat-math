import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise8 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise8({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise8> createState() =>
      _ProbabilityStatisticsMediumPractise8State();
}

class _ProbabilityStatisticsMediumPractise8State
    extends State<ProbabilityStatisticsMediumPractise8> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 7 blue, and 8 green marbles. Two marbles are drawn without replacement. What is the probability that one is red and one is blue?",
      "options": ["35/190", "7/40", "5/20", "1/5"],
      "correctIndex": 0,
      "hint": "Use combinations: P(RB) = 5*7 / C(20,2)",
      "explanation": "Total pairs = 20*19/2 = 190, RB pairs = 5*7 = 35 → Probability = 35/190"
    },
    {
      "question":
          "2. The mean of nine numbers is 18. If eight of the numbers are 16, 17, 18, 19, 20, 15, 21, and 18, what is the ninth number?",
      "options": ["18", "19", "20", "17"],
      "correctIndex": 0,
      "hint": "Total sum = 18*9 → subtract sum of 8 numbers",
      "explanation": "Total sum = 162, sum of 8 numbers = 143 → ninth = 162-143=19"
    },
    {
      "question":
          "3. A fair die is rolled three times. What is the probability of rolling exactly one 6?",
      "options": ["5/18", "1/6", "1/2", "1/3"],
      "correctIndex": 0,
      "hint": "Use binomial probability: C(3,1)*(1/6)*(5/6)^2",
      "explanation": "3*(1/6)*(25/36) = 75/216 = 25/72 ≈ 5/18"
    },
    {
      "question":
          "4. The data set is {1, 2, 2, 3, 4, 4, 4, 5}. What is the mode?",
      "options": ["2", "3", "4", "5"],
      "correctIndex": 2,
      "hint": "Mode = most frequent number",
      "explanation": "4 appears 3 times → mode = 4"
    },
    {
      "question":
          "5. A coin is flipped five times. What is the probability of getting exactly four heads?",
      "options": ["5/32", "1/4", "5/16", "1/2"],
      "correctIndex": 0,
      "hint": "Use combinations: C(5,4)*(1/2)^4*(1/2)^1",
      "explanation": "C(5,4)=5 → 5*(1/32) = 5/32"
    },
    {
      "question":
          "6. The range of {4, 7, 9, 10, 12, 15} is:",
      "options": ["11", "10", "12", "9"],
      "correctIndex": 0,
      "hint": "Range = max - min",
      "explanation": "Range = 15 - 4 = 11"
    },
    {
      "question":
          "7. A spinner with numbers 1–12 is spun. What is the probability of spinning a number divisible by 3?",
      "options": ["1/4", "1/3", "1/2", "1/6"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 3: 3,6,9,12 → 4 numbers",
      "explanation": "Probability = 4/12 = 1/3"
    },
    {
      "question":
          "8. In a class of 36 students, 20 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["16/36", "2/5", "1/2", "5/9"],
      "correctIndex": 0,
      "hint": "Boys = 36-20=16 → Probability = 16/36",
      "explanation": "Probability = 16/36 = 4/9"
    },
    {
      "question":
          "9. A number from 1 to 48 is chosen randomly. What is the probability it is divisible by 8?",
      "options": ["1/6", "1/8", "1/4", "1/5"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 8: 8,16,...,48 → 6 numbers",
      "explanation": "Probability = 6/48 = 1/8"
    },
    {
      "question":
          "10. The median of {3, 5, 7, 9, 11, 13, 15, 17} is:",
      "options": ["8", "9", "10", "11"],
      "correctIndex": 2,
      "hint": "Median = average of middle two numbers",
      "explanation": "Middle numbers: 9,11 → median = (9+11)/2 = 10"
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
          content: const Text('You have finished all practise questions.'),
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
          'Probability & Statistics Medium - Practise 8',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
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
                    ? Colors.lightBlue.shade200
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
                  color: Colors.blue.shade100,
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
                  backgroundColor: Colors.blue,
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
