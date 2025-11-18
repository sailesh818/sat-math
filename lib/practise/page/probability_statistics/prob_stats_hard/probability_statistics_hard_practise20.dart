import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise20 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise20({super.key});

  @override
  State<ProbabilityStatisticsHardPractise20> createState() =>
      _ProbabilityStatisticsHardPractise20State();
}

class _ProbabilityStatisticsHardPractise20State
    extends State<ProbabilityStatisticsHardPractise20> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 15 red, 10 blue, and 5 green marbles. Five marbles are drawn without replacement. What is the probability that three are red and one is green?",
      "options": ["210/560", "208/560", "205/560", "212/560"],
      "answer": "210/560"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting exactly four 1s and one 2?",
      "options": ["150/7776", "145/7776", "155/7776", "160/7776"],
      "answer": "150/7776"
    },
    {
      "question":
          "3. In a class of 66 students, 32 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "answer": "231/19600"
    },
    {
      "question":
          "4. The data set is {11, 12, 13, 14, 14, 15, 16, 17, 17, 18, 19, 20, 21}. What is the interquartile range (IQR)?",
      "options": ["7", "6", "5", "8"],
      "answer": "7"
    },
    {
      "question":
          "5. A coin is flipped sixteen times. What is the probability of getting exactly thirteen heads?",
      "options": ["560/65536", "550/65536", "570/65536", "565/65536"],
      "answer": "560/65536"
    },
    {
      "question":
          "6. A spinner has numbers 1–96. What is the probability of spinning a number divisible by 6 or 8?",
      "options": ["37/96", "36/96", "38/96", "35/96"],
      "answer": "37/96"
    },
    {
      "question":
          "7. The mean of 24 numbers is 68. If 23 numbers are 67, 69, 68, 70, 68, 71, 66, 69, 68, 70, 67, 71, 66, 69, 68, 70, 67, 72, 66, 69, 68, 70, 67, what is the 24th number?",
      "options": ["68", "69", "67", "70"],
      "answer": "68"
    },
    {
      "question":
          "8. A number from 1 to 250 is chosen randomly. What is the probability that it is divisible by 9 or 10?",
      "options": ["52/250", "50/250", "53/250", "51/250"],
      "answer": "52/250"
    },
    {
      "question":
          "9. The set of scores is {80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100, 102, 104}. What is the approximate standard deviation?",
      "options": ["9.9", "10.0", "9.5", "9.2"],
      "answer": "9.9"
    },
    {
      "question":
          "10. A die is rolled six times. What is the probability that exactly three rolls show even numbers?",
      "options": ["80/243", "81/243", "78/243", "82/243"],
      "answer": "80/243"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 20"),
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
