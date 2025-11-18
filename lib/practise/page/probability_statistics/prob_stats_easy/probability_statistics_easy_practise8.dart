import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise8 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise8({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise8> createState() =>
      _ProbabilityStatisticsEasyPractise8State();
}

class _ProbabilityStatisticsEasyPractise8State
    extends State<ProbabilityStatisticsEasyPractise8> {

  int currentIndex = 0;
  int? selectedIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 7 red balls and 3 green balls. What is the probability of picking a green ball?",
      "options": ["1/2", "3/10", "1/3", "7/10"],
      "correctIndex": 1,
      "hint": "Probability = favorable / total ⇒ 3 / 10.",
      "explanation": "3 green balls out of 10 → 3/10."
    },
    {
      "question":
          "2. The mean of the numbers 5, 9, 11, and x is 10. What is the value of x?",
      "options": ["10", "12", "15", "20"],
      "correctIndex": 2,
      "hint": "Mean × number of values = total sum.",
      "explanation": "Mean = 10 → total sum = 10 × 4 = 40. Sum of 5,9,11 = 25 → x = 40−25 = 15."
    },
    {
      "question":
          "3. A fair die is rolled. What is the probability of rolling a number less than 4?",
      "options": ["1/2", "1/3", "2/3", "3/6"],
      "correctIndex": 0,
      "hint": "Numbers less than 4: 1, 2, 3.",
      "explanation": "3 out of 6 outcomes → 3/6 = 1/2."
    },
    {
      "question":
          "4. What is the range of the data set {8, 3, 12, 5, 10}?",
      "options": ["5", "7", "9", "12"],
      "correctIndex": 2,
      "hint": "Range = max − min.",
      "explanation": "12 − 3 = 9."
    },
    {
      "question":
          "5. Which number is the median of the set {2, 6, 4, 8, 10}?",
      "options": ["4", "6", "8", "5"],
      "correctIndex": 1,
      "hint": "Arrange in ascending order and pick middle value.",
      "explanation": "Ordered: 2,4,6,8,10 → median = 6."
    },
    {
      "question":
          "6. A spinner has 5 equal sections numbered 1 through 5. What is the probability of landing on an even number?",
      "options": ["2/5", "1/5", "3/5", "1/2"],
      "correctIndex": 0,
      "hint": "Even numbers: 2 and 4.",
      "explanation": "2 favorable out of 5 → 2/5."
    },
    {
      "question":
          "7. A coin is flipped three times. What is the probability of getting exactly 3 heads?",
      "options": ["1/8", "1/4", "3/8", "1/2"],
      "correctIndex": 0,
      "hint": "Total outcomes: 2^3 = 8. Only HHH is favorable.",
      "explanation": "1 out of 8 → 1/8."
    },
    {
      "question":
          "8. A class has 12 boys and 18 girls. What fraction of the class are girls?",
      "options": ["3/5", "2/3", "1/2", "5/6"],
      "correctIndex": 0,
      "hint": "Fraction = number of girls / total students.",
      "explanation": "18/(12+18) = 18/30 = 3/5."
    },
    {
      "question":
          "9. A number from 1 to 12 is chosen at random. What is the probability the number is a multiple of 3?",
      "options": ["1/4", "1/3", "1/2", "2/3"],
      "correctIndex": 1,
      "hint": "Multiples of 3: 3,6,9,12.",
      "explanation": "4 out of 12 → 1/3."
    },
    {
      "question":
          "10. In the data set {4, 4, 5, 6, 7, 7, 7}, what is the mode?",
      "options": ["4", "5", "6", "7"],
      "correctIndex": 3,
      "hint": "Mode = most frequent number.",
      "explanation": "7 appears 3 times → mode = 7."
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
          content: const Text("You finished all Practise 8 questions."),
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
          "Probability & Statistics - Practise 8",
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
