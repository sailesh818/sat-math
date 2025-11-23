import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise6 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise6({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise6> createState() =>
      _ProbabilityStatisticsMediumPractise6State();
}

class _ProbabilityStatisticsMediumPractise6State
    extends State<ProbabilityStatisticsMediumPractise6> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 4 blue, and 3 green balls. Two balls are drawn without replacement. What is the probability that both balls are green?",
      "options": ["1/33", "1/22", "1/11", "1/6"],
      "correctIndex": 1,
      "hint": "Use combination: P(GG) = 3/12 * 2/11",
      "explanation": "Probability = 3/12 * 2/11 = 6/132 = 1/22"
    },
    {
      "question":
          "2. The mean of six numbers is 14. If five of the numbers are 12, 16, 15, 13, and 14, what is the sixth number?",
      "options": ["14", "13", "15", "16"],
      "correctIndex": 0,
      "hint": "Total sum = mean * 6 → subtract sum of 5 numbers",
      "explanation": "Total sum = 14*6=84, sum of 5 numbers=70, sixth number=84-70=14"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of rolling two odd numbers?",
      "options": ["1/4", "1/3", "1/2", "1/6"],
      "correctIndex": 0,
      "hint": "Two odd numbers: 3 odd numbers on a die → P = 3/6 * 3/6",
      "explanation": "Probability = 1/2 * 1/2 = 1/4"
    },
    {
      "question":
          "4. The data set is {2, 3, 3, 4, 5, 5, 5, 6, 7}. What is the mode?",
      "options": ["3", "5", "6", "7"],
      "correctIndex": 1,
      "hint": "Mode = most frequent number",
      "explanation": "5 appears 3 times, which is the highest frequency"
    },
    {
      "question":
          "5. A coin is flipped three times. What is the probability of getting at least one head?",
      "options": ["7/8", "3/4", "1/2", "5/8"],
      "correctIndex": 0,
      "hint": "Use complement rule: P(at least 1 head) = 1 - P(no heads)",
      "explanation": "P(no heads) = 1/8 → P(at least 1 head) = 1 - 1/8 = 7/8"
    },
    {
      "question":
          "6. The range of {6, 9, 12, 14, 18} is:",
      "options": ["12", "13", "14", "15"],
      "correctIndex": 0,
      "hint": "Range = max - min",
      "explanation": "Max=18, Min=6 → Range = 18-6=12"
    },
    {
      "question":
          "7. A spinner with numbers 1–9 is spun. What is the probability of spinning a number divisible by 3?",
      "options": ["1/3", "1/4", "1/2", "2/3"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 3: 3,6,9 → 3 out of 9",
      "explanation": "Probability = 3/9 = 1/3"
    },
    {
      "question":
          "8. In a class of 32 students, 18 are boys. If a student is selected randomly, what is the probability it is a girl?",
      "options": ["14/32", "7/16", "1/2", "9/16"],
      "correctIndex": 0,
      "hint": "Girls = total - boys",
      "explanation": "Girls = 32-18=14 → probability=14/32"
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 4?",
      "options": ["1/4", "1/3", "1/6", "1/5"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 4: 4,8,12,...36 → 9/36",
      "explanation": "Probability = 9/36 = 1/4"
    },
    {
      "question":
          "10. The median of {1, 2, 4, 5, 6, 7, 9} is:",
      "options": ["4", "4.5", "5", "5.5"],
      "correctIndex": 2,
      "hint": "Median = middle value of ordered set",
      "explanation": "Ordered set: 1,2,4,5,6,7,9 → median = 5"
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
          'Probability & Statistics Medium - Practise 6',
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
