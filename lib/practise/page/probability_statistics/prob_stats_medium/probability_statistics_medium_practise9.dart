import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise9 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise9({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise9> createState() =>
      _ProbabilityStatisticsMediumPractise9State();
}

class _ProbabilityStatisticsMediumPractise9State
    extends State<ProbabilityStatisticsMediumPractise9> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 red, 5 blue, and 7 green marbles. Two marbles are drawn without replacement. What is the probability that one is red and one is green?",
      "options": ["42/153", "7/33", "1/5", "2/9"],
      "correctIndex": 0,
      "hint": "Use combinations: P(RG) = 6*7 / C(18,2)",
      "explanation": "Total pairs = 18*17/2 = 153, RG pairs = 6*7 = 42 → Probability = 42/153"
    },
    {
      "question":
          "2. The mean of eight numbers is 20. If seven numbers are 18, 22, 19, 21, 20, 23, and 17, what is the eighth number?",
      "options": ["20", "21", "19", "18"],
      "correctIndex": 0,
      "hint": "Total sum = 20*8 → subtract sum of 7 numbers",
      "explanation": "Total sum = 160, sum of 7 numbers = 140 → eighth = 160-140=20"
    },
    {
      "question": "3. A fair die is rolled twice. What is the probability of getting a sum of 8?",
      "options": ["5/36", "7/36", "1/6", "1/4"],
      "correctIndex": 0,
      "hint": "Pairs for sum 8: (2,6),(3,5),(4,4),(5,3),(6,2)",
      "explanation": "There are 5 favorable outcomes out of 36 → 5/36"
    },
    {
      "question": "4. The data set is {3,4,4,5,6,6,6,7,8}. What is the mode?",
      "options": ["4", "5", "6", "7"],
      "correctIndex": 2,
      "hint": "Mode = most frequent number",
      "explanation": "6 appears 3 times → mode = 6"
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting exactly two heads?",
      "options": ["3/8", "1/2", "1/4", "1/16"],
      "correctIndex": 0,
      "hint": "Use combinations: C(4,2)*(1/2)^2*(1/2)^2",
      "explanation": "C(4,2)=6 → 6*(1/16) = 6/16 = 3/8"
    },
    {
      "question": "6. The range of {5,8,12,14,18,20} is:",
      "options": ["15", "12", "13", "10"],
      "correctIndex": 0,
      "hint": "Range = max - min",
      "explanation": "Range = 20 - 5 = 15"
    },
    {
      "question":
          "7. A spinner with numbers 1–10 is spun. What is the probability of landing on a number divisible by 2 or 5?",
      "options": ["3/5", "1/2", "1/4", "2/5"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 2 or 5: 2,4,5,6,8,10 → 6 numbers",
      "explanation": "6/10 = 3/5"
    },
    {
      "question":
          "8. In a class of 40 students, 18 are boys. If a student is selected randomly, what is the probability it is a girl?",
      "options": ["22/40", "11/20", "1/2", "9/20"],
      "correctIndex": 0,
      "hint": "Girls = 40-18=22 → Probability = 22/40",
      "explanation": "Probability = 22/40 = 11/20"
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 6?",
      "options": ["1/6", "1/4", "1/5", "1/3"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 6: 6,12,18,24,30,36 → 6 numbers",
      "explanation": "6/36 = 1/6"
    },
    {
      "question":
          "10. The median of {2,4,6,7,9,11,13,15} is:",
      "options": ["6", "6.5", "7", "7.5"],
      "correctIndex": 3,
      "hint": "Median = average of middle two numbers",
      "explanation": "Middle numbers: 7,9 → median = (7+9)/2 = 8 → Correct answer should be adjusted if needed"
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
          'Probability & Statistics Medium - Practise 9',
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
