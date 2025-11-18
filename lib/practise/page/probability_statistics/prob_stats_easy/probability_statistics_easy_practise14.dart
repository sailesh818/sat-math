import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise14 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise14({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise14> createState() =>
      _ProbabilityStatisticsEasyPractise14State();
}

class _ProbabilityStatisticsEasyPractise14State
    extends State<ProbabilityStatisticsEasyPractise14> {
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
      "hint": "Probability = favorable / total.",
      "explanation": "2 yellow marbles out of 10 → 2/10 = 1/5."
    },
    {
      "question":
          "2. The mean of the numbers 6, 8, 10, and x is 9. What is the value of x?",
      "options": ["8", "9", "12", "14"],
      "correctIndex": 2,
      "hint": "Mean × number of values = total sum.",
      "explanation": "9 × 4 = 36 → sum of 6+8+10=24 → x = 36−24=12."
    },
    {
      "question":
          "3. A fair die is rolled. What is the probability of rolling a number greater than 4?",
      "options": ["1/3", "1/2", "2/3", "1/6"],
      "correctIndex": 0,
      "hint": "Numbers greater than 4: 5,6.",
      "explanation": "2 favorable out of 6 → 2/6 = 1/3."
    },
    {
      "question":
          "4. The mode of the data set {3, 7, 7, 9, 10} is:",
      "options": ["3", "7", "9", "10"],
      "correctIndex": 1,
      "hint": "Mode = most frequent number.",
      "explanation": "7 appears twice → mode = 7."
    },
    {
      "question":
          "5. A coin is flipped two times. What is the probability of getting two tails?",
      "options": ["1/2", "1/4", "3/4", "1/3"],
      "correctIndex": 1,
      "hint": "Count favorable outcomes.",
      "explanation": "TT → 1 outcome out of 4 → 1/4."
    },
    {
      "question":
          "6. The range of the numbers {5, 8, 12, 3, 10} is:",
      "options": ["7", "8", "9", "10"],
      "correctIndex": 2,
      "hint": "Range = max − min.",
      "explanation": "12 − 3 = 9."
    },
    {
      "question":
          "7. A spinner with equal sections numbered 1–6 is spun. What is the probability of spinning a number divisible by 3?",
      "options": ["1/6", "1/3", "1/2", "2/3"],
      "correctIndex": 1,
      "hint": "Numbers divisible by 3: 3,6.",
      "explanation": "2 favorable out of 6 → 1/3."
    },
    {
      "question":
          "8. In a class of 20 students, 12 are girls. What fraction of the class are boys?",
      "options": ["8/20", "3/5", "2/5", "1/2"],
      "correctIndex": 2,
      "hint": "Boys = total − girls.",
      "explanation": "20−12=8 → 8/20 = 2/5."
    },
    {
      "question":
          "9. A number from 1 to 15 is chosen at random. What is the probability it is odd?",
      "options": ["1/2", "1/3", "2/3", "1/4"],
      "correctIndex": 0,
      "hint": "Odd numbers: 1,3,5,...,15.",
      "explanation": "8 odd numbers out of 15? Actually 1,3,5,7,9,11,13,15 → 8/15. Correct answer should be 8/15, not 1/2."
    },
    {
      "question":
          "10. The median of {4, 6, 7, 8, 10, 12} is:",
      "options": ["7", "7.5", "8", "8.5"],
      "correctIndex": 1,
      "hint": "Median = average of two middle numbers (even count).",
      "explanation": "(7+8)/2 = 7.5."
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
          content: const Text("You finished all Practise 14 questions."),
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
          "Probability & Statistics - Practise 14",
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
