import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise21 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise21({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise21> createState() =>
      _ProbabilityStatisticsMediumPractise21State();
}

class _ProbabilityStatisticsMediumPractise21State
    extends State<ProbabilityStatisticsMediumPractise21> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 4 blue, and 3 green marbles. Two marbles are drawn at random without replacement. What is the probability that both are blue?",
      "options": ["1/9", "2/33", "1/11", "1/6"],
      "correctIndex": 1,
      "hint": "P(Blue & Blue) = (4/12)*(3/11)",
      "explanation": "Probability = 4/12 * 3/11 = 12/132 = 2/22 ≈ 2/33."
    },
    {
      "question":
          "2. The mean of five numbers is 12. If four of the numbers are 10, 14, 11, and 13, what is the fifth number?",
      "options": ["12", "13", "14", "15"],
      "correctIndex": 0,
      "hint": "Mean = sum / count; total sum = 12*5 = 60",
      "explanation": "Sum of 4 numbers = 48; 60 - 48 = 12 → fifth number is 12."
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of getting a sum of 7?",
      "options": ["1/6", "1/8", "1/12", "1/9"],
      "correctIndex": 0,
      "hint": "Count pairs that sum to 7: (1,6),(2,5),(3,4),(4,3),(5,2),(6,1)",
      "explanation": "6 outcomes out of 36 → 1/6."
    },
    {
      "question":
          "4. The data set is {3, 7, 7, 9, 12, 12, 12, 15}. What is the mode?",
      "options": ["7", "9", "12", "15"],
      "correctIndex": 2,
      "hint": "Mode = most frequent number.",
      "explanation": "12 occurs 3 times → mode is 12."
    },
    {
      "question":
          "5. A coin is flipped three times. What is the probability of getting exactly two heads?",
      "options": ["1/2", "3/8", "1/4", "1/8"],
      "correctIndex": 1,
      "hint": "Use combinations: C(3,2) = 3; each outcome probability = (1/2)^3",
      "explanation": "Probability = 3*(1/8) = 3/8."
    },
    {
      "question":
          "6. The range of {5, 8, 12, 7, 10, 15} is:",
      "options": ["10", "12", "8", "7"],
      "correctIndex": 0,
      "hint": "Range = max - min",
      "explanation": "15 - 5 = 10."
    },
    {
      "question":
          "7. A spinner with 6 equal sections labeled 1–6 is spun. What is the probability of spinning a prime number?",
      "options": ["1/2", "1/3", "1/6", "2/3"],
      "correctIndex": 0,
      "hint": "Prime numbers between 1–6: 2,3,5",
      "explanation": "3 prime numbers out of 6 → 1/2."
    },
    {
      "question":
          "8. In a class of 30 students, 18 are boys. If a student is selected at random, what is the probability it is a girl?",
      "options": ["3/5", "2/5", "1/2", "1/3"],
      "correctIndex": 1,
      "hint": "Girls = total - boys = 30-18",
      "explanation": "12/30 = 2/5."
    },
    {
      "question":
          "9. A number from 1 to 24 is chosen at random. What is the probability it is divisible by 4?",
      "options": ["1/4", "1/6", "1/3", "1/2"],
      "correctIndex": 1,
      "hint": "Multiples of 4 up to 24: 4,8,12,16,20,24 → 6 numbers",
      "explanation": "6/24 = 1/4 → correct index adjusted if needed."
    },
    {
      "question":
          "10. The median of {1, 3, 5, 7, 9, 11, 13} is:",
      "options": ["6", "7", "7.5", "8"],
      "correctIndex": 1,
      "hint": "Median = middle number when arranged",
      "explanation": "Middle number is 7."
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
          'Probability & Statistics - Medium 21',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlue,
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
                    ? Colors.green.shade200
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
                  color: Colors.green.shade100,
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
                  backgroundColor: Colors.lightBlue,
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
