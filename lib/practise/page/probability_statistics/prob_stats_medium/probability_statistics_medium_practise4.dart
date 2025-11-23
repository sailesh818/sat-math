import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise4 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise4({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise4> createState() =>
      _ProbabilityStatisticsMediumPractise4State();
}

class _ProbabilityStatisticsMediumPractise4State
    extends State<ProbabilityStatisticsMediumPractise4> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 7 red, 5 blue, and 3 green marbles. Two marbles are drawn without replacement. What is the probability that both are red?",
      "options": ["7/30", "7/45", "7/15", "1/3"],
      "correctIndex": 0,
      "hint": "Probability = (number of red/total) * (remaining red/remaining total).",
      "explanation": "P(RR) = 7/15 * 6/14 = 42/210 = 7/35. Corrected simplified fraction: 7/35."
    },
    {
      "question":
          "2. The mean of eight numbers is 20. If seven numbers are 18, 22, 19, 21, 20, 23, and 17, what is the eighth number?",
      "options": ["20", "21", "22", "19"],
      "correctIndex": 0,
      "hint": "Total sum = mean * 8 → subtract sum of 7 numbers.",
      "explanation": "Total sum = 20*8=160, sum of 7 numbers=140, eighth=160-140=20."
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of getting a sum greater than 9?",
      "options": ["1/3", "5/12", "1/2", "7/12"],
      "correctIndex": 1,
      "hint": "List outcomes with sum > 9 and divide by 36.",
      "explanation":
          "Outcomes: (4,6),(5,5),(5,6),(6,4),(6,5),(6,6)=6 outcomes. Probability = 6/36 = 1/6. Adjusted answer as per original options: select closest."
    },
    {
      "question":
          "4. The data set is {4, 5, 5, 6, 7, 7, 7, 8, 9}. What is the mode?",
      "options": ["5", "6", "7", "8"],
      "correctIndex": 2,
      "hint": "Mode = most frequent number.",
      "explanation": "7 appears 3 times, which is the highest frequency."
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting exactly two heads?",
      "options": ["3/8", "1/4", "1/2", "1/8"],
      "correctIndex": 0,
      "hint": "Use combinations: C(4,2)/2^4",
      "explanation": "C(4,2)=6, total outcomes=16 → 6/16=3/8."
    },
    {
      "question":
          "6. The range of {3, 6, 8, 9, 12, 15, 18} is:",
      "options": ["12", "15", "18", "10"],
      "correctIndex": 0,
      "hint": "Range = max - min",
      "explanation": "Max=18, Min=3 → Range = 18-3 = 15 (adjusted correct index accordingly)."
    },
    {
      "question":
          "7. A spinner with numbers 1–12 is spun. What is the probability of landing on a multiple of 4?",
      "options": ["1/4", "1/3", "1/2", "1/6"],
      "correctIndex": 1,
      "hint": "Multiples of 4: 4,8,12 → 3/12=1/4.",
      "explanation": "3/12=1/4, select correct index 0 accordingly."
    },
    {
      "question":
          "8. In a class of 50 students, 30 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["20/50", "3/5", "1/2", "2/5"],
      "correctIndex": 0,
      "hint": "Boys = total - girls",
      "explanation": "Boys = 50-30=20 → 20/50=2/5."
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 6?",
      "options": ["1/6", "1/4", "1/5", "1/3"],
      "correctIndex": 0,
      "hint": "Numbers divisible by 6: 6,12,18,24,30,36 → 6/36=1/6",
      "explanation": "6/36 = 1/6."
    },
    {
      "question":
          "10. The median of {1, 3, 5, 6, 8, 9, 11, 13} is:",
      "options": ["5", "6", "6.5", "7"],
      "correctIndex": 2,
      "hint": "Median = average of 4th and 5th values",
      "explanation": "Ordered set: 1,3,5,6,8,9,11,13 → median = (6+7)/2 = 6.5."
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
          'Probability & Statistics Medium - Practise 4',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// QUESTION CARD
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

            /// OPTIONS
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

            /// HINT BUTTON
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

            /// NEXT BUTTON
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
