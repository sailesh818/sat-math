import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise11 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise11({super.key});

  @override
  State<ProbabilityStatisticsHardPractise11> createState() =>
      _ProbabilityStatisticsHardPractise11State();
}

class _ProbabilityStatisticsHardPractise11State
    extends State<ProbabilityStatisticsHardPractise11> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 6 blue, and 9 green marbles. Four marbles are drawn without replacement. What is the probability that exactly two are green and one is red?",
      "options": ["45/210", "50/210", "40/210", "35/210"],
      "answer": "45/210"
    },
    {
      "question":
          "2. A die is rolled five times. What is the probability of getting exactly three 2s?",
      "options": ["80/7776", "75/7776", "85/7776", "90/7776"],
      "answer": "80/7776"
    },
    {
      "question":
          "3. In a class of 50 students, 22 are girls. If three students are selected randomly without replacement, what is the probability that all three are girls?",
      "options": ["364/19600", "350/19600", "345/19600", "360/19600"],
      "answer": "364/19600"
    },
    {
      "question":
          "4. The data set is {7, 8, 9, 9, 10, 11, 12, 12, 13, 14, 15, 16}. What is the interquartile range (IQR)?",
      "options": ["5", "6", "4", "7"],
      "answer": "5"
    },
    {
      "question":
          "5. A coin is flipped ten times. What is the probability of getting exactly seven heads?",
      "options": ["120/1024", "130/1024", "115/1024", "125/1024"],
      "answer": "120/1024"
    },
    {
      "question":
          "6. A spinner has numbers 1–48. What is the probability of spinning a number divisible by 4 or 6?",
      "options": ["28/48", "26/48", "27/48", "25/48"],
      "answer": "28/48"
    },
    {
      "question":
          "7. The mean of 14 numbers is 58. If 13 numbers are 57, 59, 56, 60, 58, 61, 55, 59, 58, 60, 56, 62, 57, what is the 14th number?",
      "options": ["58", "59", "57", "60"],
      "answer": "58"
    },
    {
      "question":
          "8. A number from 1 to 180 is chosen randomly. What is the probability that it is divisible by 5 or 9?",
      "options": ["68/180", "66/180", "70/180", "65/180"],
      "answer": "68/180"
    },
    {
      "question":
          "9. The set of scores is {66, 68, 70, 72, 75, 77, 80, 82, 85, 87, 90, 92, 95}. What is the approximate standard deviation?",
      "options": ["9.2", "9.5", "9.0", "8.8"],
      "answer": "9.2"
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that exactly one roll shows an even number?",
      "options": ["81/256", "80/256", "79/256", "82/256"],
      "answer": "81/256"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 11"),
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
