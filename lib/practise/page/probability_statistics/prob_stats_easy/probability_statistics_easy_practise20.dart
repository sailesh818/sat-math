import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise20 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise20({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise20> createState() =>
      _ProbabilityStatisticsEasyPractise20State();
}

class _ProbabilityStatisticsEasyPractise20State
    extends State<ProbabilityStatisticsEasyPractise20> {
  int currentIndex = 0;
  int? selectedIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A jar contains 4 red, 6 blue, and 2 green marbles. What is the probability of picking a blue marble?",
      "options": ["1/2", "3/6", "6/12", "3/10"],
      "correctIndex": 1,
      "hint": "Total marbles = 12. Probability = favorable/total.",
      "explanation": "6 blue marbles → 6/12 = 1/2."
    },
    {
      "question":
          "2. The mean of 3, 7, 10, and x is 8. What is x?",
      "options": ["12", "14", "10", "11"],
      "correctIndex": 2,
      "hint": "Mean × number of values = total sum.",
      "explanation": "8 × 4 = 32 → 3 + 7 + 10 = 20 → x = 32 − 20 = 10."
    },
    {
      "question":
          "3. A fair die is rolled. What is the probability of rolling a 2 or 4?",
      "options": ["1/3", "1/2", "1/6", "1/4"],
      "correctIndex": 0,
      "hint": "Favorable outcomes: 2, 4.",
      "explanation": "2 favorable outcomes out of 6 → 2/6 = 1/3."
    },
    {
      "question":
          "4. What is the mode of the data set {1, 3, 3, 4, 5, 5, 5, 6}?",
      "options": ["3", "4", "5", "6"],
      "correctIndex": 2,
      "hint": "Mode = most frequent number.",
      "explanation": "5 appears most frequently → mode = 5."
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting exactly two heads?",
      "options": ["1/4", "3/8", "3/16", "3/6"],
      "correctIndex": 1,
      "hint": "Calculate the possible outcomes.",
      "explanation": "Outcomes: HHTT, HTHT, HTTH, THHT, THTH, TTHH → 6 favorable outcomes → 3/8."
    },
    {
      "question":
          "6. The range of {5, 9, 12, 7, 10} is:",
      "options": ["5", "6", "7", "8"],
      "correctIndex": 3,
      "hint": "Range = max − min.",
      "explanation": "12 − 5 = 7."
    },
    {
      "question":
          "7. A spinner has 8 equal sections labeled 1–8. What is the probability of spinning an even number?",
      "options": ["1/2", "1/3", "1/4", "3/4"],
      "correctIndex": 0,
      "hint": "Even numbers: 2, 4, 6, 8.",
      "explanation": "4 favorable outcomes out of 8 → 4/8 = 1/2."
    },
    {
      "question":
          "8. In a class of 24 students, 15 are girls. What fraction of the class are boys?",
      "options": ["9/24", "15/24", "3/8", "2/3"],
      "correctIndex": 0,
      "hint": "Boys = total students − girls.",
      "explanation": "24 − 15 = 9 → 9/24."
    },
    {
      "question":
          "9. A number from 1 to 25 is chosen at random. What is the probability it is a multiple of 5?",
      "options": ["1/5", "1/4", "1/6", "1/3"],
      "correctIndex": 0,
      "hint": "Multiples of 5: 5, 10, 15, 20, 25.",
      "explanation": "5 favorable outcomes out of 25 → 5/25 = 1/5."
    },
    {
      "question":
          "10. The median of {2, 4, 6, 8, 10, 12, 14, 16} is:",
      "options": ["8", "9", "9.5", "10"],
      "correctIndex": 2,
      "hint": "Median of even number of data is the average of two middle values.",
      "explanation": "Middle values: 8 and 10 → (8 + 10) / 2 = 9."
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
          content: const Text("You finished all Practise 20 questions."),
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
          "Probability & Statistics - Practise 20",
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
