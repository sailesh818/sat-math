import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise19 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise19({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise19> createState() =>
      _ProbabilityStatisticsEasyPractise19State();
}

class _ProbabilityStatisticsEasyPractise19State
    extends State<ProbabilityStatisticsEasyPractise19> {
  int currentIndex = 0;
  int? selectedIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 3 red, 4 blue, and 3 green balls. What is the probability of picking a green ball?",
      "options": ["1/4", "3/10", "1/3", "1/2"],
      "correctIndex": 1,
      "hint": "Total balls = 10. Probability = favorable/total.",
      "explanation": "3 green balls → 3/10."
    },
    {
      "question":
          "2. The mean of the numbers 2, 6, 8, and x is 6. What is x?",
      "options": ["6", "8", "10", "12"],
      "correctIndex": 2,
      "hint": "Mean × number of values = total sum.",
      "explanation": "6 × 4 = 24 → 2 + 6 + 8 = 16 → x = 24 − 16 = 10."
    },
    {
      "question":
          "3. A fair die is rolled. What is the probability of rolling a number divisible by 3?",
      "options": ["1/2", "1/3", "1/4", "2/3"],
      "correctIndex": 1,
      "hint": "Numbers divisible by 3: 3, 6.",
      "explanation": "2 favorable outcomes out of 6 → 2/6 = 1/3."
    },
    {
      "question":
          "4. What is the mode of the data set {5, 6, 6, 7, 8, 8, 8, 9}?",
      "options": ["6", "7", "8", "9"],
      "correctIndex": 2,
      "hint": "Mode = most frequent number.",
      "explanation": "8 appears most frequently → mode = 8."
    },
    {
      "question":
          "5. A coin is flipped three times. What is the probability of getting exactly one head?",
      "options": ["1/8", "3/8", "1/2", "3/4"],
      "correctIndex": 1,
      "hint": "Calculate the possible outcomes.",
      "explanation": "Outcomes: HTT, THT, TTH → 3 favorable outcomes → 3/8."
    },
    {
      "question":
          "6. The range of {4, 6, 9, 7, 12} is:",
      "options": ["7", "8", "9", "10"],
      "correctIndex": 1,
      "hint": "Range = max − min.",
      "explanation": "12 − 4 = 8."
    },
    {
      "question":
          "7. A spinner with numbers 1–8 is spun. What is the probability of spinning a number greater than 6?",
      "options": ["1/4", "1/3", "1/2", "1/8"],
      "correctIndex": 0,
      "hint": "Favorable outcomes: 7, 8.",
      "explanation": "2 favorable outcomes out of 8 → 2/8 = 1/4."
    },
    {
      "question":
          "8. In a class of 32 students, 20 are girls. What fraction of the class are boys?",
      "options": ["12/32", "3/8", "2/5", "5/8"],
      "correctIndex": 0,
      "hint": "Boys = total students − girls.",
      "explanation": "32 − 20 = 12 → 12/32."
    },
    {
      "question":
          "9. A number from 1 to 30 is chosen at random. What is the probability it is a multiple of 5?",
      "options": ["1/5", "1/6", "1/4", "1/3"],
      "correctIndex": 1,
      "hint": "Multiples of 5: 5, 10, 15, 20, 25, 30.",
      "explanation": "6 favorable outcomes out of 30 → 6/30 = 1/5."
    },
    {
      "question":
          "10. The median of {1, 4, 6, 7, 9, 12} is:",
      "options": ["5", "6", "6.5", "7"],
      "correctIndex": 2,
      "hint": "Median of even number of data is the average of two middle values.",
      "explanation": "Middle values: 6 and 7 → (6 + 7) / 2 = 6.5."
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
          content: const Text("You finished all Practise 19 questions."),
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
          "Probability & Statistics - Practise 19",
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
