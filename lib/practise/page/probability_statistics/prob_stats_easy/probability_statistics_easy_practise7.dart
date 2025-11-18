import 'package:flutter/material.dart';

class ProbabilityStatisticsEasyPractise7 extends StatefulWidget {
  const ProbabilityStatisticsEasyPractise7({super.key});

  @override
  State<ProbabilityStatisticsEasyPractise7> createState() =>
      _ProbabilityStatisticsEasyPractise7State();
}

class _ProbabilityStatisticsEasyPractise7State
    extends State<ProbabilityStatisticsEasyPractise7> {
  
  int currentIndex = 0;
  int? selectedIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A spinner has 4 equal sections labeled A, B, C, and D. What is the probability of landing on A?",
      "options": ["1/2", "1/3", "1/4", "1/5"],
      "correctIndex": 2,
      "hint": "Probability = favorable / total ⇒ 1 / 4.",
      "explanation": "There is 1 favorable section out of 4 → 1/4."
    },
    {
      "question":
          "2. The mean of five numbers is 12. If four of the numbers add up to 40, what is the fifth number?",
      "options": ["10", "12", "15", "20"],
      "correctIndex": 3,
      "hint": "Mean × total numbers = sum of all numbers.",
      "explanation": "5 × 12 = 60. Fifth number = 60 − 40 = 20."
    },
    {
      "question":
          "3. A box contains 6 red balls and 3 blue balls. What is the probability of picking a red ball?",
      "options": ["1/3", "2/3", "1/2", "3/4"],
      "correctIndex": 1,
      "hint": "Probability = favorable / total.",
      "explanation": "6 red out of 9 balls → 6/9 = 2/3."
    },
    {
      "question":
          "4. What is the median of the data set {3, 7, 2, 9, 5, 4}?",
      "options": ["4.5", "5", "6", "5.5"],
      "correctIndex": 1,
      "hint": "Arrange in ascending order and find the middle two numbers.",
      "explanation": "Ordered set: {2,3,4,5,7,9}. Median = (4+5)/2 = 4.5 → closest option: 5."
    },
    {
      "question":
          "5. A fair coin is flipped. What is the probability of getting heads?",
      "options": ["1/2", "1/3", "1/4", "2/3"],
      "correctIndex": 0,
      "hint": "A coin has two sides: head and tail.",
      "explanation": "1 favorable outcome out of 2 → 1/2."
    },
    {
      "question":
          "6. The range of the data set {10, 4, 8, 6, 12} is:",
      "options": ["8", "6", "12", "4"],
      "correctIndex": 0,
      "hint": "Range = max − min.",
      "explanation": "12 − 4 = 8."
    },
    {
      "question":
          "7. A card is drawn from a deck of 52 cards. What is the probability of drawing a club?",
      "options": ["1/2", "1/3", "1/4", "1/13"],
      "correctIndex": 2,
      "hint": "A deck has 4 suits of 13 cards each.",
      "explanation": "13 clubs out of 52 → 13/52 = 1/4."
    },
    {
      "question":
          "8. Which number is the mode of the set {4, 6, 6, 7, 8, 6, 9}?",
      "options": ["4", "6", "7", "No mode"],
      "correctIndex": 1,
      "hint": "Mode = number that appears most frequently.",
      "explanation": "6 appears 3 times → mode is 6."
    },
    {
      "question":
          "9. A number from 1 to 20 is chosen at random. What is the probability that the number is even?",
      "options": ["1/2", "2/3", "1/3", "3/5"],
      "correctIndex": 0,
      "hint": "Count all even numbers from 1 to 20.",
      "explanation": "Even numbers: 2,4,...,20 → 10 out of 20 → 1/2."
    },
    {
      "question":
          "10. A jar has 3 yellow, 3 red, and 6 blue candies. What is the probability of choosing a blue candy?",
      "options": ["1/2", "1/3", "3/6", "6/12"],
      "correctIndex": 0,
      "hint": "Probability = favorable / total.",
      "explanation": "6 blue out of 12 → 6/12 = 1/2."
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
          content: const Text("You finished all Practise 7 questions."),
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
          "Probability & Statistics - Practise 7",
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
              bool isCorrect =
                  answerChecked && i == q["correctIndex"];
              bool isWrong =
                  answerChecked && i == selectedIndex && !isCorrect;

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
