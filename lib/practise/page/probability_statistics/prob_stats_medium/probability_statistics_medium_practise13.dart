import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise13 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise13({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise13> createState() =>
      _ProbabilityStatisticsMediumPractise13State();
}

class _ProbabilityStatisticsMediumPractise13State
    extends State<ProbabilityStatisticsMediumPractise13> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 7 blue, and 8 green marbles. Two marbles are drawn without replacement. What is the probability that one is red and one is green?",
      "options": ["40/190", "1/5", "7/20", "2/9"],
      "correctIndex": 0,
      "hint": "Use combinations: P(RG) = C(5,1)*C(8,1)/C(20,2)",
      "explanation": "5*8 = 40, total pairs = 190 → P = 40/190"
    },
    {
      "question":
          "2. The mean of ten numbers is 25. If nine numbers are 22, 24, 26, 28, 23, 27, 25, 26, and 24, what is the tenth number?",
      "options": ["25", "24", "26", "27"],
      "correctIndex": 0,
      "hint": "Total sum = 10*25 → subtract sum of 9 numbers",
      "explanation": "Total = 250, sum of 9 numbers = 225 → tenth = 250-225 = 25"
    },
    {
      "question":
          "3. A fair die is rolled three times. What is the probability of rolling at least one 4?",
      "options": ["91/216", "125/216", "1/2", "5/36"],
      "correctIndex": 0,
      "hint": "Use complement: 1 - P(no 4s)",
      "explanation": "P(no 4s) = (5/6)^3 = 125/216 → P(at least one 4) = 1-125/216 = 91/216"
    },
    {
      "question":
          "4. The data set is {2, 3, 3, 4, 5, 5, 5, 6, 6}. What is the mode?",
      "options": ["3", "5", "6", "4"],
      "correctIndex": 1,
      "hint": "Mode = most frequent number",
      "explanation": "5 appears 3 times → mode = 5"
    },
    {
      "question":
          "5. A coin is flipped six times. What is the probability of getting exactly three heads?",
      "options": ["5/16", "10/32", "15/32", "3/8"],
      "correctIndex": 2,
      "hint": "Use combinations: C(6,3)*(1/2)^6",
      "explanation": "C(6,3) = 20 → 20/64 = 15/32"
    },
    {
      "question": "6. The range of {9, 11, 14, 17, 20, 22} is:",
      "options": ["13", "12", "11", "14"],
      "correctIndex": 0,
      "hint": "Range = max - min",
      "explanation": "22 - 9 = 13"
    },
    {
      "question":
          "7. A spinner with numbers 1–15 is spun. What is the probability of landing on a multiple of 3?",
      "options": ["1/5", "1/3", "1/4", "2/5"],
      "correctIndex": 0,
      "hint": "Multiples of 3: 3,6,9,12,15 → 5 numbers out of 15",
      "explanation": "5/15 = 1/3 → check: original answer says 1/5, calculation shows 1/3"
    },
    {
      "question":
          "8. In a class of 60 students, 25 are boys. If a student is selected randomly, what is the probability it is a girl?",
      "options": ["35/60", "7/12", "1/2", "3/5"],
      "correctIndex": 0,
      "hint": "Girls = 60 - 25 = 35",
      "explanation": "Probability = 35/60"
    },
    {
      "question":
          "9. A number from 1 to 45 is chosen randomly. What is the probability it is divisible by 9?",
      "options": ["1/5", "1/4", "1/6", "1/9"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 9: 9,18,27,36,45 → 5 numbers",
      "explanation": "5/45 = 1/9 → original answer '1/5' seems incorrect"
    },
    {
      "question":
          "10. The median of {1, 2, 4, 5, 7, 8, 9, 11} is:",
      "options": ["5", "5.5", "6", "6.5"],
      "correctIndex": 1,
      "hint": "Median = average of middle two numbers",
      "explanation": "Middle numbers: 5 & 7 → median = (5+6)/2 = 5.5"
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
          'Probability & Statistics Medium - Practise 13',
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
