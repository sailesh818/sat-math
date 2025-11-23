import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise11 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise11({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise11> createState() =>
      _ProbabilityStatisticsMediumPractise11State();
}

class _ProbabilityStatisticsMediumPractise11State
    extends State<ProbabilityStatisticsMediumPractise11> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 3 red, 5 blue, and 6 green marbles. Two marbles are drawn without replacement. What is the probability that one is blue and one is green?",
      "options": ["30/136", "15/34", "1/4", "3/10"],
      "correctIndex": 0,
      "hint": "Use combinations: P(BG) = 5*6 / C(14,2)",
      "explanation": "Total pairs = 14*13/2 = 91, BG pairs = 5*6=30 → Probability = 30/91"
    },
    {
      "question":
          "2. The mean of six numbers is 18. If five numbers are 16, 17, 19, 20, and 18, what is the sixth number?",
      "options": ["20", "18", "19", "17"],
      "correctIndex": 1,
      "hint": "Total sum = mean*6 → subtract sum of 5 numbers",
      "explanation": "Total sum = 108, sum of 5 numbers = 90 → sixth = 108-90=18"
    },
    {
      "question":
          "3. A fair die is rolled three times. What is the probability of rolling at least one 6?",
      "options": ["91/216", "125/216", "5/36", "1/2"],
      "correctIndex": 0,
      "hint": "P(at least one 6) = 1 - P(no 6s)",
      "explanation": "P(no 6) = (5/6)^3 = 125/216 → P(at least one 6) = 1 - 125/216 = 91/216"
    },
    {
      "question": "4. The data set is {2,3,3,4,5,5,5,6}. What is the mode?",
      "options": ["3", "4", "5", "6"],
      "correctIndex": 2,
      "hint": "Mode = most frequent number",
      "explanation": "5 appears 3 times → mode = 5"
    },
    {
      "question":
          "5. A coin is flipped three times. What is the probability of getting exactly two tails?",
      "options": ["3/8", "1/2", "1/4", "1/8"],
      "correctIndex": 0,
      "hint": "Use combinations: C(3,2)*(1/2)^3",
      "explanation": "C(3,2)=3 → 3*(1/8)=3/8"
    },
    {
      "question": "6. The range of {6,9,11,14,17} is:",
      "options": ["11", "12", "10", "9"],
      "correctIndex": 0,
      "hint": "Range = max - min",
      "explanation": "Range = 17 - 6 = 11"
    },
    {
      "question":
          "7. A spinner with numbers 1–10 is spun. What is the probability of landing on an even number?",
      "options": ["1/2", "3/5", "2/5", "1/3"],
      "correctIndex": 0,
      "hint": "Even numbers: 2,4,6,8,10 → 5/10",
      "explanation": "Probability = 5/10 = 1/2"
    },
    {
      "question":
          "8. In a class of 50 students, 22 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["28/50", "14/25", "1/2", "3/5"],
      "correctIndex": 0,
      "hint": "Boys = 50-22=28 → Probability = 28/50",
      "explanation": "28/50 = 14/25"
    },
    {
      "question":
          "9. A number from 1 to 60 is chosen randomly. What is the probability it is divisible by 5?",
      "options": ["1/5", "1/6", "1/4", "1/3"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 5: 5,10,...,60 → 12 numbers",
      "explanation": "Probability = 12/60 = 1/5"
    },
    {
      "question":
          "10. The median of {1,4,5,7,8,10,12} is:",
      "options": ["5", "6", "7", "7.5"],
      "correctIndex": 2,
      "hint": "Median = middle value of ordered set",
      "explanation": "Middle value = 7"
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
          'Probability & Statistics Medium - Practise 11',
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
