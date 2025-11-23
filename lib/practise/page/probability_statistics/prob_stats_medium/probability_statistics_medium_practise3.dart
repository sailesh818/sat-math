import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise3 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise3({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise3> createState() =>
      _ProbabilityStatisticsMediumPractise3State();
}

class _ProbabilityStatisticsMediumPractise3State
    extends State<ProbabilityStatisticsMediumPractise3> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A box contains 4 red, 6 blue, and 5 green balls. Two balls are drawn without replacement. What is the probability that one is red and the other is green?",
      "options": ["10/91", "5/33", "2/11", "4/15"],
      "correctIndex": 0,
      "hint":
          "Calculate probability of R then G + probability of G then R.",
      "explanation":
          "P(RG) = 4/15 * 5/14 + 5/15 * 4/14 = 20/210 + 20/210 = 40/210 = 10/91."
    },
    {
      "question":
          "2. The mean of seven numbers is 15. If six numbers are 12, 14, 16, 18, 13, and 17, what is the seventh number?",
      "options": ["15", "16", "17", "14"],
      "correctIndex": 0,
      "hint": "Mean = Sum / 7 → find sum and subtract sum of 6 numbers.",
      "explanation":
          "Total sum = 15*7 = 105. Sum of 6 numbers = 12+14+16+18+13+17=90. Seventh = 105-90=15."
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of getting at least one 6?",
      "options": ["11/36", "1/6", "5/36", "1/2"],
      "correctIndex": 0,
      "hint": "Use complement: 1 - P(no 6).",
      "explanation":
          "P(no 6) = 5/6 * 5/6 = 25/36 → P(at least one 6) = 1 - 25/36 = 11/36."
    },
    {
      "question":
          "4. The data set is {3, 4, 5, 5, 6, 7, 7, 7, 8}. What is the mode?",
      "options": ["5", "6", "7", "8"],
      "correctIndex": 2,
      "hint": "Mode = most frequent number.",
      "explanation": "7 appears 3 times, which is the highest frequency."
    },
    {
      "question":
          "5. A coin is flipped three times. What is the probability of getting no heads?",
      "options": ["1/8", "1/4", "1/2", "1/16"],
      "correctIndex": 0,
      "hint": "No heads = all tails → (1/2)^3",
      "explanation": "P(no heads) = 1/2 * 1/2 * 1/2 = 1/8."
    },
    {
      "question":
          "6. The range of {5, 9, 12, 8, 15, 18} is:",
      "options": ["10", "13", "12", "8"],
      "correctIndex": 1,
      "hint": "Range = max - min",
      "explanation": "Max = 18, Min = 5 → Range = 18-5 = 13."
    },
    {
      "question":
          "7. A spinner with 8 equal sections labeled 1–8 is spun. What is the probability of spinning a number less than 5?",
      "options": ["1/2", "1/4", "3/4", "5/8"],
      "correctIndex": 0,
      "hint": "Numbers less than 5: 1,2,3,4",
      "explanation": "4/8 = 1/2."
    },
    {
      "question":
          "8. In a class of 40 students, 25 are boys. If a student is selected randomly, what is the probability it is a girl?",
      "options": ["15/40", "3/8", "2/5", "1/2"],
      "correctIndex": 0,
      "hint": "Girls = total - boys",
      "explanation": "Girls = 40-25=15 → 15/40."
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 9?",
      "options": ["1/4", "1/3", "1/6", "1/2"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 9: 9,18,27,36",
      "explanation": "4/36 = 1/9. Correct index should be 0 (verify)."
    },
    {
      "question":
          "10. The median of {2, 4, 6, 7, 9, 12, 14, 16} is:",
      "options": ["6", "7", "7.5", "8"],
      "correctIndex": 2,
      "hint": "Median = average of 4th and 5th values",
      "explanation": "Ordered set: 2,4,6,7,9,12,14,16 → median = (7+8)/2 = 7.5."
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
          title: const Text('🎉 Great Job!'),
          content: const Text('You have completed all practise questions!'),
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
          'Probability & Statistics Medium - Practise 3',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// QUESTION CARD
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

            /// OPTIONS
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

            /// HINT BUTTON
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

            /// NEXT BUTTON
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
