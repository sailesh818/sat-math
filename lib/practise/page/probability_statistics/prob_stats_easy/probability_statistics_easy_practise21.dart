import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise21 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise21({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise21> createState() =>
      _ProbabilityStatisticsEasyPractise21State();
}

class _ProbabilityStatisticsEasyPractise21State
    extends State<ProbabilityStatisticsEasyPractise21> {
  int currentIndex = 0;
  int? selectedIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 3 red, 5 blue, and 2 green marbles. What is the probability of picking a red marble?",
      "options": ["3/10", "1/3", "1/5", "2/5"],
      "correctIndex": 0,
      "hint": "Total marbles = 10. Probability = favorable/total.",
      "explanation": "3 red marbles → 3/10."
    },
    {
      "question":
          "2. The mean of 5, 7, 9, and x is 8. What is x?",
      "options": ["10", "9", "8", "11"],
      "correctIndex": 1,
      "hint": "Mean × number of values = total sum.",
      "explanation": "8 × 4 = 32 → 5 + 7 + 9 = 21 → x = 32 − 21 = 9."
    },
    {
      "question":
          "3. A fair die is rolled. What is the probability of rolling a number less than 4?",
      "options": ["1/2", "1/3", "1/4", "2/3"],
      "correctIndex": 0,
      "hint": "Favorable outcomes: 1, 2, 3.",
      "explanation": "3 favorable outcomes out of 6 → 3/6 = 1/2."
    },
    {
      "question":
          "4. What is the mode of the data set {2, 4, 4, 5, 6, 6, 7}?",
      "options": ["4", "5", "6", "7"],
      "correctIndex": 0,
      "hint": "Mode = most frequent number.",
      "explanation": "4 appears most frequently → mode = 4."
    },
    {
      "question":
          "5. A coin is flipped two times. What is the probability of getting at least one head?",
      "options": ["1/2", "3/4", "1/4", "1/3"],
      "correctIndex": 1,
      "hint": "At least one head means 1 − probability of no heads.",
      "explanation": "Probability of no heads = 1/4. Probability of at least one head = 1 − 1/4 = 3/4."
    },
    {
      "question":
          "6. The range of the numbers {3, 5, 8, 6, 10} is:",
      "options": ["5", "6", "7", "8"],
      "correctIndex": 2,
      "hint": "Range = max − min.",
      "explanation": "10 − 3 = 7."
    },
    {
      "question":
          "7. A spinner has 4 equal sections labeled 1–4. What is the probability of spinning a number greater than 2?",
      "options": ["1/4", "1/2", "1/3", "3/4"],
      "correctIndex": 1,
      "hint": "Favorable outcomes: 3, 4.",
      "explanation": "2 favorable outcomes out of 4 → 2/4 = 1/2."
    },
    {
      "question":
          "8. In a class of 20 students, 12 are boys. What fraction of the class are girls?",
      "options": ["8/20", "3/5", "2/5", "1/2"],
      "correctIndex": 0,
      "hint": "Girls = total students − boys.",
      "explanation": "20 − 12 = 8 → 8/20."
    },
    {
      "question":
          "9. A number from 1 to 15 is chosen at random. What is the probability it is divisible by 3?",
      "options": ["1/3", "1/5", "1/4", "2/5"],
      "correctIndex": 1,
      "hint": "Multiples of 3: 3, 6, 9, 12.",
      "explanation": "3 favorable outcomes out of 15 → 3/15 = 1/5."
    },
    {
      "question":
          "10. The median of {1, 3, 5, 7, 9, 11} is:",
      "options": ["5", "6", "6.5", "7"],
      "correctIndex": 2,
      "hint": "Median of even number of data is the average of two middle values.",
      "explanation": "Middle values: 5 and 7 → (5 + 7) / 2 = 6."
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
          content: const Text("You finished all Practise 21 questions."),
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
          "Probability & Statistics - Practise 21",
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
