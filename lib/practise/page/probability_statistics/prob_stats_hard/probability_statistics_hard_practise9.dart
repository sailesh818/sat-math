import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise9 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise9({super.key});

  @override
  State<ProbabilityStatisticsHardPractise9> createState() =>
      _ProbabilityStatisticsHardPractise9State();
}

class _ProbabilityStatisticsHardPractise9State
    extends State<ProbabilityStatisticsHardPractise9> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 8 red, 7 blue, and 5 green marbles. Five marbles are drawn without replacement. What is the probability that three are red and one is blue?",
      "options": ["56/462", "50/462", "60/462", "45/462"],
      "answer": "56/462"
    },
    {
      "question":
          "2. A die is rolled five times. What is the probability of getting at least three 4s?",
      "options": ["91/7776", "100/7776", "105/7776", "85/7776"],
      "answer": "91/7776"
    },
    {
      "question":
          "3. In a class of 55 students, 22 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are boys?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "answer": "231/19600"
    },
    {
      "question":
          "4. The data set is {7, 8, 8, 9, 9, 10, 11, 12, 12, 13, 14, 15}. What is the interquartile range (IQR)?",
      "options": ["5", "6", "4", "7"],
      "answer": "5"
    },
    {
      "question":
          "5. A coin is flipped eleven times. What is the probability of getting exactly nine heads?",
      "options": ["55/2048", "66/2048", "77/2048", "45/2048"],
      "answer": "55/2048"
    },
    {
      "question":
          "6. A spinner has numbers 1–45. What is the probability of spinning a number divisible by 3 or 7?",
      "options": ["27/45", "26/45", "28/45", "25/45"],
      "answer": "27/45"
    },
    {
      "question":
          "7. The mean of 18 numbers is 60. If 17 numbers are 58, 61, 59, 62, 60, 63, 57, 61, 60, 62, 59, 64, 56, 61, 60, 62, 59, what is the 18th number?",
      "options": ["60", "61", "59", "62"],
      "answer": "60"
    },
    {
      "question":
          "8. A number from 1 to 150 is chosen randomly. What is the probability that it is divisible by 5 or 6?",
      "options": ["70/150", "68/150", "72/150", "66/150"],
      "answer": "70/150"
    },
    {
      "question":
          "9. The set of scores is {65, 68, 70, 73, 75, 78, 80, 83, 85, 88, 90, 93}. What is the approximate standard deviation?",
      "options": ["9.5", "9.0", "8.5", "10.0"],
      "answer": "9.0"
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that exactly two rolls show odd numbers?",
      "options": ["27/64", "26/64", "25/64", "28/64"],
      "answer": "27/64"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 9"),
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
