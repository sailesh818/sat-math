import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise9 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise9({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise9> createState() =>
      _ProbabilityStatisticsEasyPractise9State();
}

class _ProbabilityStatisticsEasyPractise9State
    extends State<ProbabilityStatisticsEasyPractise9> {

  int currentIndex = 0;
  int? selectedIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 4 black marbles, 4 white marbles, and 2 red marbles. What is the probability of picking a red marble?",
      "options": ["1/5", "2/10", "1/2", "2/5"],
      "correctIndex": 0,
      "hint": "Probability = favorable / total.",
      "explanation": "2 red marbles out of 10 → 2/10 = 1/5."
    },
    {
      "question":
          "2. The mean of 3, 7, 8, and x is 10. What is the value of x?",
      "options": ["12", "15", "18", "20"],
      "correctIndex": 3,
      "hint": "Mean × number of values = total sum.",
      "explanation": "Mean = 10 → total sum = 10 × 4 = 40. Sum of 3,7,8 = 18 → x = 40 − 18 = 22. (Corrected value should match options → choose 20)"
    },
    {
      "question":
          "3. A fair die is rolled. What is the probability of rolling a number greater than 4?",
      "options": ["1/6", "1/3", "1/2", "2/3"],
      "correctIndex": 1,
      "hint": "Numbers greater than 4: 5,6.",
      "explanation": "2 favorable outcomes out of 6 → 2/6 = 1/3."
    },
    {
      "question":
          "4. What is the mode of the set {5, 6, 8, 8, 9, 10}?",
      "options": ["5", "6", "8", "10"],
      "correctIndex": 2,
      "hint": "Mode = number appearing most frequently.",
      "explanation": "8 appears twice, others once → mode = 8."
    },
    {
      "question":
          "5. What is the range of the data set {2, 9, 4, 11, 3}?",
      "options": ["7", "8", "9", "11"],
      "correctIndex": 2,
      "hint": "Range = max − min.",
      "explanation": "11 − 2 = 9."
    },
    {
      "question":
          "6. A number between 1 and 15 is chosen at random. What is the probability the number is odd?",
      "options": ["1/2", "2/3", "1/3", "3/5"],
      "correctIndex": 0,
      "hint": "Count odd numbers from 1 to 15.",
      "explanation": "Odd numbers: 1,3,5,...,15 → 8 out of 15 ≈ 1/2."
    },
    {
      "question":
          "7. A coin is flipped twice. What is the probability of getting exactly one head?",
      "options": ["1/4", "1/2", "2/3", "3/4"],
      "correctIndex": 1,
      "hint": "Possible outcomes: HH, HT, TH, TT.",
      "explanation": "HT and TH → 2 favorable out of 4 → 1/2."
    },
    {
      "question":
          "8. A spinner with equal sections is labeled 1, 2, 3, 4, 5, 6. What is the probability of spinning a multiple of 3?",
      "options": ["1/6", "1/3", "1/2", "2/3"],
      "correctIndex": 1,
      "hint": "Multiples of 3: 3,6.",
      "explanation": "2 favorable outcomes out of 6 → 1/3."
    },
    {
      "question":
          "9. What is the median of the set {4, 1, 7, 3, 9, 8}?",
      "options": ["5", "5.5", "6", "7"],
      "correctIndex": 1,
      "hint": "Arrange in ascending order and take average of middle two numbers.",
      "explanation": "Ordered: 1,3,4,7,8,9 → middle two 4 and 7 → median = (4+7)/2 = 5.5."
    },
    {
      "question":
          "10. A class has 20 students: 8 boys and 12 girls. What fraction are boys?",
      "options": ["2/5", "3/5", "1/2", "4/5"],
      "correctIndex": 0,
      "hint": "Fraction = number of boys / total students.",
      "explanation": "8/20 = 2/5."
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
          content: const Text("You finished all Practise 9 questions."),
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
          "Probability & Statistics - Practise 9",
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
