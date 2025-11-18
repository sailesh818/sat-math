import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise16 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise16({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise16> createState() =>
      _ProbabilityStatisticsEasyPractise16State();
}

class _ProbabilityStatisticsEasyPractise16State
    extends State<ProbabilityStatisticsEasyPractise16> {
  int currentIndex = 0;
  int? selectedIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 4 red, 5 blue, and 1 yellow marble. What is the probability of picking a red marble?",
      "options": ["1/2", "2/5", "1/5", "4/10"],
      "correctIndex": 1,
      "hint": "Total marbles = 10. Probability = favorable/total.",
      "explanation": "4 red marbles → 4/10 = 2/5."
    },
    {
      "question":
          "2. The mean of 7, 9, 12, and x is 11. What is the value of x?",
      "options": ["14", "15", "16", "17"],
      "correctIndex": 2,
      "hint": "Mean × number of values = total sum.",
      "explanation": "11 × 4 = 44 → 7 + 9 + 12 = 28 → x = 44 − 28 = 16."
    },
    {
      "question":
          "3. A fair die is rolled. What is the probability of rolling a 1, 3, or 5?",
      "options": ["1/2", "1/3", "1/6", "2/3"],
      "correctIndex": 0,
      "hint": "Favorable outcomes: 1, 3, 5.",
      "explanation": "3 favorable outcomes out of 6 → 3/6 = 1/2."
    },
    {
      "question":
          "4. What is the mode of the data set {4, 6, 6, 8, 9, 9, 9}?",
      "options": ["6", "8", "9", "4"],
      "correctIndex": 2,
      "hint": "Mode = most frequent number.",
      "explanation": "9 appears most frequently → mode = 9."
    },
    {
      "question":
          "5. A coin is flipped three times. What is the probability of getting at least one tail?",
      "options": ["1/2", "7/8", "3/8", "1/4"],
      "correctIndex": 1,
      "hint": "At least one tail means 1 − probability of no tails.",
      "explanation": "Probability of no tails = 1/8. Probability of at least one tail = 1 − 1/8 = 7/8."
    },
    {
      "question":
          "6. The range of {3, 5, 9, 12, 8} is:",
      "options": ["8", "9", "10", "12"],
      "correctIndex": 2,
      "hint": "Range = max − min.",
      "explanation": "12 − 3 = 9."
    },
    {
      "question":
          "7. A spinner has 4 equal sections labeled A, B, C, D. What is the probability of spinning C or D?",
      "options": ["1/4", "1/2", "1/3", "3/4"],
      "correctIndex": 1,
      "hint": "Two favorable sections: C, D.",
      "explanation": "2 favorable out of 4 → 2/4 = 1/2."
    },
    {
      "question":
          "8. In a class of 30 students, 18 are boys. What fraction of the class are girls?",
      "options": ["3/5", "2/5", "1/2", "1/3"],
      "correctIndex": 1,
      "hint": "Girls = total students − boys.",
      "explanation": "30 − 18 = 12 → 12/30 = 2/5."
    },
    {
      "question":
          "9. A number from 1 to 12 is chosen at random. What is the probability it is divisible by 4?",
      "options": ["1/3", "1/4", "1/2", "1/6"],
      "correctIndex": 0,
      "hint": "Multiples of 4: 4, 8, 12.",
      "explanation": "3 favorable out of 12 → 3/12 = 1/4."
    },
    {
      "question":
          "10. The median of {2, 4, 6, 8, 10, 12, 14} is:",
      "options": ["7", "8", "8.5", "9"],
      "correctIndex": 2,
      "hint": "Median of odd number of data is the middle value.",
      "explanation": "Middle value = 8."
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
          content: const Text("You finished all Practise 16 questions."),
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
          "Probability & Statistics - Practise 16",
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
                  color: Colors.green.shade100,
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
