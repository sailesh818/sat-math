import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise13 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise13({super.key});

  @override
  State<ProbabilityStatisticsHardPractise13> createState() =>
      _ProbabilityStatisticsHardPractise13State();
}

class _ProbabilityStatisticsHardPractise13State
    extends State<ProbabilityStatisticsHardPractise13> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 7 red, 6 blue, and 5 green marbles. Four marbles are drawn without replacement. What is the probability that two are red and one is blue?",
      "options": ["42/210", "45/210", "40/210", "48/210"],
      "answer": "42/210"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting exactly four 3s?",
      "options": ["75/7776", "80/7776", "70/7776", "85/7776"],
      "answer": "75/7776"
    },
    {
      "question":
          "3. In a class of 54 students, 20 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are boys?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "answer": "231/19600"
    },
    {
      "question":
          "4. The data set is {8, 9, 10, 10, 11, 12, 13, 13, 14, 15, 16, 17}. What is the interquartile range (IQR)?",
      "options": ["5", "6", "4", "7"],
      "answer": "5"
    },
    {
      "question":
          "5. A coin is flipped twelve times. What is the probability of getting exactly nine heads?",
      "options": ["220/4096", "210/4096", "230/4096", "200/4096"],
      "answer": "220/4096"
    },
    {
      "question":
          "6. A spinner has numbers 1–42. What is the probability of spinning a number divisible by 3 or 5?",
      "options": ["23/42", "22/42", "24/42", "21/42"],
      "answer": "23/42"
    },
    {
      "question":
          "7. The mean of 15 numbers is 61. If 14 numbers are 60, 62, 61, 63, 61, 64, 59, 62, 61, 63, 60, 65, 58, 62, what is the 15th number?",
      "options": ["61", "62", "60", "63"],
      "answer": "61"
    },
    {
      "question":
          "8. A number from 1 to 180 is chosen randomly. What is the probability that it is divisible by 6 or 8?",
      "options": ["65/180", "66/180", "64/180", "68/180"],
      "answer": "65/180"
    },
    {
      "question":
          "9. The set of scores is {68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90}. What is the approximate standard deviation?",
      "options": ["7.5", "8.0", "8.5", "7.0"],
      "answer": "7.5"
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that exactly two rolls show prime numbers?",
      "options": ["9/16", "8/16", "10/16", "7/16"],
      "answer": "9/16"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 13"),
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
