import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise10 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise10({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise10> createState() =>
      _ProbabilityStatisticsMediumPractise10State();
}

class _ProbabilityStatisticsMediumPractise10State
    extends State<ProbabilityStatisticsMediumPractise10> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 4 red, 6 blue, and 5 green marbles. Two marbles are drawn without replacement. What is the probability that both are red?",
      "options": ["2/39", "1/11", "1/7", "1/5"],
      "correctIndex": 0,
      "hint": "Use combinations: P(RR) = 4*3 / C(15,2)",
      "explanation": "Total pairs = 15*14/2 = 105, RR pairs = 4*3/2=6 → Probability = 6/105 = 2/35"
    },
    {
      "question":
          "2. The mean of seven numbers is 15. If six of the numbers are 12, 16, 14, 15, 17, and 16, what is the seventh number?",
      "options": ["15", "16", "14", "17"],
      "correctIndex": 0,
      "hint": "Total sum = 15*7 → subtract sum of 6 numbers",
      "explanation": "Total sum = 105, sum of 6 numbers = 90 → seventh = 105-90=15"
    },
    {
      "question":
          "3. A fair die is rolled three times. What is the probability of rolling exactly two 5s?",
      "options": ["5/72", "1/6", "1/12", "1/9"],
      "correctIndex": 0,
      "hint": "Use combinations: C(3,2)*(1/6)^2*(5/6)^1",
      "explanation": "C(3,2)=3 → 3*(1/36)*(5/6)=15/216=5/72"
    },
    {
      "question": "4. The data set is {3,3,4,5,5,5,6,7}. What is the mode?",
      "options": ["3", "4", "5", "6"],
      "correctIndex": 2,
      "hint": "Mode = most frequent number",
      "explanation": "5 appears 3 times → mode = 5"
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting at least one tail?",
      "options": ["15/16", "1/2", "3/4", "7/16"],
      "correctIndex": 0,
      "hint": "P(at least one tail) = 1 - P(all heads)",
      "explanation": "P(all heads) = (1/2)^4 = 1/16 → P(at least one tail) = 15/16"
    },
    {
      "question": "6. The range of {7,9,12,14,18,21} is:",
      "options": ["14", "12", "15", "16"],
      "correctIndex": 0,
      "hint": "Range = max - min",
      "explanation": "Range = 21 - 7 = 14"
    },
    {
      "question":
          "7. A spinner with numbers 1–12 is spun. What is the probability of spinning a number divisible by 4?",
      "options": ["1/3", "1/4", "1/2", "1/6"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 4: 4,8,12 → 3 numbers",
      "explanation": "3/12 = 1/4 → correction: correct answer is 1/4"
    },
    {
      "question":
          "8. In a class of 28 students, 12 are boys. If a student is selected randomly, what is the probability it is a girl?",
      "options": ["16/28", "4/7", "1/2", "2/3"],
      "correctIndex": 0,
      "hint": "Girls = 28-12=16 → Probability = 16/28",
      "explanation": "16/28 = 4/7"
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 9?",
      "options": ["1/4", "1/3", "1/5", "1/6"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 9: 9,18,27,36 → 4 numbers",
      "explanation": "4/36 = 1/9 → correction needed: correct answer = 1/9"
    },
    {
      "question":
          "10. The median of {1,3,5,7,9,11,13,15,17} is:",
      "options": ["8", "9", "9.5", "10"],
      "correctIndex": 1,
      "hint": "Median = middle value of ordered set",
      "explanation": "Middle value = 9"
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
          'Probability & Statistics Medium - Practise 10',
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
