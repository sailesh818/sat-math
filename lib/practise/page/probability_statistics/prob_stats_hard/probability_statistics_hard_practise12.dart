import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise12 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise12({super.key});

  @override
  State<ProbabilityStatisticsHardPractise12> createState() =>
      _ProbabilityStatisticsHardPractise12State();
}

class _ProbabilityStatisticsHardPractise12State
    extends State<ProbabilityStatisticsHardPractise12> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 red, 5 blue, and 7 green marbles. Five marbles are drawn without replacement. What is the probability that exactly two are blue and two are green?",
      "options": ["35/210", "40/210", "45/210", "50/210"],
      "answer": "35/210"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting at least four 5s?",
      "options": ["31/7776", "30/7776", "28/7776", "35/7776"],
      "answer": "31/7776"
    },
    {
      "question":
          "3. In a class of 60 students, 28 are boys. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "answer": "231/19600"
    },
    {
      "question":
          "4. The data set is {6, 7, 8, 8, 9, 10, 11, 12, 12, 13, 14, 15}. What is the interquartile range (IQR)?",
      "options": ["5", "6", "4", "7"],
      "answer": "5"
    },
    {
      "question":
          "5. A coin is flipped eleven times. What is the probability of getting exactly eight heads?",
      "options": ["165/2048", "155/2048", "160/2048", "170/2048"],
      "answer": "165/2048"
    },
    {
      "question":
          "6. A spinner has numbers 1–36. What is the probability of spinning a number divisible by 3 or 4?",
      "options": ["24/36", "22/36", "23/36", "25/36"],
      "answer": "24/36"
    },
    {
      "question":
          "7. The mean of 16 numbers is 62. If 15 numbers are 61, 63, 60, 64, 62, 65, 59, 63, 62, 64, 60, 66, 58, 63, 62, what is the 16th number?",
      "options": ["62", "63", "61", "64"],
      "answer": "62"
    },
    {
      "question":
          "8. A number from 1 to 150 is chosen randomly. What is the probability that it is divisible by 7 or 10?",
      "options": ["43/150", "45/150", "41/150", "40/150"],
      "answer": "43/150"
    },
    {
      "question":
          "9. The set of scores is {65, 68, 70, 73, 75, 78, 80, 83, 85, 88, 90, 93, 95}. What is the approximate standard deviation?",
      "options": ["9.0", "9.5", "8.5", "10.0"],
      "answer": "9.5"
    },
    {
      "question":
          "10. A die is rolled five times. What is the probability that exactly three rolls show odd numbers?",
      "options": ["80/243", "75/243", "85/243", "90/243"],
      "answer": "80/243"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 12"),
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
