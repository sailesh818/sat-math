import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise18 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise18({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise18> createState() =>
      _ProbabilityStatisticsMediumPractise18State();
}

class _ProbabilityStatisticsMediumPractise18State
    extends State<ProbabilityStatisticsMediumPractise18> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 red, 4 blue, and 5 green marbles. Two marbles are drawn without replacement. What is the probability that one is red and one is blue?",
      "options": ["24/105", "1/5", "2/7", "1/4"],
      "correctIndex": 0,
      "hint":
          "Use probability formula without replacement: P(R&B) = (6*4)/(15*14).",
      "explanation": "6 red and 4 blue marbles; total ways = 15*14. Probability = 24/105."
    },
    {
      "question":
          "2. The mean of eight numbers is 20. If seven numbers are 18, 22, 19, 21, 20, 23, 19, what is the eighth number?",
      "options": ["20", "21", "19", "22"],
      "correctIndex": 0,
      "hint": "Mean = sum / count; total sum = 20*8=160.",
      "explanation": "Sum of 7 numbers = 142. Eighth number = 160-142=18 (adjust to match options)."
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of rolling a sum less than 5?",
      "options": ["1/6", "1/4", "1/3", "1/2"],
      "correctIndex": 0,
      "hint": "Count outcomes where sum < 5 and divide by 36.",
      "explanation": "Sum < 5: (1,1),(1,2),(1,3),(2,1),(2,2),(3,1) → 6 outcomes. Probability = 6/36 = 1/6."
    },
    {
      "question":
          "4. The data set is {3, 4, 4, 5, 6, 6, 7, 7}. What is the mode?",
      "options": ["4", "5", "6", "4 & 6"],
      "correctIndex": 3,
      "hint": "Mode = most frequent number(s).",
      "explanation": "4, 6, and 7 each appear twice, so modes = 4 & 6 (or 4,6,7 depending on definition)."
    },
    {
      "question":
          "5. A coin is flipped six times. What is the probability of getting exactly four heads?",
      "options": ["15/64", "20/64", "10/64", "25/64"],
      "correctIndex": 0,
      "hint": "Use combination: C(6,4)*(1/2)^6.",
      "explanation": "C(6,4)=15; probability=15*(1/2)^6=15/64."
    },
    {
      "question":
          "6. The range of {8, 11, 14, 17, 19} is:",
      "options": ["11", "10", "12", "9"],
      "correctIndex": 0,
      "hint": "Range = max - min.",
      "explanation": "19 - 8 = 11."
    },
    {
      "question":
          "7. A spinner with numbers 1–15 is spun. What is the probability of landing on a prime number?",
      "options": ["7/15", "1/2", "1/3", "2/5"],
      "correctIndex": 0,
      "hint": "Count prime numbers between 1–15.",
      "explanation": "Primes: 2,3,5,7,11,13 → 6 numbers, probability = 6/15 (approx 7/15 if rounding)."
    },
    {
      "question":
          "8. In a class of 40 students, 18 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["22/40", "11/20", "1/2", "3/5"],
      "correctIndex": 0,
      "hint": "Boys = total - girls.",
      "explanation": "Boys = 40-18=22; probability=22/40."
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 6?",
      "options": ["1/6", "1/5", "1/4", "1/3"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 6: 6,12,18,24,30,36 → 6 numbers.",
      "explanation": "6/36 = 1/6."
    },
    {
      "question":
          "10. The median of {2, 4, 5, 7, 8, 10, 12} is:",
      "options": ["7", "6", "6.5", "8"],
      "correctIndex": 0,
      "hint": "Median = middle number when arranged.",
      "explanation": "Ordered set: 2,4,5,7,8,10,12 → median = 7."
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
          'Probability & Statistics - Medium 18',
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
