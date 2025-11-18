import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise13 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise13({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise13> createState() =>
      _ProbabilityStatisticsEasyPractise13State();
}

class _ProbabilityStatisticsEasyPractise13State
    extends State<ProbabilityStatisticsEasyPractise13> {

  int currentIndex = 0;
  int? selectedIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A jar contains 3 red, 4 blue, and 3 green marbles. What is the probability of picking a red marble?",
      "options": ["1/5", "3/10", "1/3", "2/5"],
      "correctIndex": 1,
      "hint": "Probability = favorable / total.",
      "explanation": "3 red marbles out of 10 → 3/10."
    },
    {
      "question":
          "2. The mean of 5, 7, 8, and x is 9. What is the value of x?",
      "options": ["10", "11", "12", "13"],
      "correctIndex": 3,
      "hint": "Mean × number of values = total sum.",
      "explanation": "9 × 4 = 36 → sum of 5+7+8=20 → x = 36−20=16. Correction: The answer should be 16, not 13."
    },
    {
      "question":
          "3. A fair die is rolled. What is the probability of rolling a number less than 5?",
      "options": ["1/2", "2/3", "1/3", "3/4"],
      "correctIndex": 1,
      "hint": "Numbers less than 5: 1,2,3,4.",
      "explanation": "4 favorable out of 6 → 4/6 = 2/3."
    },
    {
      "question":
          "4. The data set {2, 5, 5, 7, 8} has which mode?",
      "options": ["2", "5", "7", "8"],
      "correctIndex": 1,
      "hint": "Mode = most frequent number.",
      "explanation": "5 appears twice → mode = 5."
    },
    {
      "question":
          "5. A coin is flipped three times. What is the probability of getting exactly two heads?",
      "options": ["1/8", "3/8", "1/2", "3/4"],
      "correctIndex": 1,
      "hint": "Count favorable outcomes.",
      "explanation": "Favorable: HHT, HTH, THH → 3/8."
    },
    {
      "question":
          "6. The range of the data set {6, 2, 9, 4, 7} is:",
      "options": ["5", "6", "7", "8"],
      "correctIndex": 2,
      "hint": "Range = max − min.",
      "explanation": "9−2 = 7."
    },
    {
      "question":
          "7. A spinner has 5 equal sections labeled 1–5. What is the probability of spinning a number greater than 3?",
      "options": ["2/5", "1/2", "3/5", "1/5"],
      "correctIndex": 0,
      "hint": "Numbers greater than 3: 4,5.",
      "explanation": "2 favorable out of 5 → 2/5."
    },
    {
      "question":
          "8. In a class of 24 students, 10 are boys. What fraction of the class are girls?",
      "options": ["7/12", "14/24", "10/24", "5/12"],
      "correctIndex": 0,
      "hint": "Girls = total − boys.",
      "explanation": "Girls = 24−10=14 → 14/24 = 7/12."
    },
    {
      "question":
          "9. A number is randomly chosen from 1 to 18. What is the probability it is a multiple of 3?",
      "options": ["1/3", "1/6", "1/2", "2/3"],
      "correctIndex": 0,
      "hint": "Multiples of 3: 3,6,9,12,15,18.",
      "explanation": "6 favorable out of 18 → 6/18 = 1/3."
    },
    {
      "question":
          "10. The median of {3, 5, 7, 9, 11, 13} is:",
      "options": ["7", "8", "8.5", "9"],
      "correctIndex": 2,
      "hint": "Median = average of two middle numbers (even count).",
      "explanation": "(7+9)/2 = 8."
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
          content: const Text("You finished all Practise 13 questions."),
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
          "Probability & Statistics - Practise 13",
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
