import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise18 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise18({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise18> createState() =>
      _ProbabilityStatisticsEasyPractise18State();
}

class _ProbabilityStatisticsEasyPractise18State
    extends State<ProbabilityStatisticsEasyPractise18> {
  int currentIndex = 0;
  int? selectedIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 3 blue, and 2 yellow marbles. What is the probability of picking a yellow marble?",
      "options": ["1/5", "1/4", "2/5", "3/10"],
      "correctIndex": 0,
      "hint": "Total marbles = 10. Probability = favorable/total.",
      "explanation": "2 yellow marbles → 2/10 = 1/5."
    },
    {
      "question":
          "2. The mean of the numbers 6, 7, 9, and x is 8. What is x?",
      "options": ["10", "11", "12", "9"],
      "correctIndex": 0,
      "hint": "Mean × number of values = total sum.",
      "explanation": "8 × 4 = 32 → 6 + 7 + 9 = 22 → x = 32 − 22 = 10."
    },
    {
      "question":
          "3. A fair die is rolled. What is the probability of rolling an odd number?",
      "options": ["1/2", "1/3", "2/3", "1/6"],
      "correctIndex": 0,
      "hint": "Odd numbers on a die: 1, 3, 5.",
      "explanation": "3 favorable outcomes out of 6 → 3/6 = 1/2."
    },
    {
      "question":
          "4. What is the mode of the data set {2, 3, 3, 5, 6, 6, 7}?",
      "options": ["3", "5", "6", "7"],
      "correctIndex": 0,
      "hint": "Mode = most frequent number.",
      "explanation": "3 appears most frequently → mode = 3."
    },
    {
      "question":
          "5. A coin is flipped three times. What is the probability of getting exactly two tails?",
      "options": ["1/2", "1/4", "3/8", "1/8"],
      "correctIndex": 2,
      "hint": "Calculate the possible outcomes.",
      "explanation": "Outcomes: TTH, THT, HTT → 3 favorable outcomes → 3/8."
    },
    {
      "question":
          "6. The range of the numbers {4, 7, 9, 3, 11} is:",
      "options": ["7", "8", "9", "10"],
      "correctIndex": 1,
      "hint": "Range = max − min.",
      "explanation": "11 − 3 = 8."
    },
    {
      "question":
          "7. A spinner has 5 equal sections labeled 1–5. What is the probability of spinning a number greater than 3?",
      "options": ["2/5", "1/2", "3/5", "1/3"],
      "correctIndex": 0,
      "hint": "Favorable outcomes: 4, 5.",
      "explanation": "2 favorable outcomes out of 5 → 2/5."
    },
    {
      "question":
          "8. In a class of 26 students, 14 are girls. What fraction of the class are boys?",
      "options": ["12/26", "14/26", "1/2", "2/5"],
      "correctIndex": 0,
      "hint": "Boys = total students − girls.",
      "explanation": "26 − 14 = 12 → 12/26."
    },
    {
      "question":
          "9. A number is chosen randomly from 1 to 20. What is the probability it is a multiple of 5?",
      "options": ["1/5", "1/4", "1/3", "1/2"],
      "correctIndex": 1,
      "hint": "Multiples of 5: 5, 10, 15, 20.",
      "explanation": "4 favorable outcomes out of 20 → 4/20 = 1/5."
    },
    {
      "question":
          "10. The median of {3, 5, 7, 9, 11, 13} is:",
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
          content: const Text("You finished all Practise 18 questions."),
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
          "Probability & Statistics - Practise 18",
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
