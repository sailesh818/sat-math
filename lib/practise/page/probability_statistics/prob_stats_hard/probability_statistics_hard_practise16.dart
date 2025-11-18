import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise16 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise16({super.key});

  @override
  State<ProbabilityStatisticsHardPractise16> createState() =>
      _ProbabilityStatisticsHardPractise16State();
}

class _ProbabilityStatisticsHardPractise16State
    extends State<ProbabilityStatisticsHardPractise16> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 red, 8 blue, and 6 green marbles. Four marbles are drawn without replacement. What is the probability that two are green and one is red?",
      "options": ["48/210", "50/210", "46/210", "45/210"],
      "answer": "48/210"
    },
    {
      "question":
          "2. A die is rolled five times. What is the probability of getting exactly three 4s?",
      "options": ["80/7776", "85/7776", "75/7776", "90/7776"],
      "answer": "80/7776"
    },
    {
      "question":
          "3. In a class of 50 students, 22 are boys. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "answer": "231/19600"
    },
    {
      "question":
          "4. The data set is {7, 8, 9, 9, 10, 11, 12, 12, 13, 14, 15}. What is the interquartile range (IQR)?",
      "options": ["5", "6", "4", "7"],
      "answer": "5"
    },
    {
      "question":
          "5. A coin is flipped eleven times. What is the probability of getting exactly eight heads?",
      "options": ["165/2048", "160/2048", "170/2048", "155/2048"],
      "answer": "165/2048"
    },
    {
      "question":
          "6. A spinner has numbers 1–36. What is the probability of spinning a number divisible by 3 or 4?",
      "options": ["24/36", "23/36", "25/36", "22/36"],
      "answer": "24/36"
    },
    {
      "question":
          "7. The mean of 17 numbers is 62. If 16 numbers are 61, 63, 60, 64, 62, 65, 59, 63, 62, 64, 60, 66, 58, 63, 62, 61, what is the 17th number?",
      "options": ["62", "63", "61", "64"],
      "answer": "62"
    },
    {
      "question":
          "8. A number from 1 to 150 is chosen randomly. What is the probability that it is divisible by 5 or 9?",
      "options": ["68/150", "66/150", "70/150", "65/150"],
      "answer": "68/150"
    },
    {
      "question":
          "9. The set of scores is {66, 68, 70, 72, 75, 77, 80, 82, 85, 87, 90, 92, 95}. What is the approximate standard deviation?",
      "options": ["9.2", "9.0", "9.5", "8.8"],
      "answer": "9.2"
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that exactly one roll shows an even number?",
      "options": ["81/256", "80/256", "82/256", "79/256"],
      "answer": "81/256"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 16"),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    questions[index]["question"],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...questions[index]["options"].map<Widget>((option) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(option),
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
