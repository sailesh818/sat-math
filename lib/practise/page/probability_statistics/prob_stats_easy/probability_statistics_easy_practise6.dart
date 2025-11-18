import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise6 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise6({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise6> createState() =>
      _ProbabilityStatisticsEasyPractise6State();
}

class _ProbabilityStatisticsEasyPractise6State
    extends State<ProbabilityStatisticsEasyPractise6> {
  
  int currentIndex = 0;
  int? selectedIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A jar contains 8 green candies and 4 red candies. What is the probability of picking a red candy?",
      "options": ["1/2", "1/3", "4/12", "2/3"],
      "correctIndex": 1,
      "hint": "Probability = favorable / total ⇒ 4 / 12.",
      "explanation": "4 red candies out of 12 → 4/12 = 1/3."
    },
    {
      "question":
          "2. The mean of 6 numbers is 9. If the sum of five of the numbers is 40, what is the sixth number?",
      "options": ["9", "10", "14", "12"],
      "correctIndex": 2,
      "hint": "Mean × quantity = total sum.",
      "explanation": "9 × 6 = 54. Sixth number = 54 − 40 = 14."
    },
    {
      "question":
          "3. A fair die is rolled. What is the probability of rolling an even number?",
      "options": ["1/2", "1/3", "2/3", "3/6"],
      "correctIndex": 0,
      "hint": "Even numbers on a die: 2, 4, 6.",
      "explanation": "3 out of 6 outcomes ⇒ 3/6 = 1/2."
    },
    {
      "question":
          "4. The data set {2, 4, 4, 5, 7} has which mode?",
      "options": ["2", "4", "5", "No mode"],
      "correctIndex": 1,
      "hint": "Mode = most frequent number.",
      "explanation": "4 appears twice; others once."
    },
    {
      "question":
          "5. A bag has 5 white balls and 5 blue balls. What is the probability of choosing a blue ball?",
      "options": ["1/5", "1/2", "5/10", "2/5"],
      "correctIndex": 1,
      "hint": "Equal number of white and blue.",
      "explanation": "5/10 = 1/2."
    },
    {
      "question":
          "6. A number is selected randomly from 1 to 10. What is the probability the number is greater than 7?",
      "options": ["1/5", "3/10", "2/10", "3/5"],
      "correctIndex": 1,
      "hint": "Numbers > 7 are 8, 9, 10.",
      "explanation": "3 out of 10 numbers = 3/10."
    },
    {
      "question":
          "7. The median of {1, 3, 4, 6, 8, 9} is:",
      "options": ["4", "5", "4.5", "6"],
      "correctIndex": 2,
      "hint": "Median of even numbers = average of two middle values.",
      "explanation": "(4 + 5) / 2 = 4.5."
    },
    {
      "question":
          "8. A coin is flipped twice. What is the probability of getting no heads?",
      "options": ["1/4", "1/2", "1/3", "3/4"],
      "correctIndex": 0,
      "hint": "Only outcome with 0 heads: TT.",
      "explanation": "1 favorable out of 4 total outcomes → 1/4."
    },
    {
      "question":
          "9. A box contains 3 yellow, 2 black, and 5 orange marbles. What is the probability of selecting a yellow marble?",
      "options": ["3/10", "1/2", "2/5", "1/3"],
      "correctIndex": 0,
      "hint": "Total = 10 marbles.",
      "explanation": "3 yellow out of 10 ⇒ 3/10."
    },
    {
      "question":
          "10. The range of the data set {4, 9, 2, 6, 8} is:",
      "options": ["4", "7", "8", "6"],
      "correctIndex": 1,
      "hint": "Range = max – min.",
      "explanation": "9 − 2 = 7."
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
          content: const Text("You finished all Practise 6 questions."),
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
          "Probability & Statistics - Practise 6",
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
              bool isCorrect =
                  answerChecked && i == q["correctIndex"];
              bool isWrong =
                  answerChecked && i == selectedIndex && !isCorrect;

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

            /// HINT BUTTON ON RIGHT SIDE
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
