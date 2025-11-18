import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise15 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise15({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise15> createState() =>
      _ProbabilityStatisticsEasyPractise15State();
}

class _ProbabilityStatisticsEasyPractise15State
    extends State<ProbabilityStatisticsEasyPractise15> {
  int currentIndex = 0;
  int? selectedIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 red, 2 blue, and 2 green balls. What is the probability of picking a blue ball?",
      "options": ["1/5", "2/10", "1/2", "1/3"],
      "correctIndex": 0,
      "hint": "Probability = favorable / total.",
      "explanation": "Total balls = 10 → 2 blue balls → 2/10 = 1/5."
    },
    {
      "question":
          "2. The mean of 4, 8, 10, and x is 9. What is the value of x?",
      "options": ["10", "12", "14", "16"],
      "correctIndex": 1,
      "hint": "Mean × number of values = total sum.",
      "explanation": "9 × 4 = 36 → sum of 4 + 8 + 10 = 22 → x = 36 − 22 = 12."
    },
    {
      "question":
          "3. A fair die is rolled. What is the probability of rolling an even number?",
      "options": ["1/2", "1/3", "1/4", "2/3"],
      "correctIndex": 0,
      "hint": "Even numbers: 2, 4, 6.",
      "explanation": "3 favorable out of 6 → 3/6 = 1/2."
    },
    {
      "question":
          "4. What is the mode of the data set {2, 3, 3, 5, 7, 7, 7, 8}?",
      "options": ["3", "5", "7", "8"],
      "correctIndex": 2,
      "hint": "Mode = most frequent number.",
      "explanation": "7 appears three times → mode = 7."
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting exactly one head?",
      "options": ["1/4", "1/2", "1/8", "1/16"],
      "correctIndex": 0,
      "hint": "Count favorable outcomes.",
      "explanation": "H T T T, T H T T, T T H T, T T T H → 4 favorable outcomes."
    },
    {
      "question":
          "6. The range of the numbers {5, 12, 8, 7, 15} is:",
      "options": ["8", "9", "10", "12"],
      "correctIndex": 2,
      "hint": "Range = max − min.",
      "explanation": "15 − 5 = 10."
    },
    {
      "question":
          "7. A spinner with numbers 1–8 is spun. What is the probability of landing on a number less than 6?",
      "options": ["5/8", "3/8", "1/2", "1/4"],
      "correctIndex": 0,
      "hint": "Numbers less than 6: 1, 2, 3, 4, 5.",
      "explanation": "5 favorable out of 8 → 5/8."
    },
    {
      "question":
          "8. In a class of 28 students, 16 are girls. What fraction of the class are boys?",
      "options": ["12/28", "3/7", "2/7", "5/7"],
      "correctIndex": 1,
      "hint": "Boys = total − girls.",
      "explanation": "28 − 16 = 12 → 12/28 = 3/7."
    },
    {
      "question":
          "9. A number is chosen randomly from 1 to 24. What is the probability it is a multiple of 4?",
      "options": ["1/6", "1/4", "1/5", "1/3"],
      "correctIndex": 0,
      "hint": "Multiples of 4: 4, 8, 12, 16, 20, 24.",
      "explanation": "6 favorable out of 24 → 6/24 = 1/6."
    },
    {
      "question":
          "10. The median of {1, 3, 5, 7, 9, 11, 13, 15} is:",
      "options": ["7", "8", "8.5", "9"],
      "correctIndex": 2,
      "hint": "Median = average of two middle numbers (even count).",
      "explanation": "(7 + 9)/2 = 8."
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
          title: const Text("🎉 Completed!"),
          content: const Text("You finished all Practise 15 questions."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentIndex];

    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: const Text(
          "Probability & Statistics - Practise 15",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// QUESTION CARD
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  q["question"],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 18),

            /// OPTIONS LIST
            ...List.generate(q["options"].length, (i) {
              bool isCorrect = answerChecked && i == q["correctIndex"];
              bool isWrong = answerChecked && i == selectedIndex && !isCorrect;

              return Card(
                elevation: 2,
                color: isCorrect
                    ? Colors.green.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    child: Text(
                      "${i + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    q["options"][i],
                    style: const TextStyle(fontSize: 16),
                  ),
                  onTap: () => checkAnswer(i),
                ),
              );
            }),

            const SizedBox(height: 12),

            /// HINT BUTTON
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    showHint = !showHint;
                  });
                },
                icon: const Icon(Icons.tips_and_updates, color: Colors.white),
                label: const Text("Hint", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            /// HINT BOX
            if (showHint)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  q["hint"],
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 18),

            /// EXPLANATION BOX
            if (answerChecked)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Explanation: ${q["explanation"]}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 18),

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
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
