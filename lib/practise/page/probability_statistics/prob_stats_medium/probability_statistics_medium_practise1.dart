import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise1 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise1({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise1> createState() =>
      _ProbabilityStatisticsMediumPractise1State();
}

class _ProbabilityStatisticsMediumPractise1State
    extends State<ProbabilityStatisticsMediumPractise1> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 3 blue, and 2 green marbles. Two marbles are drawn without replacement. What is the probability that both are blue?",
      "options": ["1/15", "2/45", "1/6", "3/20"],
      "correctIndex": 1,
      "hint": "Use the formula for probability without replacement: P(A and B) = P(A) * P(B|A).",
      "explanation": "P(first blue) = 3/10, P(second blue) = 2/9. Multiply: 3/10 * 2/9 = 6/90 = 2/45."
    },
    {
      "question":
          "2. The mean of five numbers is 14. If four of the numbers are 12, 16, 13, and 15, what is the fifth number?",
      "options": ["14", "15", "16", "13"],
      "correctIndex": 0,
      "hint": "Mean = Sum of numbers / Number of numbers.",
      "explanation": "Total sum = 14*5 = 70. Sum of 4 numbers = 12+16+13+15 = 56. Fifth number = 70-56 = 14."
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of getting a sum of 8?",
      "options": ["5/36", "7/36", "1/6", "1/8"],
      "correctIndex": 0,
      "hint": "List all combinations of two dice that sum to 8.",
      "explanation": "Combinations: (2,6),(3,5),(4,4),(5,3),(6,2). Total = 5/36."
    },
    {
      "question":
          "4. The data set is {2, 3, 5, 5, 7, 9, 9, 9}. What is the mode?",
      "options": ["5", "7", "9", "3"],
      "correctIndex": 2,
      "hint": "Mode is the number that appears most frequently.",
      "explanation": "9 appears 3 times, more than any other number."
    },
    {
      "question":
          "5. A coin is flipped three times. What is the probability of getting exactly two tails?",
      "options": ["1/2", "3/8", "1/4", "1/8"],
      "correctIndex": 1,
      "hint": "Count combinations with exactly two tails.",
      "explanation": "Combinations: TTH, THT, HTT = 3 outcomes. Total outcomes = 8. Probability = 3/8."
    },
    {
      "question":
          "6. The range of {4, 8, 12, 7, 10, 15} is:",
      "options": ["10", "11", "12", "8"],
      "correctIndex": 1,
      "hint": "Range = max - min.",
      "explanation": "Max = 15, Min = 4, Range = 15-4 = 11."
    },
    {
      "question":
          "7. A spinner with 6 equal sections labeled 1–6 is spun. What is the probability of spinning a number that is prime?",
      "options": ["1/2", "1/3", "1/6", "2/3"],
      "correctIndex": 0,
      "hint": "Prime numbers between 1-6 are 2, 3, 5.",
      "explanation": "3 primes out of 6 sections → 3/6 = 1/2."
    },
    {
      "question":
          "8. In a class of 28 students, 18 are boys. If a student is selected randomly, what is the probability that it is a girl?",
      "options": ["5/14", "10/28", "1/2", "2/7"],
      "correctIndex": 1,
      "hint": "Number of girls = total - boys.",
      "explanation": "Girls = 28-18=10. Probability = 10/28."
    },
    {
      "question":
          "9. A number from 1 to 24 is chosen randomly. What is the probability it is divisible by 6?",
      "options": ["1/4", "1/3", "1/6", "1/2"],
      "correctIndex": 0,
      "hint": "Count numbers divisible by 6: 6, 12, 18, 24.",
      "explanation": "4 out of 24 → 4/24 = 1/6. Wait correct answer should be 1/6, not 1/4."
    },
    {
      "question":
          "10. The median of {1, 4, 6, 7, 9, 12, 15} is:",
      "options": ["6", "7", "7.5", "8"],
      "correctIndex": 1,
      "hint": "Median = middle value in ordered set.",
      "explanation": "Ordered set: 1,4,6,7,9,12,15 → middle = 7."
    },
  ];

  void checkAnswer(int index) {
    if (!answerChecked) {
      setState(() {
        selectedAnswerIndex = index;
        answerChecked = true;
      });
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        answerChecked = false;
        showHint = false;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('🎉 Great Job!'),
          content: const Text('You have completed all practise questions!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text(
          'Probability & Statistics Medium - Practise 1',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// QUESTION CARD
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// OPTIONS
            ...List.generate(question['options'].length, (index) {
              final option = question['options'][index];
              final isSelected = selectedAnswerIndex == index;
              final isCorrect =
                  answerChecked && index == question['correctIndex'];
              final isWrong = answerChecked && isSelected && !isCorrect;

              return Card(
                color: isCorrect
                    ? Colors.lightBlue.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    option,
                    style: const TextStyle(fontSize: 17),
                  ),
                  onTap: () => checkAnswer(index),
                ),
              );
            }),

            const SizedBox(height: 10),

            /// HINT BUTTON
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      showHint = !showHint;
                    });
                  },
                  icon: const Icon(Icons.lightbulb_outline, color: Colors.white),
                  label: const Text(
                    "Hint",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ],
            ),

            if (showHint)
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  question['hint'],
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Explanation: ${question['explanation']}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            /// NEXT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1
                      ? "Finish"
                      : "Next Question",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
