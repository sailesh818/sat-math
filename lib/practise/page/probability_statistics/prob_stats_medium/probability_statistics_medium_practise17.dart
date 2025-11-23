import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise17 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise17({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise17> createState() =>
      _ProbabilityStatisticsMediumPractise17State();
}

class _ProbabilityStatisticsMediumPractise17State
    extends State<ProbabilityStatisticsMediumPractise17> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 6 blue, and 4 green marbles. Two marbles are drawn without replacement. What is the probability that one is red and one is green?",
      "options": ["20/105", "1/5", "2/7", "1/4"],
      "correctIndex": 0,
      "hint": "Use the formula for probability without replacement: P(R&G) = (5*4)/ (15*14).",
      "explanation": "There are 5 red and 4 green marbles. Total ways = 15*14. So probability = 20/105."
    },
    {
      "question":
          "2. The mean of seven numbers is 18. If six numbers are 17, 18, 19, 16, 20, 18, what is the seventh number?",
      "options": ["17", "18", "19", "16"],
      "correctIndex": 1,
      "hint": "Mean = sum / count. Multiply mean by 7 to get total sum.",
      "explanation": "Sum = 18*7 = 126. Sum of six numbers = 108. Seventh number = 126-108=18."
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of rolling at least one 5?",
      "options": ["11/36", "5/12", "1/2", "25/36"],
      "correctIndex": 0,
      "hint": "P(at least one 5) = 1 - P(no 5).",
      "explanation": "P(no 5) = 5/6 * 5/6 = 25/36. So probability = 1-25/36=11/36."
    },
    {
      "question":
          "4. The data set is {2, 3, 3, 4, 5, 5, 6, 6, 6}. What is the mode?",
      "options": ["3", "5", "6", "4"],
      "correctIndex": 2,
      "hint": "Mode = most frequent number.",
      "explanation": "6 appears 3 times, which is more than any other number."
    },
    {
      "question":
          "5. A coin is flipped five times. What is the probability of getting exactly three heads?",
      "options": ["5/16", "10/32", "10/16", "1/2"],
      "correctIndex": 1,
      "hint": "Use combination formula: C(5,3)*(1/2)^5.",
      "explanation": "C(5,3)=10, probability = 10*(1/2)^5=10/32."
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
          'Probability & Statistics - Medium 17',
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
