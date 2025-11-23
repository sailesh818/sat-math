import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise5 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise5({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise5> createState() =>
      _ProbabilityStatisticsMediumPractise5State();
}

class _ProbabilityStatisticsMediumPractise5State
    extends State<ProbabilityStatisticsMediumPractise5> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 8 red, 6 blue, and 4 green balls. Two balls are drawn without replacement. What is the probability that one is red and one is green?",
      "options": ["16/153", "8/91", "1/5", "2/9"],
      "correctIndex": 0,
      "hint": "Use P(RG or GR) = P(RG) + P(GR).",
      "explanation":
          "P(RG) = 8/18 * 4/17 = 32/306, P(GR) = 4/18 * 8/17 = 32/306, Total = 64/306 = 16/153."
    },
    {
      "question":
          "2. The mean of six numbers is 18. If five numbers are 16, 20, 17, 19, and 18, what is the sixth number?",
      "options": ["18", "19", "17", "20"],
      "correctIndex": 0,
      "hint": "Total sum = mean * 6 → subtract sum of 5 numbers.",
      "explanation":
          "Total sum = 18*6=108, sum of 5 numbers=90, sixth number=108-90=18."
    },
    {
      "question":
          "3. A fair die is rolled three times. What is the probability of getting exactly two 6s?",
      "options": ["5/36", "1/6", "1/12", "1/9"],
      "correctIndex": 0,
      "hint": "Use combinations: C(3,2)*(1/6)^2*(5/6)^1",
      "explanation": "C(3,2)=3, probability = 3*(1/6)^2*(5/6)=15/216=5/72 ≈ 0.069."
    },
    {
      "question":
          "4. The data set is {2, 3, 4, 4, 5, 5, 5, 6}. What is the mode?",
      "options": ["4", "5", "6", "3"],
      "correctIndex": 1,
      "hint": "Mode = most frequent number",
      "explanation": "5 appears 3 times, which is the highest frequency."
    },
    {
      "question":
          "5. A coin is flipped five times. What is the probability of getting exactly three heads?",
      "options": ["5/16", "10/32", "5/32", "1/4"],
      "correctIndex": 1,
      "hint": "Use combinations: C(5,3)/2^5",
      "explanation": "C(5,3)=10, total outcomes=32 → probability=10/32."
    },
    {
      "question":
          "6. The range of {7, 9, 12, 15, 18, 20} is:",
      "options": ["13", "12", "15", "14"],
      "correctIndex": 0,
      "hint": "Range = max - min",
      "explanation": "Max=20, Min=7 → Range=20-7=13."
    },
    {
      "question":
          "7. A spinner with numbers 1–10 is spun. What is the probability of landing on a number divisible by 2 or 5?",
      "options": ["3/5", "1/2", "4/5", "2/5"],
      "correctIndex": 0,
      "hint": "Count numbers divisible by 2 or 5, divide by 10.",
      "explanation":
          "Numbers: 2,4,6,8,10 (divisible by 2) + 5,10 (divisible by 5, 10 counted once) = 6 numbers → 6/10=3/5."
    },
    {
      "question":
          "8. In a class of 45 students, 28 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["17/45", "7/15", "1/2", "2/5"],
      "correctIndex": 0,
      "hint": "Boys = total - girls",
      "explanation": "Boys = 45-28=17 → probability=17/45."
    },
    {
      "question":
          "9. A number from 1 to 48 is chosen randomly. What is the probability it is divisible by 8?",
      "options": ["1/6", "1/8", "1/5", "1/4"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 8: 8,16,24,32,40,48 → 6/48=1/8.",
      "explanation": "6/48=1/8."
    },
    {
      "question":
          "10. The median of {3, 5, 7, 9, 11, 13, 15} is:",
      "options": ["7", "8", "9", "9.5"],
      "correctIndex": 2,
      "hint": "Median = middle value",
      "explanation": "Ordered set: 3,5,7,9,11,13,15 → median = 9."
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
          'Probability & Statistics Medium - Practise 5',
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
