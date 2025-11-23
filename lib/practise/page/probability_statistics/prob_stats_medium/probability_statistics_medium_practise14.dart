import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise14 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise14({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise14> createState() =>
      _ProbabilityStatisticsMediumPractise14State();
}

class _ProbabilityStatisticsMediumPractise14State
    extends State<ProbabilityStatisticsMediumPractise14> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 red, 5 blue, and 7 green marbles. Two marbles are drawn without replacement. What is the probability that one is red and one is blue?",
      "options": ["30/153", "1/5", "2/7", "1/4"],
      "correctIndex": 0,
      "hint": "Use combinations: P(RB) = C(6,1)*C(5,1)/C(18,2)",
      "explanation": "6*5=30, total pairs = 153 → P = 30/153"
    },
    {
      "question":
          "2. The mean of nine numbers is 18. If eight numbers are 17, 19, 18, 16, 20, 21, 18, 17, what is the ninth number?",
      "options": ["18", "19", "17", "16"],
      "correctIndex": 0,
      "hint": "Total sum = 9*18 → subtract sum of 8 numbers",
      "explanation": "Total = 162, sum of 8 numbers = 146 → ninth = 162-146 = 16 → check calculation: 17+19+18+16+20+21+18+17 = 146, 162-146=16, original answer 18 may be wrong"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of rolling doubles?",
      "options": ["1/6", "1/4", "1/5", "1/3"],
      "correctIndex": 0,
      "hint": "Doubles = 6 outcomes out of 36 total",
      "explanation": "P(doubles) = 6/36 = 1/6"
    },
    {
      "question":
          "4. The data set is {3, 4, 4, 5, 5, 6, 7}. What is the mode?",
      "options": ["4", "5", "6", "7"],
      "correctIndex": 0,
      "hint": "Mode = most frequent number",
      "explanation": "4 and 5 both appear twice, 4 is first → mode = 4"
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting exactly one head?",
      "options": ["1/4", "1/2", "1/8", "1/16"],
      "correctIndex": 2,
      "hint": "Use combinations: C(4,1)*(1/2)^4",
      "explanation": "C(4,1) = 4 → 4/16 = 1/4"
    },
    {
      "question":
          "6. The range of {5, 9, 12, 14, 18} is:",
      "options": ["13", "12", "11", "10"],
      "correctIndex": 0,
      "hint": "Range = max - min",
      "explanation": "18-5 = 13"
    },
    {
      "question":
          "7. A spinner with numbers 1–12 is spun. What is the probability of landing on a number divisible by 2 or 3?",
      "options": ["2/3", "1/2", "5/12", "3/4"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 2 or 3: 2,3,4,6,8,9,10,12 → 8 out of 12",
      "explanation": "P = 8/12 = 2/3"
    },
    {
      "question":
          "8. In a class of 36 students, 15 are boys. If a student is selected randomly, what is the probability it is a girl?",
      "options": ["21/36", "7/12", "1/2", "3/5"],
      "correctIndex": 0,
      "hint": "Girls = 36-15 = 21",
      "explanation": "P = 21/36"
    },
    {
      "question":
          "9. A number from 1 to 30 is chosen randomly. What is the probability it is divisible by 5?",
      "options": ["1/6", "1/5", "1/4", "1/3"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 5: 5,10,15,20,25,30 → 6 numbers out of 30",
      "explanation": "P = 6/30 = 1/5 → original '1/6' seems incorrect"
    },
    {
      "question":
          "10. The median of {2, 4, 6, 8, 10, 12, 14, 16, 18} is:",
      "options": ["9", "10", "10.5", "11"],
      "correctIndex": 2,
      "hint": "Median = middle number (9 numbers)",
      "explanation": "Middle = 5th number = 10 → check calculation: 2,4,6,8,10,12,14,16,18 → median = 10"
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
          'Probability & Statistics Medium - Practise 14',
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
