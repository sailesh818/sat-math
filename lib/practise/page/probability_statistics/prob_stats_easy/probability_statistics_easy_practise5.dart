import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise5 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise5({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise5> createState() =>
      _ProbabilityStatisticsEasyPractise5State();
}

class _ProbabilityStatisticsEasyPractise5State
    extends State<ProbabilityStatisticsEasyPractise5> {
  
  int currentIndex = 0;
  int? selectedIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A box contains 7 red pens and 3 blue pens. If one pen is chosen at random, what is the probability of selecting a red pen?",
      "options": ["7/3", "3/10", "7/10", "1/2"],
      "correctIndex": 2,
      "hint": "Probability = favorable outcomes / total outcomes.",
      "explanation": "Red pens = 7, Total pens = 10 → Probability = 7/10."
    },
    {
      "question":
          "2. The mean of five numbers is 12. If four of the numbers are 10, 9, 15, and 14, what is the fifth number?",
      "options": ["12", "13", "14", "16"],
      "correctIndex": 0,
      "hint": "Mean = Sum of numbers / count.",
      "explanation":
          "Total sum = 12×5 = 60. Known sum = 10+9+15+14 = 48. Fifth number = 60 − 48 = 12."
    },
    {
      "question":
          "3. A fair coin is flipped 3 times. What is the probability of getting exactly 2 heads?",
      "options": ["1/8", "3/8", "1/2", "5/8"],
      "correctIndex": 1,
      "hint": "Use combination formula: 3C2 / 8 outcomes.",
      "explanation": "3C2 = 3. Total outcomes = 8. Probability = 3/8."
    },
    {
      "question":
          "4. A spinner has 5 equal sections labeled 1, 2, 3, 4, and 5. What is the probability of spinning an odd number?",
      "options": ["1/5", "2/5", "3/5", "4/5"],
      "correctIndex": 2,
      "hint": "Odd numbers: 1, 3, 5.",
      "explanation": "3 odd numbers out of 5 → Probability = 3/5."
    },
    {
      "question":
          "5. A class of 20 students has 12 girls and 8 boys. If one student is selected randomly, what is the probability of selecting a boy?",
      "options": ["2/5", "3/5", "1/2", "8/12"],
      "correctIndex": 0,
      "hint": "Probability = number of boys / total students.",
      "explanation": "8/20 = 2/5."
    },
    {
      "question":
          "6. The median of the data set {3, 5, 7, 9, 11} is:",
      "options": ["5", "7", "9", "6"],
      "correctIndex": 1,
      "hint": "Median is the middle value when data is ordered.",
      "explanation": "Middle value is 7."
    },
    {
      "question":
          "7. A number is chosen at random from 1 to 9. What is the probability that the number is a prime?",
      "options": ["4/9", "3/9", "5/9", "2/9"],
      "correctIndex": 0,
      "hint": "Prime numbers between 1 and 9: 2, 3, 5, 7.",
      "explanation": "4 primes out of 9 → 4/9."
    },
    {
      "question":
          "8. A bag contains 4 yellow marbles and 6 purple marbles. One marble is drawn at random. What is the probability that it is yellow?",
      "options": ["4/6", "6/10", "4/10", "2/5"],
      "correctIndex": 3,
      "hint": "Total marbles = 10.",
      "explanation": "Yellow = 4 → Probability = 4/10 = 2/5."
    },
    {
      "question":
          "9. The mode of the data set {4, 6, 6, 7, 8, 6, 9} is:",
      "options": ["6", "7", "8", "9"],
      "correctIndex": 0,
      "hint": "Mode = number with highest frequency.",
      "explanation": "6 appears 3 times → mode = 6."
    },
    {
      "question":
          "10. A fair die is rolled. What is the probability of getting a number less than 4?",
      "options": ["1/2", "1/3", "2/3", "3/6"],
      "correctIndex": 0,
      "hint": "Numbers < 4 are: 1, 2, 3.",
      "explanation": "3 outcomes out of 6 → 3/6 = 1/2."
    },
  ];

  void checkAnswer(int index) {
    if (!answerChecked) {
      setState(() {
        selectedIndex = index;
        answerChecked = true;
      });
    }
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedIndex = null;
        answerChecked = false;
        showHint = false;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('🎉 Well Done!'),
          content: const Text('You completed all Probability/Statistics questions!'),
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
    final question = questions[currentIndex];

    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: const Text(
          "Probability & Statistics - Practise 5",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// QUESTION
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  question["question"],
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
            ...List.generate(question["options"].length, (index) {
              final option = question["options"][index];
              final isCorrect = answerChecked && index == question["correctIndex"];
              final isWrong = answerChecked && selectedIndex == index && !isCorrect;

              return Card(
                color: isCorrect
                    ? Colors.lightGreen.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  onTap: () => checkAnswer(index),
                  leading: CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    option,
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
              );
            }),

            const SizedBox(height: 20),

            /// HINT BUTTON
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
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
                  question["hint"],
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            /// EXPLANATION
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Explanation: ${question["explanation"]}",
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
                  backgroundColor: Colors.lightBlue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  currentIndex == questions.length - 1
                      ? "Finish"
                      : "Next Question",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
