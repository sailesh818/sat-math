import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise18 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise18({super.key});

  @override
  State<ProbabilityStatisticsHardPractise18> createState() =>
      _ProbabilityStatisticsHardPractise18State();
}

class _ProbabilityStatisticsHardPractise18State
    extends State<ProbabilityStatisticsHardPractise18> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 10 red, 6 blue, and 4 green marbles. Five marbles are drawn without replacement. What is the probability that two are red and one is green?",
      "options": ["120/380", "118/380", "115/380", "122/380"],
      "correctIndex": 0,
      "hint": "Use combinations: C(10,2)*C(4,1)*C(6,2)/C(20,5)",
      "explanation": "Favorable = 120, total = 380 → 120/380"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting exactly three 5s and exactly two 2s?",
      "options": ["150/7776", "155/7776", "145/7776", "160/7776"],
      "correctIndex": 0,
      "hint": "Use multinomial probability formula",
      "explanation": "P = 150/7776"
    },
    {
      "question":
          "3. In a class of 62 students, 28 are boys. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "correctIndex": 0,
      "hint": "Use combinations: C(34,2)*C(28,1)/C(62,3)",
      "explanation": "Favorable = 231, total = 19600 → 231/19600"
    },
    {
      "question":
          "4. The data set is {9, 10, 11, 12, 12, 13, 14, 15, 15, 16, 17, 18, 19}. What is the interquartile range (IQR)?",
      "options": ["6", "5", "7", "4"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1=12, Q3=18 → IQR=6"
    },
    {
      "question":
          "5. A coin is flipped fourteen times. What is the probability of getting exactly eleven heads?",
      "options": ["364/16384", "360/16384", "370/16384", "350/16384"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(14,11)/2^14",
      "explanation": "C(14,11)=364 → 364/16384"
    },
    {
      "question":
          "6. A spinner has numbers 1–72. What is the probability of spinning a number divisible by 6 or 8?",
      "options": ["27/72", "26/72", "28/72", "25/72"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 6 + divisible by 8 - divisible by 24",
      "explanation": "Favorable = 27 → 27/72"
    },
    {
      "question":
          "7. The mean of 22 numbers is 66. If 21 numbers are 65, 67, 66, 68, 66, 69, 64, 67, 66, 68, 65, 69, 64, 67, 66, 68, 65, 70, 64, 67, 66, what is the 22nd number?",
      "options": ["66", "67", "65", "68"],
      "correctIndex": 0,
      "hint": "Sum = mean*22, subtract sum of 21 numbers",
      "explanation": "Sum=66*22=1452, sum of 21=1386 → 22nd=66"
    },
    {
      "question":
          "8. A number from 1 to 220 is chosen randomly. What is the probability that it is divisible by 11 or 12?",
      "options": ["37/220", "36/220", "38/220", "35/220"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 11 + divisible by 12 - divisible by 132",
      "explanation": "Favorable = 37 → 37/220"
    },
    {
      "question":
          "9. The set of scores is {75, 77, 79, 81, 83, 85, 87, 89, 91, 93, 95, 97, 99, 101, 103}. What is the approximate standard deviation?",
      "options": ["9.8", "10.0", "9.5", "9.2"],
      "correctIndex": 0,
      "hint": "SD ≈ √(Σ(x-mean)^2/n)",
      "explanation": "SD ≈ 9.8"
    },
    {
      "question":
          "10. A die is rolled five times. What is the probability that exactly four rolls show prime numbers?",
      "options": ["16/243", "15/243", "17/243", "18/243"],
      "correctIndex": 0,
      "hint": "Use binomial formula: P(X=4) where p=3/6",
      "explanation": "P = 16/243"
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
          content: const Text(
              'You have finished all Probability & Statistics Hard Practice 18 questions!'),
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
          'Probability & Statistics - Hard 18',
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
