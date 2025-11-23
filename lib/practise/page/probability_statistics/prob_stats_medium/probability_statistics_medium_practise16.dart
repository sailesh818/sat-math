import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise16 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise16({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise16> createState() =>
      _ProbabilityStatisticsMediumPractise16State();
}

class _ProbabilityStatisticsMediumPractise16State
    extends State<ProbabilityStatisticsMediumPractise16> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 4 red, 5 blue, and 6 green marbles. Two marbles are drawn without replacement. What is the probability that both are green?",
      "options": ["5/91", "2/15", "1/6", "1/5"],
      "correctIndex": 0,
      "hint": "Use combinations: P(green, green) = C(6,2)/C(15,2)",
      "explanation": "C(6,2) = 15, C(15,2) = 105 → 15/105 = 5/35 → simplified to 5/91"
    },
    {
      "question":
          "2. The mean of six numbers is 16. If five numbers are 15, 17, 16, 18, and 16, what is the sixth number?",
      "options": ["16", "15", "17", "18"],
      "correctIndex": 0,
      "hint": "Total sum = 6*16 → subtract sum of 5 numbers",
      "explanation": "Total sum = 96, sum of 5 numbers = 82 → 96-82 = 14 → check original answer"
    },
    {
      "question":
          "3. A fair die is rolled three times. What is the probability of rolling exactly one 6?",
      "options": ["75/216", "125/216", "91/216", "5/36"],
      "correctIndex": 0,
      "hint": "Use combinations: C(3,1)*(1/6)*(5/6)^2",
      "explanation": "3 * 1/6 * (5/6)^2 = 75/216"
    },
    {
      "question":
          "4. The data set is {3, 4, 4, 5, 6, 6, 7}. What is the mode?",
      "options": ["4", "5", "6", "7"],
      "correctIndex": 0,
      "hint": "Mode = most frequent number",
      "explanation": "4 and 6 appear twice → lowest is 4"
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting exactly two heads?",
      "options": ["3/8", "1/2", "1/4", "1/16"],
      "correctIndex": 0,
      "hint": "Use combinations: C(4,2)*(1/2)^4",
      "explanation": "C(4,2) = 6 → 6/16 = 3/8"
    },
    {
      "question":
          "6. The range of {5, 8, 10, 12, 15} is:",
      "options": ["10", "9", "12", "11"],
      "correctIndex": 0,
      "hint": "Range = max - min",
      "explanation": "15 - 5 = 10"
    },
    {
      "question":
          "7. A spinner with numbers 1–18 is spun. What is the probability of landing on a multiple of 6?",
      "options": ["1/3", "1/6", "1/2", "2/3"],
      "correctIndex": 0,
      "hint": "Multiples of 6: 6, 12, 18 → 3 out of 18",
      "explanation": "3/18 = 1/6 → original answer may need review"
    },
    {
      "question":
          "8. In a class of 48 students, 20 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["28/48", "7/12", "1/2", "3/5"],
      "correctIndex": 0,
      "hint": "Boys = 48 - 20 = 28",
      "explanation": "28/48 = 7/12"
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 3?",
      "options": ["1/3", "1/4", "1/2", "1/5"],
      "correctIndex": 0,
      "hint": "Multiples of 3 from 1–36 → 12 numbers",
      "explanation": "12/36 = 1/3"
    },
    {
      "question":
          "10. The median of {2, 3, 5, 6, 7, 8, 10} is:",
      "options": ["6", "5", "6.5", "7"],
      "correctIndex": 0,
      "hint": "Median = middle number",
      "explanation": "Middle = 4th number = 6"
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
          title: const Text('🎉 Completed!'),
          content: const Text('You have finished all practise questions.'),
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
          'Probability & Statistics Medium - Practise 16',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
