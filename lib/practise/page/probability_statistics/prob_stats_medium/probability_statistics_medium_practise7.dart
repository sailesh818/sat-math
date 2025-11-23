import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise7 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise7({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise7> createState() =>
      _ProbabilityStatisticsMediumPractise7State();
}

class _ProbabilityStatisticsMediumPractise7State
    extends State<ProbabilityStatisticsMediumPractise7> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 red, 5 blue, and 4 green marbles. Two marbles are drawn without replacement. What is the probability that both are blue?",
      "options": ["5/91", "1/3", "5/55", "1/6"],
      "correctIndex": 0,
      "hint": "Use combinations: P(BB) = 5/15 * 4/14",
      "explanation": "Probability = 5/15 * 4/14 = 20/210 = 5/91"
    },
    {
      "question":
          "2. The mean of seven numbers is 16. If six numbers are 14, 15, 17, 16, 18, and 16, what is the seventh number?",
      "options": ["16", "17", "18", "15"],
      "correctIndex": 0,
      "hint": "Total sum = 16*7 → subtract sum of 6 numbers",
      "explanation": "Total sum = 112, sum of 6 numbers = 96 → seventh = 16"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of getting a 2 and a 5 in any order?",
      "options": ["1/18", "1/12", "1/9", "1/6"],
      "correctIndex": 0,
      "hint": "Two sequences: (2,5) and (5,2)",
      "explanation": "P = 1/6*1/6 + 1/6*1/6 = 2/36 = 1/18"
    },
    {
      "question":
          "4. The data set is {2, 4, 4, 5, 6, 6, 6, 7}. What is the mode?",
      "options": ["4", "5", "6", "7"],
      "correctIndex": 2,
      "hint": "Mode = most frequent number",
      "explanation": "6 appears 3 times → mode = 6"
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting at least one tail?",
      "options": ["15/16", "3/4", "1/2", "7/16"],
      "correctIndex": 0,
      "hint": "Use complement: P(at least 1 tail) = 1 - P(no tails)",
      "explanation": "P(no tails) = 1/16 → P(at least 1 tail) = 15/16"
    },
    {
      "question":
          "6. The range of {5, 8, 10, 12, 15} is:",
      "options": ["10", "12", "15", "8"],
      "correctIndex": 0,
      "hint": "Range = max - min",
      "explanation": "Range = 15 - 5 = 10"
    },
    {
      "question":
          "7. A spinner with numbers 1–8 is spun. What is the probability of spinning a number greater than 5?",
      "options": ["3/8", "1/2", "1/4", "5/8"],
      "correctIndex": 0,
      "hint": "Numbers >5: 6,7,8 → 3 out of 8",
      "explanation": "Probability = 3/8"
    },
    {
      "question":
          "8. In a class of 30 students, 12 are boys. If a student is selected randomly, what is the probability it is a girl?",
      "options": ["18/30", "3/5", "2/5", "1/2"],
      "correctIndex": 0,
      "hint": "Girls = 30 - 12 = 18 → probability = 18/30",
      "explanation": "Probability = 18/30 = 3/5"
    },
    {
      "question":
          "9. A number from 1 to 24 is chosen randomly. What is the probability it is divisible by 3?",
      "options": ["1/3", "1/4", "1/6", "1/2"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 3: 3,6,9,...24 → 8 numbers",
      "explanation": "Probability = 8/24 = 1/3"
    },
    {
      "question":
          "10. The median of {1, 3, 5, 7, 9, 11, 13, 15} is:",
      "options": ["7", "7.5", "8", "8.5"],
      "correctIndex": 2,
      "hint": "Median = average of middle two numbers",
      "explanation": "Middle numbers: 7,9 → median = (7+9)/2 = 8"
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
          'Probability & Statistics Medium - Practise 7',
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
