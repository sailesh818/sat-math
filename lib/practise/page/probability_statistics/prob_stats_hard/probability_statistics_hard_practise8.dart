import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise8 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise8({super.key});

  @override
  State<ProbabilityStatisticsHardPractise8> createState() =>
      _ProbabilityStatisticsHardPractise8State();
}

class _ProbabilityStatisticsHardPractise8State
    extends State<ProbabilityStatisticsHardPractise8> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 6 blue, and 7 green marbles. Four marbles are drawn without replacement. What is the probability that two are red and two are green?",
      "options": ["35/153", "30/153", "25/153", "40/153"],
      "answer": "35/153"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting exactly three 2s and two 5s?",
      "options": ["150/46656", "180/46656", "200/46656", "120/46656"],
      "answer": "150/46656"
    },
    {
      "question":
          "3. In a class of 60 students, 28 are boys. If three students are selected randomly without replacement, what is the probability that all three are girls?",
      "options": ["364/19600", "350/19600", "330/19600", "345/19600"],
      "answer": "364/19600"
    },
    {
      "question":
          "4. The data set is {6, 7, 8, 8, 9, 9, 10, 11, 11, 12, 13, 14}. What is the interquartile range (IQR)?",
      "options": ["5", "6", "4", "7"],
      "answer": "5"
    },
    {
      "question":
          "5. A coin is flipped ten times. What is the probability of getting exactly eight heads?",
      "options": ["45/512", "56/512", "70/512", "28/512"],
      "answer": "45/512"
    },
    {
      "question":
          "6. A spinner has numbers 1–40. What is the probability of spinning a number divisible by 4 or a prime number?",
      "options": ["27/40", "26/40", "25/40", "28/40"],
      "answer": "27/40"
    },
    {
      "question":
          "7. The mean of 16 numbers is 52. If 15 numbers are 50, 53, 51, 54, 52, 55, 49, 53, 52, 54, 51, 56, 48, 53, 52, what is the 16th number?",
      "options": ["52", "53", "51", "54"],
      "answer": "52"
    },
    {
      "question":
          "8. A number from 1 to 120 is chosen randomly. What is the probability that it is divisible by 3 or 7?",
      "options": ["60/120", "58/120", "62/120", "55/120"],
      "answer": "60/120"
    },
    {
      "question":
          "9. The set of scores is {64, 67, 69, 72, 75, 77, 80, 82, 85, 87, 90, 92, 95}. What is the approximate standard deviation?",
      "options": ["9.0", "8.5", "8.0", "9.5"],
      "answer": "9.0"
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that exactly two rolls show even numbers?",
      "options": ["27/64", "26/64", "25/64", "28/64"],
      "answer": "27/64"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 8"),
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
