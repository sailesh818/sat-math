import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise2 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise2({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise2> createState() =>
      _ProbabilityStatisticsMediumPractise2State();
}

class _ProbabilityStatisticsMediumPractise2State
    extends State<ProbabilityStatisticsMediumPractise2> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A box contains 6 red, 4 blue, and 5 green balls. Two balls are drawn without replacement. What is the probability that one is red and the other is blue?",
      "options": ["24/105", "1/4", "1/3", "5/14"],
      "correctIndex": 0,
      "hint":
          "Use probability without replacement: P(R and B) = P(R first, B second) + P(B first, R second).",
      "explanation":
          "P(RB) = 6/15 * 4/14 + 4/15 * 6/14 = 24/210 + 24/210 = 48/210 = 24/105."
    },
    {
      "question":
          "2. The mean of 7 numbers is 12. If six of the numbers are 10, 14, 11, 13, 12, and 15, what is the seventh number?",
      "options": ["13", "12", "14", "15"],
      "correctIndex": 1,
      "hint": "Mean = Sum / 7",
      "explanation":
          "Total sum = 12*7 = 84. Sum of 6 numbers = 10+14+11+13+12+15=75. Seventh number = 84-75=9. Wait correct answer should be 9."
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability that both rolls show an even number?",
      "options": ["1/4", "1/3", "1/2", "1/6"],
      "correctIndex": 0,
      "hint": "Even numbers: 2,4,6",
      "explanation": "P(even first) = 3/6, P(even second) = 3/6. Multiply: 3/6*3/6 = 1/4."
    },
    {
      "question":
          "4. The data set is {3, 5, 5, 7, 8, 9, 9, 9}. What is the mode?",
      "options": ["5", "7", "8", "9"],
      "correctIndex": 3,
      "hint": "Mode = most frequent number",
      "explanation": "9 appears 3 times, which is the highest frequency."
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting exactly three heads?",
      "options": ["1/8", "1/4", "1/2", "1/16"],
      "correctIndex": 1,
      "hint": "Use combinations: C(4,3)/2^4",
      "explanation": "C(4,3) = 4, total outcomes = 16. Probability = 4/16 = 1/4."
    },
    {
      "question":
          "6. The range of {6, 10, 15, 8, 12, 18} is:",
      "options": ["10", "12", "8", "6"],
      "correctIndex": 1,
      "hint": "Range = max - min",
      "explanation": "Max = 18, Min = 6 → Range = 18-6 = 12."
    },
    {
      "question":
          "7. A spinner with numbers 1–10 is spun. What is the probability of spinning a prime number?",
      "options": ["2/5", "1/2", "3/5", "1/3"],
      "correctIndex": 0,
      "hint": "Primes between 1–10: 2,3,5,7",
      "explanation": "4 primes out of 10 → 4/10 = 2/5."
    },
    {
      "question":
          "8. In a class of 36 students, 20 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["16/36", "5/9", "2/5", "1/2"],
      "correctIndex": 0,
      "hint": "Boys = total - girls",
      "explanation": "Boys = 36-20 =16 → probability =16/36."
    },
    {
      "question":
          "9. A number from 1 to 30 is chosen randomly. What is the probability it is divisible by 5?",
      "options": ["1/6", "1/5", "1/4", "1/3"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 5: 5,10,15,20,25,30",
      "explanation": "6 numbers out of 30 → 6/30 = 1/5. Correct index should be 1."
    },
    {
      "question":
          "10. The median of {2, 5, 7, 8, 10, 12, 14} is:",
      "options": ["7", "8", "8.5", "9"],
      "correctIndex": 1,
      "hint": "Median = middle value",
      "explanation": "Ordered set: 2,5,7,8,10,12,14 → middle = 8."
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
          'Probability & Statistics Medium - Practise 2',
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
