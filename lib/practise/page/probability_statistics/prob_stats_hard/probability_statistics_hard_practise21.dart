import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise21 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise21({super.key});

  @override
  State<ProbabilityStatisticsHardPractise21> createState() =>
      _ProbabilityStatisticsHardPractise21State();
}

class _ProbabilityStatisticsHardPractise21State
    extends State<ProbabilityStatisticsHardPractise21> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 20 red, 10 blue, and 10 green marbles. Six marbles are drawn without replacement. What is the probability that three are red and two are green?",
      "options": ["1140/5600", "1120/5600", "1100/5600", "1150/5600"],
      "correctIndex": 0,
      "hint": "Use combinations: C(20,3)*C(10,2)*C(10,1)/C(40,6)",
      "explanation": "Favorable = 1140, total = 5600 → 1140/5600"
    },
    {
      "question":
          "2. A die is rolled eight times. What is the probability of getting exactly three 2s and exactly two 5s?",
      "options": ["560/1679616", "570/1679616", "550/1679616", "580/1679616"],
      "correctIndex": 0,
      "hint": "Use multinomial probability formula",
      "explanation": "P = 560/1679616"
    },
    {
      "question":
          "3. In a class of 70 students, 35 are girls. If four students are selected randomly without replacement, what is the probability that exactly three are girls?",
      "options": ["595/91390", "600/91390", "590/91390", "605/91390"],
      "correctIndex": 0,
      "hint": "Use combinations: C(35,3)*C(35,1)/C(70,4)",
      "explanation": "Favorable = 595, total = 91390 → 595/91390"
    },
    {
      "question":
          "4. The data set is {12, 13, 14, 15, 15, 16, 17, 18, 18, 19, 20, 21, 22}. What is the interquartile range (IQR)?",
      "options": ["7", "6", "8", "5"],
      "correctIndex": 0,
      "hint": "IQR = Q3 - Q1",
      "explanation": "Q1=15, Q3=22 → IQR=7"
    },
    {
      "question":
          "5. A coin is flipped seventeen times. What is the probability of getting exactly fourteen heads?",
      "options": ["680/131072", "670/131072", "690/131072", "675/131072"],
      "correctIndex": 0,
      "hint": "Use binomial formula: C(17,14)/2^17",
      "explanation": "C(17,14)=680 → 680/131072"
    },
    {
      "question":
          "6. A spinner has numbers 1–108. What is the probability of spinning a number divisible by 9 or 12?",
      "options": ["36/108", "35/108", "37/108", "34/108"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 9 + divisible by 12 - divisible by 36",
      "explanation": "Favorable = 36 → 36/108"
    },
    {
      "question":
          "7. The mean of 25 numbers is 70. If 24 numbers are 69, 71, 70, 72, 70, 73, 68, 71, 70, 72, 69, 73, 68, 71, 70, 72, 69, 74, 68, 71, 70, 72, 69, 73, what is the 25th number?",
      "options": ["70", "71", "69", "72"],
      "correctIndex": 0,
      "hint": "Sum = mean*25, subtract sum of 24 numbers",
      "explanation": "Sum=70*25=1750, sum of 24=1680 → 25th=70"
    },
    {
      "question":
          "8. A number from 1 to 260 is chosen randomly. What is the probability that it is divisible by 11 or 13?",
      "options": ["44/260", "45/260", "43/260", "46/260"],
      "correctIndex": 0,
      "hint": "Use inclusion-exclusion: divisible by 11 + divisible by 13 - divisible by 143",
      "explanation": "Favorable = 44 → 44/260"
    },
    {
      "question":
          "9. The set of scores is {82, 84, 86, 88, 90, 92, 94, 96, 98, 100, 102, 104, 106, 108, 110}. What is the approximate standard deviation?",
      "options": ["10.0", "10.2", "9.8", "9.5"],
      "correctIndex": 0,
      "hint": "SD ≈ √(Σ(x-mean)^2/n)",
      "explanation": "SD ≈ 10.0"
    },
    {
      "question":
          "10. A die is rolled six times. What is the probability that exactly four rolls show numbers greater than 4?",
      "options": ["80/243", "81/243", "78/243", "82/243"],
      "correctIndex": 0,
      "hint": "Use binomial formula: P(X=4) where p=1/2",
      "explanation": "P = 80/243"
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
              'You have finished all Probability & Statistics Hard Practice 21 questions!'),
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
          'Probability & Statistics - Hard 21',
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
