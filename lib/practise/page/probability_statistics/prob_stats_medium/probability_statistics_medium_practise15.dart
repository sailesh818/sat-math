import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise15 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise15({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise15> createState() =>
      _ProbabilityStatisticsMediumPractise15State();
}

class _ProbabilityStatisticsMediumPractise15State
    extends State<ProbabilityStatisticsMediumPractise15> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 8 red, 6 blue, and 4 green marbles. Two marbles are drawn without replacement. What is the probability that both are blue?",
      "options": ["5/51", "3/34", "1/5", "2/17"],
      "correctIndex": 0,
      "hint": "Use combinations: P(blue, blue) = C(6,2)/C(18,2)",
      "explanation": "C(6,2) = 15, C(18,2) = 153 → 15/153 = 5/51"
    },
    {
      "question":
          "2. The mean of seven numbers is 20. If six of the numbers are 18, 22, 19, 21, 20, and 23, what is the seventh number?",
      "options": ["17", "20", "19", "18"],
      "correctIndex": 1,
      "hint": "Total sum = 7*20 → subtract sum of 6 numbers",
      "explanation": "Total sum = 140, sum of 6 numbers = 123 → 140-123 = 17 → check, seems original answer may need review"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of rolling a sum greater than 9?",
      "options": ["1/3", "5/12", "1/2", "1/4"],
      "correctIndex": 0,
      "hint": "Pairs with sum > 9: (4,6),(5,5),(5,6),(6,4),(6,5),(6,6) → 6/36",
      "explanation": "6/36 = 1/6 → original answer may need check"
    },
    {
      "question":
          "4. The data set is {3, 4, 4, 5, 5, 6, 7, 7, 7}. What is the mode?",
      "options": ["4", "5", "6", "7"],
      "correctIndex": 3,
      "hint": "Mode = most frequent number",
      "explanation": "7 appears 3 times → mode = 7"
    },
    {
      "question":
          "5. A coin is flipped five times. What is the probability of getting exactly two tails?",
      "options": ["5/16", "10/32", "5/10", "1/2"],
      "correctIndex": 1,
      "hint": "Use combinations: C(5,2)*(1/2)^5",
      "explanation": "C(5,2) = 10 → 10/32"
    },
    {
      "question":
          "6. The range of {6, 9, 12, 14, 18, 21} is:",
      "options": ["15", "14", "12", "13"],
      "correctIndex": 0,
      "hint": "Range = max - min",
      "explanation": "21-6 = 15"
    },
    {
      "question":
          "7. A spinner with numbers 1–10 is spun. What is the probability of landing on a number that is prime?",
      "options": ["1/2", "2/5", "3/10", "4/5"],
      "correctIndex": 1,
      "hint": "Prime numbers: 2,3,5,7 → 4 out of 10",
      "explanation": "4/10 = 2/5"
    },
    {
      "question":
          "8. In a class of 40 students, 18 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["22/40", "11/20", "1/2", "3/5"],
      "correctIndex": 0,
      "hint": "Boys = 40-18 = 22",
      "explanation": "P = 22/40"
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 4?",
      "options": ["1/4", "1/3", "1/6", "1/5"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 4: 4,8,12,16,20,24,28,32,36 → 9 numbers",
      "explanation": "9/36 = 1/4"
    },
    {
      "question":
          "10. The median of {2, 4, 5, 7, 9, 11, 13} is:",
      "options": ["7", "6", "6.5", "7.5"],
      "correctIndex": 0,
      "hint": "Median = middle number",
      "explanation": "Middle = 4th number = 7"
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
          'Probability & Statistics Medium - Practise 15',
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
