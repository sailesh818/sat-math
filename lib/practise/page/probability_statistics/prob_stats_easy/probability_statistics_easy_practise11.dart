import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise11 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise11({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise11> createState() =>
      _ProbabilityStatisticsEasyPractise11State();
}

class _ProbabilityStatisticsEasyPractise11State
    extends State<ProbabilityStatisticsEasyPractise11> {

  int currentIndex = 0;
  int? selectedIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 green marbles and 4 yellow marbles. What is the probability of picking a green marble?",
      "options": ["3/5", "2/5", "1/2", "1/4"],
      "correctIndex": 0,
      "hint": "Probability = favorable / total.",
      "explanation": "6 green out of 10 → 6/10 = 3/5."
    },
    {
      "question":
          "2. The mean of the numbers 7, 9, 12, and x is 11. What is the value of x?",
      "options": ["13", "15", "14", "16"],
      "correctIndex": 3,
      "hint": "Mean × number of values = total sum.",
      "explanation": "11 × 4 = 44 → sum of 7+9+12 = 28 → x = 44 − 28 = 16."
    },
    {
      "question":
          "3. A fair die is rolled. What is the probability of rolling an odd number?",
      "options": ["1/3", "1/2", "2/3", "1/6"],
      "correctIndex": 1,
      "hint": "Odd numbers on a die: 1,3,5.",
      "explanation": "3 favorable outcomes out of 6 → 3/6 = 1/2."
    },
    {
      "question":
          "4. The data set {5, 8, 5, 9, 10} has which mode?",
      "options": ["5", "8", "9", "No mode"],
      "correctIndex": 0,
      "hint": "Mode = most frequent number.",
      "explanation": "5 appears twice; others once → mode = 5."
    },
    {
      "question":
          "5. What is the range of the numbers {3, 7, 4, 10, 8}?",
      "options": ["7", "6", "5", "8"],
      "correctIndex": 0,
      "hint": "Range = max − min.",
      "explanation": "10 − 3 = 7."
    },
    {
      "question":
          "6. A coin is flipped three times. What is the probability of getting exactly one head?",
      "options": ["1/8", "3/8", "1/2", "3/4"],
      "correctIndex": 1,
      "hint": "Use combinations: exactly one head.",
      "explanation": "Three possible outcomes: HTT, THT, TTH → 3/8."
    },
    {
      "question":
          "7. A spinner has 6 equal sections numbered 1–6. What is the probability of spinning a number less than 4?",
      "options": ["1/2", "1/3", "2/3", "1/4"],
      "correctIndex": 0,
      "hint": "Numbers < 4 are 1,2,3.",
      "explanation": "3 favorable out of 6 → 3/6 = 1/2."
    },
    {
      "question":
          "8. In a class of 25 students, 10 are boys. What fraction of the class are girls?",
      "options": ["3/5", "2/5", "1/2", "5/6"],
      "correctIndex": 0,
      "hint": "Fraction = girls / total.",
      "explanation": "Girls = 25 − 10 = 15 → 15/25 = 3/5."
    },
    {
      "question":
          "9. A number is randomly chosen from 1 to 15. What is the probability it is a multiple of 5?",
      "options": ["1/5", "1/3", "1/2", "2/5"],
      "correctIndex": 1,
      "hint": "Multiples of 5: 5,10,15.",
      "explanation": "3 favorable out of 15 → 3/15 = 1/5."
    },
    {
      "question":
          "10. The median of {2, 4, 6, 8, 10, 12} is:",
      "options": ["6", "7", "8", "9"],
      "correctIndex": 1,
      "hint": "Median = average of two middle numbers.",
      "explanation": "Ordered: 2,4,6,8,10,12 → middle: 6,8 → median = (6+8)/2 = 7."
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
          content: const Text("You finished all Practise 11 questions."),
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
          "Probability & Statistics - Practise 11",
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
