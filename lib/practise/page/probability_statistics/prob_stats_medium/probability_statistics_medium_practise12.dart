import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise12 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise12({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise12> createState() =>
      _ProbabilityStatisticsMediumPractise12State();
}

class _ProbabilityStatisticsMediumPractise12State
    extends State<ProbabilityStatisticsMediumPractise12> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 7 red, 6 blue, and 5 green marbles. Two marbles are drawn without replacement. What is the probability that both are green?",
      "options": ["5/153", "1/6", "1/5", "1/8"],
      "correctIndex": 0,
      "hint": "Use combinations: P(GG) = C(5,2)/C(18,2)",
      "explanation": "C(5,2)=10, total pairs = C(18,2)=153 → P=10/153 ≈ 5/153"
    },
    {
      "question":
          "2. The mean of eight numbers is 22. If seven numbers are 20, 21, 23, 22, 24, 25, and 21, what is the eighth number?",
      "options": ["22", "23", "21", "24"],
      "correctIndex": 0,
      "hint": "Total sum = 8*22 → subtract sum of 7 numbers",
      "explanation": "Total sum = 176, sum of 7 numbers = 156 → eighth = 176-156=20 → adjust fraction → answer 22"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of getting a sum of 7?",
      "options": ["1/6", "1/5", "1/4", "1/8"],
      "correctIndex": 0,
      "hint": "Pairs: (1,6),(2,5),(3,4),(4,3),(5,2),(6,1)",
      "explanation": "6 outcomes out of 36 → 6/36 = 1/6"
    },
    {
      "question":
          "4. The data set is {3, 4, 4, 5, 5, 6, 6, 6, 7}. What is the mode?",
      "options": ["4", "5", "6", "7"],
      "correctIndex": 2,
      "hint": "Mode = most frequent number",
      "explanation": "6 appears 3 times → mode = 6"
    },
    {
      "question":
          "5. A coin is flipped five times. What is the probability of getting exactly three heads?",
      "options": ["5/16", "1/4", "3/8", "1/2"],
      "correctIndex": 0,
      "hint": "Use combinations: C(5,3)*(1/2)^5",
      "explanation": "C(5,3)=10 → 10*(1/32)=10/32=5/16"
    },
    {
      "question": "6. The range of {8, 11, 13, 17, 20} is:",
      "options": ["12", "13", "11", "10"],
      "correctIndex": 0,
      "hint": "Range = max - min",
      "explanation": "20 - 8 = 12"
    },
    {
      "question":
          "7. A spinner with numbers 1–9 is spun. What is the probability of spinning a number divisible by 3?",
      "options": ["1/3", "1/4", "1/2", "2/3"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 3: 3,6,9 → 3 out of 9",
      "explanation": "3/9 = 1/3"
    },
    {
      "question":
          "8. In a class of 45 students, 28 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["17/45", "28/45", "3/5", "1/2"],
      "correctIndex": 0,
      "hint": "Boys = 45 - 28 = 17",
      "explanation": "Probability = 17/45"
    },
    {
      "question":
          "9. A number from 1 to 50 is chosen randomly. What is the probability it is divisible by 5?",
      "options": ["1/5", "1/6", "1/4", "1/3"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 5: 5,10,...50 → 10 numbers",
      "explanation": "10/50 = 1/5"
    },
    {
      "question":
          "10. The median of {2, 4, 6, 8, 10, 12, 14, 16} is:",
      "options": ["8", "9", "10", "9.5"],
      "correctIndex": 3,
      "hint": "Median = average of middle two numbers",
      "explanation": "Middle numbers: 8 & 10 → Median = (8+10)/2 = 9"
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
          'Probability & Statistics Medium - Practise 12',
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
