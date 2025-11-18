import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise15 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise15({super.key});

  @override
  State<ProbabilityStatisticsHardPractise15> createState() =>
      _ProbabilityStatisticsHardPractise15State();
}

class _ProbabilityStatisticsHardPractise15State
    extends State<ProbabilityStatisticsHardPractise15> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 7 blue, and 8 green marbles. Four marbles are drawn without replacement. What is the probability that two are blue and one is red?",
      "options": ["70/380", "75/380", "65/380", "68/380"],
      "answer": "70/380"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting exactly three 2s and exactly one 5?",
      "options": ["90/7776", "85/7776", "80/7776", "95/7776"],
      "answer": "90/7776"
    },
    {
      "question":
          "3. In a class of 60 students, 25 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "answer": "231/19600"
    },
    {
      "question":
          "4. The data set is {8, 9, 10, 11, 11, 12, 13, 14, 15, 15, 16, 17}. What is the interquartile range (IQR)?",
      "options": ["6", "5", "4", "7"],
      "answer": "6"
    },
    {
      "question":
          "5. A coin is flipped ten times. What is the probability of getting exactly eight heads?",
      "options": ["45/1024", "50/1024", "48/1024", "40/1024"],
      "answer": "45/1024"
    },
    {
      "question":
          "6. A spinner has numbers 1–48. What is the probability of spinning a number divisible by 4 or 6?",
      "options": ["28/48", "26/48", "27/48", "25/48"],
      "answer": "28/48"
    },
    {
      "question":
          "7. The mean of 20 numbers is 64. If 19 numbers are 63, 65, 64, 66, 64, 67, 62, 65, 64, 66, 63, 68, 61, 65, 64, 66, 63, 69, 62, what is the 20th number?",
      "options": ["64", "65", "63", "66"],
      "answer": "64"
    },
    {
      "question":
          "8. A number from 1 to 200 is chosen randomly. What is the probability that it is divisible by 7 or 11?",
      "options": ["41/200", "42/200", "43/200", "40/200"],
      "answer": "41/200"
    },
    {
      "question":
          "9. The set of scores is {70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98}. What is the approximate standard deviation?",
      "options": ["9.5", "10.0", "9.0", "9.8"],
      "answer": "9.5"
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that exactly two rolls show even numbers?",
      "options": ["27/64", "28/64", "26/64", "25/64"],
      "answer": "27/64"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 15"),
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
