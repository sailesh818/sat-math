import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise6 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise6({super.key});

  @override
  State<ProbabilityStatisticsHardPractise6> createState() =>
      _ProbabilityStatisticsHardPractise6State();
}

class _ProbabilityStatisticsHardPractise6State
    extends State<ProbabilityStatisticsHardPractise6> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 4 red, 5 blue, and 6 green marbles. Three marbles are drawn without replacement. What is the probability that all three are different colors?",
      "options": ["30/91", "35/91", "40/91", "25/91"],
      "answer": "30/91"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting exactly two 1s and exactly two 6s?",
      "options": ["150/46656", "180/46656", "200/46656", "120/46656"],
      "answer": "150/46656"
    },
    {
      "question":
          "3. In a class of 50 students, 28 are boys. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "answer": "231/19600"
    },
    {
      "question":
          "4. The data set is {6, 7, 7, 8, 8, 9, 10, 10, 11, 12, 13}. What is the interquartile range (IQR)?",
      "options": ["4", "5", "3", "6"],
      "answer": "4"
    },
    {
      "question":
          "5. A coin is flipped ten times. What is the probability of getting at least eight heads?",
      "options": ["11/512", "45/512", "55/512", "20/512"],
      "answer": "55/512"
    },
    {
      "question":
          "6. A spinner has numbers 1–36. What is the probability of landing on a number divisible by 3 or a prime number?",
      "options": ["23/36", "22/36", "21/36", "20/36"],
      "answer": "23/36"
    },
    {
      "question":
          "7. The mean of 12 numbers is 48. If eleven numbers are 46, 49, 47, 50, 48, 51, 45, 49, 48, 50, 47, what is the twelfth number?",
      "options": ["48", "49", "47", "50"],
      "answer": "48"
    },
    {
      "question":
          "8. A number from 1 to 100 is chosen randomly. What is the probability that it is divisible by 4 or 5?",
      "options": ["45/100", "44/100", "46/100", "42/100"],
      "answer": "45/100"
    },
    {
      "question":
          "9. The set of scores is {60, 63, 65, 68, 70, 73, 75, 78, 80, 83, 85, 88}. What is the approximate standard deviation?",
      "options": ["8.3", "8.5", "9.0", "7.8"],
      "answer": "8.3"
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that all rolls show different numbers?",
      "options": ["5/9", "1/3", "1/2", "2/3"],
      "answer": "5/9"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 6"),
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
