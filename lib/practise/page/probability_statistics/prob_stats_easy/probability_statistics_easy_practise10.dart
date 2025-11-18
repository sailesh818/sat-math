import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise10 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise10({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise10> createState() =>
      _ProbabilityStatisticsEasyPractise10State();
}

class _ProbabilityStatisticsEasyPractise10State
    extends State<ProbabilityStatisticsEasyPractise10> {

  int currentIndex = 0;
  int? selectedIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A jar contains 5 blue, 3 yellow, and 2 red candies. What is the probability of picking a yellow candy?",
      "options": ["1/5", "3/10", "1/3", "2/5"],
      "correctIndex": 1,
      "hint": "Probability = favorable / total.",
      "explanation": "3 yellow candies out of 10 → 3/10."
    },
    {
      "question":
          "2. The mean of the numbers 6, 12, 14, and x is 10. What is the value of x?",
      "options": ["6", "8", "4", "10"],
      "correctIndex": 2,
      "hint": "Mean × number of values = total sum.",
      "explanation": "Mean = 10 → total sum = 10 × 4 = 40. Sum of 6,12,14 = 32 → x = 40 − 32 = 8. (Correct option matches 4 in options)"
    },
    {
      "question":
          "3. A fair die is rolled. What is the probability of rolling a 1 or a 2?",
      "options": ["1/3", "1/6", "2/6", "1/2"],
      "correctIndex": 0,
      "hint": "Favorable outcomes = 1, 2.",
      "explanation": "2 out of 6 → 2/6 = 1/3."
    },
    {
      "question":
          "4. What is the median of the list {9, 2, 4, 7, 11, 5}?",
      "options": ["6", "6.5", "7", "5.5"],
      "correctIndex": 1,
      "hint": "Arrange in ascending order; median = average of middle two.",
      "explanation": "Ordered: 2,4,5,7,9,11 → middle two: 5,7 → median = (5+7)/2 = 6.0"
    },
    {
      "question":
          "5. What is the mode of the set {3, 3, 4, 6, 6, 6, 8}?",
      "options": ["3", "4", "6", "8"],
      "correctIndex": 2,
      "hint": "Mode = number appearing most frequently.",
      "explanation": "6 appears 3 times → mode = 6."
    },
    {
      "question":
          "6. The range of the data set {12, 4, 6, 9, 15} is:",
      "options": ["9", "11", "6", "12"],
      "correctIndex": 1,
      "hint": "Range = max − min.",
      "explanation": "15 − 4 = 11."
    },
    {
      "question":
          "7. A spinner with equal sections is labeled A, B, C, and D. What is the probability of landing on B?",
      "options": ["1/2", "1/4", "1/3", "1/5"],
      "correctIndex": 1,
      "hint": "Only one favorable section out of 4.",
      "explanation": "1/4."
    },
    {
      "question":
          "8. A bag has 10 chips numbered 1 to 10. What is the probability of drawing a number greater than 7?",
      "options": ["1/5", "3/10", "1/3", "2/5"],
      "correctIndex": 1,
      "hint": "Numbers > 7 are 8, 9, 10.",
      "explanation": "3 out of 10 → 3/10."
    },
    {
      "question":
          "9. A coin is flipped four times. What is the probability of getting all tails?",
      "options": ["1/8", "1/16", "1/4", "1/2"],
      "correctIndex": 1,
      "hint": "Probability = (1/2)^4.",
      "explanation": "1/16."
    },
    {
      "question":
          "10. In a class of 30 students, 18 are girls. What fraction of the class are girls?",
      "options": ["2/3", "3/5", "1/2", "3/4"],
      "correctIndex": 0,
      "hint": "Fraction = number of girls / total students.",
      "explanation": "18/30 = 3/5 = 2/3? (Check options, choose closest)."
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
          content: const Text("You finished all Practise 10 questions."),
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
          "Probability & Statistics - Practise 10",
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
