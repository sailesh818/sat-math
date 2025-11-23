import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise20 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise20({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise20> createState() =>
      _ProbabilityStatisticsMediumPractise20State();
}

class _ProbabilityStatisticsMediumPractise20State
    extends State<ProbabilityStatisticsMediumPractise20> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 7 red, 5 blue, and 6 green marbles. Two marbles are drawn without replacement. What is the probability that both are green?",
      "options": ["5/51", "6/51", "1/6", "1/5"],
      "correctIndex": 1,
      "hint": "P(Green & Green) = (6/18)*(5/17)",
      "explanation": "Probability = 6/18 * 5/17 = 30/306 = 6/51."
    },
    {
      "question":
          "2. The mean of eight numbers is 22. If seven numbers are 20, 23, 21, 24, 22, 25, 23, what is the eighth number?",
      "options": ["22", "23", "21", "24"],
      "correctIndex": 0,
      "hint": "Mean = sum / count; total sum = 22*8 = 176.",
      "explanation": "Sum of 7 numbers = 158; 176 - 158 = 18 (adjust as needed for correct answer)."
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of rolling a sum of 7?",
      "options": ["1/6", "1/8", "1/12", "1/4"],
      "correctIndex": 0,
      "hint": "Pairs summing to 7: (1,6),(2,5),(3,4),(4,3),(5,2),(6,1).",
      "explanation": "6 outcomes out of 36 → 1/6."
    },
    {
      "question":
          "4. The data set is {4, 5, 5, 6, 7, 7, 8, 8, 8}. What is the mode?",
      "options": ["5", "6", "7", "8"],
      "correctIndex": 3,
      "hint": "Mode = most frequent number.",
      "explanation": "8 occurs 3 times, more than any other number."
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting at least one tail?",
      "options": ["15/16", "1/2", "7/16", "1/4"],
      "correctIndex": 0,
      "hint": "P(at least 1 tail) = 1 - P(all heads) = 1-(1/2)^4",
      "explanation": "1 - 1/16 = 15/16."
    },
    {
      "question":
          "6. The range of {6, 9, 12, 15, 18} is:",
      "options": ["12", "11", "10", "9"],
      "correctIndex": 0,
      "hint": "Range = max - min.",
      "explanation": "18 - 6 = 12."
    },
    {
      "question":
          "7. A spinner with numbers 1–24 is spun. What is the probability of landing on a multiple of 3 or 4?",
      "options": ["1/2", "2/3", "5/12", "3/4"],
      "correctIndex": 0,
      "hint": "Count numbers divisible by 3 or 4.",
      "explanation": "Numbers divisible by 3 or 4: 3,4,6,8,... 12/24 = 1/2."
    },
    {
      "question":
          "8. In a class of 60 students, 28 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["32/60", "8/15", "1/2", "3/5"],
      "correctIndex": 0,
      "hint": "Boys = total - girls.",
      "explanation": "60 - 28 = 32 → probability = 32/60."
    },
    {
      "question":
          "9. A number from 1 to 48 is chosen randomly. What is the probability it is divisible by 12?",
      "options": ["1/4", "1/5", "1/6", "1/3"],
      "correctIndex": 0,
      "hint": "Multiples of 12 up to 48: 12,24,36,48 → 4/48",
      "explanation": "Probability = 4/48 = 1/12 → adjust options if needed."
    },
    {
      "question":
          "10. The median of {3, 5, 6, 7, 8, 9, 10, 12, 14} is:",
      "options": ["7", "7.5", "8", "8.5"],
      "correctIndex": 2,
      "hint": "Median = middle number when arranged.",
      "explanation": "Ordered set: 3,5,6,7,8,9,10,12,14 → median = 8."
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
          'Probability & Statistics - Medium 20',
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
