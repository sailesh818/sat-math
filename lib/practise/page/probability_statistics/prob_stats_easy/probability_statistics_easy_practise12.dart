import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise12 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise12({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise12> createState() =>
      _ProbabilityStatisticsEasyPractise12State();
}

class _ProbabilityStatisticsEasyPractise12State
    extends State<ProbabilityStatisticsEasyPractise12> {

  int currentIndex = 0;
  int? selectedIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red balls, 3 blue balls, and 2 green balls. What is the probability of selecting a blue ball?",
      "options": ["3/10", "1/2", "2/5", "1/3"],
      "correctIndex": 0,
      "hint": "Probability = favorable / total.",
      "explanation": "3 blue balls out of 10 → 3/10."
    },
    {
      "question":
          "2. The mean of the numbers 8, 12, 14, and x is 11. What is x?",
      "options": ["8", "9", "7", "6"],
      "correctIndex": 3,
      "hint": "Mean × number of values = total sum.",
      "explanation": "11 × 4 = 44 → sum of 8+12+14=34 → x = 44−34=10."
    },
    {
      "question":
          "3. A fair die is rolled. What is the probability of rolling a number divisible by 2?",
      "options": ["1/2", "1/3", "2/3", "1/6"],
      "correctIndex": 0,
      "hint": "Even numbers on a die: 2,4,6.",
      "explanation": "3 favorable out of 6 → 3/6 = 1/2."
    },
    {
      "question":
          "4. The median of {3, 5, 7, 9, 11, 13} is:",
      "options": ["7", "8", "9", "8.5"],
      "correctIndex": 3,
      "hint": "Median of even numbers = average of two middle values.",
      "explanation": "(7+9)/2 = 8."
    },
    {
      "question":
          "5. What is the mode of {2, 4, 4, 5, 6, 6, 6, 7}?",
      "options": ["4", "5", "6", "7"],
      "correctIndex": 2,
      "hint": "Mode = most frequent number.",
      "explanation": "6 appears 3 times → mode = 6."
    },
    {
      "question":
          "6. A coin is flipped twice. What is the probability of getting at least one head?",
      "options": ["1/4", "1/2", "3/4", "1/3"],
      "correctIndex": 2,
      "hint": "Probability of no heads = 1/4 → 1 − 1/4 = 3/4.",
      "explanation": "Favorable outcomes: HT, TH, HH → 3/4."
    },
    {
      "question":
          "7. A spinner has 8 equal sections labeled 1–8. What is the probability of spinning a number less than 5?",
      "options": ["1/2", "1/3", "1/4", "3/4"],
      "correctIndex": 0,
      "hint": "Numbers <5: 1,2,3,4.",
      "explanation": "4 favorable out of 8 → 4/8 = 1/2."
    },
    {
      "question":
          "8. In a class of 30 students, 18 are girls. What fraction of the class are boys?",
      "options": ["2/5", "3/5", "1/2", "1/3"],
      "correctIndex": 0,
      "hint": "Boys = total − girls.",
      "explanation": "Boys = 30−18=12 → 12/30 = 2/5."
    },
    {
      "question":
          "9. A number from 1 to 20 is chosen at random. What is the probability it is a multiple of 4?",
      "options": ["1/4", "1/5", "1/3", "1/2"],
      "correctIndex": 1,
      "hint": "Multiples of 4: 4,8,12,16,20.",
      "explanation": "5 favorable out of 20 → 5/20 = 1/4."
    },
    {
      "question":
          "10. The range of {5, 10, 12, 7, 15} is:",
      "options": ["10", "8", "7", "5"],
      "correctIndex": 0,
      "hint": "Range = max − min.",
      "explanation": "15−5=10."
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
          content: const Text("You finished all Practise 12 questions."),
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
          "Probability & Statistics - Practise 12",
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
