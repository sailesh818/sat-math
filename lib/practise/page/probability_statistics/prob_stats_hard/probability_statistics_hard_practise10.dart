import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise10 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise10({super.key});

  @override
  State<ProbabilityStatisticsHardPractise10> createState() =>
      _ProbabilityStatisticsHardPractise10State();
}

class _ProbabilityStatisticsHardPractise10State
    extends State<ProbabilityStatisticsHardPractise10> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 red, 5 blue, and 7 green marbles. Five marbles are drawn without replacement. What is the probability that three are green and one is blue?",
      "options": ["42/462", "45/462", "40/462", "35/462"],
      "answer": "42/462"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting exactly two 1s and exactly two 6s?",
      "options": ["150/46656", "180/46656", "200/46656", "120/46656"],
      "answer": "150/46656"
    },
    {
      "question":
          "3. In a class of 52 students, 24 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are boys?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "answer": "231/19600"
    },
    {
      "question":
          "4. The data set is {8, 9, 9, 10, 10, 11, 12, 13, 14, 15, 16, 17}. What is the interquartile range (IQR)?",
      "options": ["6", "5", "7", "4"],
      "answer": "6"
    },
    {
      "question":
          "5. A coin is flipped twelve times. What is the probability of getting exactly ten heads?",
      "options": ["66/4096", "78/4096", "85/4096", "60/4096"],
      "answer": "66/4096"
    },
    {
      "question":
          "6. A spinner has numbers 1–50. What is the probability of spinning a number divisible by 5 or 7?",
      "options": ["21/50", "22/50", "23/50", "20/50"],
      "answer": "21/50"
    },
    {
      "question":
          "7. The mean of 20 numbers is 65. If 19 numbers are 63, 66, 64, 67, 65, 68, 62, 66, 65, 67, 64, 69, 61, 66, 65, 67, 64, 70, 63, what is the 20th number?",
      "options": ["65", "66", "64", "67"],
      "answer": "65"
    },
    {
      "question":
          "8. A number from 1 to 200 is chosen randomly. What is the probability that it is divisible by 8 or 9?",
      "options": ["58/200", "60/200", "62/200", "56/200"],
      "answer": "58/200"
    },
    {
      "question":
          "9. The set of scores is {70, 72, 74, 77, 79, 82, 85, 87, 90, 92, 95, 97}. What is the approximate standard deviation?",
      "options": ["9.8", "9.5", "10.0", "9.2"],
      "answer": "9.5"
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that all rolls show even numbers?",
      "options": ["1/16", "1/8", "1/4", "1/32"],
      "answer": "1/16"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 10"),
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
