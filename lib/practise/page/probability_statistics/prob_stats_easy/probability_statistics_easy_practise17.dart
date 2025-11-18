import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise17 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise17({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise17> createState() =>
      _ProbabilityStatisticsEasyPractise17State();
}

class _ProbabilityStatisticsEasyPractise17State
    extends State<ProbabilityStatisticsEasyPractise17> {
  int currentIndex = 0;
  int? selectedIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A jar contains 7 red, 3 blue, and 5 green marbles. What is the probability of picking a green marble?",
      "options": ["5/15", "1/3", "1/2", "5/10"],
      "correctIndex": 1,
      "hint": "Total marbles = 15. Probability = favorable/total.",
      "explanation": "5 green marbles → 5/15 = 1/3."
    },
    {
      "question":
          "2. The mean of the numbers 5, 9, 11, and x is 10. What is x?",
      "options": ["12", "14", "10", "11"],
      "correctIndex": 3,
      "hint": "Mean × number of values = total sum.",
      "explanation": "10 × 4 = 40 → 5 + 9 + 11 = 25 → x = 40 − 25 = 15."
    },
    {
      "question":
          "3. A fair die is rolled. What is the probability of rolling a number greater than 3?",
      "options": ["1/2", "1/3", "1/6", "1/4"],
      "correctIndex": 0,
      "hint": "Favorable outcomes: 4, 5, 6.",
      "explanation": "3 favorable outcomes out of 6 → 3/6 = 1/2."
    },
    {
      "question":
          "4. The mode of the data set {2, 4, 4, 5, 6, 6, 6, 7} is:",
      "options": ["4", "5", "6", "7"],
      "correctIndex": 2,
      "hint": "Mode = most frequent number.",
      "explanation": "6 appears most frequently → mode = 6."
    },
    {
      "question":
          "5. A coin is flipped twice. What is the probability of getting at least one head?",
      "options": ["1/2", "3/4", "1/4", "1/3"],
      "correctIndex": 1,
      "hint": "At least one head means 1 − probability of no heads.",
      "explanation": "Probability of no heads = 1/4. Probability of at least one head = 1 − 1/4 = 3/4."
    },
    {
      "question":
          "6. The range of {3, 8, 10, 5, 12} is:",
      "options": ["7", "8", "9", "10"],
      "correctIndex": 2,
      "hint": "Range = max − min.",
      "explanation": "12 − 3 = 9."
    },
    {
      "question":
          "7. A spinner has 6 equal sections labeled 1–6. What is the probability of spinning a number less than 5?",
      "options": ["1/2", "2/3", "1/3", "5/6"],
      "correctIndex": 1,
      "hint": "Favorable outcomes: 1, 2, 3, 4.",
      "explanation": "4 favorable outcomes out of 6 → 4/6 = 2/3."
    },
    {
      "question":
          "8. In a class of 25 students, 15 are boys. What fraction of the class are girls?",
      "options": ["5/25", "10/25", "2/5", "3/5"],
      "correctIndex": 2,
      "hint": "Girls = total students − boys.",
      "explanation": "25 − 15 = 10 → 10/25 = 2/5."
    },
    {
      "question":
          "9. A number from 1 to 18 is chosen randomly. What is the probability it is a multiple of 6?",
      "options": ["1/3", "1/2", "1/6", "1/4"],
      "correctIndex": 0,
      "hint": "Multiples of 6: 6, 12.",
      "explanation": "2 favorable outcomes out of 18 → 2/18 = 1/9."
    },
    {
      "question":
          "10. The median of {1, 3, 5, 7, 9, 11, 13, 15} is:",
      "options": ["7", "8", "8.5", "9"],
      "correctIndex": 2,
      "hint": "Median of even number of data is the average of two middle values.",
      "explanation": "Middle values: 8 and 9 → (8 + 9) / 2 = 8.5."
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
          content: const Text("You finished all Practise 17 questions."),
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
          "Probability & Statistics - Practise 17",
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
