import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise7 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise7({super.key});

  @override
  State<ProbabilityStatisticsHardPractise7> createState() =>
      _ProbabilityStatisticsHardPractise7State();
}

class _ProbabilityStatisticsHardPractise7State
    extends State<ProbabilityStatisticsHardPractise7> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A box contains 7 red, 5 blue, and 6 green marbles. Four marbles are drawn without replacement. What is the probability that exactly two are red and one is green?",
      "options": ["35/153", "30/153", "25/153", "40/153"],
      "answer": "35/153"
    },
    {
      "question":
          "2. A die is rolled five times. What is the probability of getting at least four 3s?",
      "options": ["11/7776", "16/7776", "31/7776", "41/7776"],
      "answer": "31/7776"
    },
    {
      "question":
          "3. In a class of 48 students, 20 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are boys?",
      "options": ["231/17296", "220/17296", "245/17296", "210/17296"],
      "answer": "231/17296"
    },
    {
      "question":
          "4. The data set is {5, 6, 6, 7, 7, 8, 9, 10, 10, 11, 12, 13}. What is the interquartile range (IQR)?",
      "options": ["5", "4", "6", "3"],
      "answer": "5"
    },
    {
      "question":
          "5. A coin is flipped nine times. What is the probability of getting at least seven heads?",
      "options": ["73/512", "84/512", "70/512", "60/512"],
      "answer": "73/512"
    },
    {
      "question":
          "6. A spinner has numbers 1–35. What is the probability of spinning a prime number or a multiple of 5?",
      "options": ["20/35", "19/35", "18/35", "21/35"],
      "answer": "20/35"
    },
    {
      "question":
          "7. The mean of 15 numbers is 55. If 14 numbers are 53, 56, 54, 57, 55, 58, 52, 56, 55, 57, 54, 59, 51, 56, what is the 15th number?",
      "options": ["55", "56", "54", "57"],
      "answer": "55"
    },
    {
      "question":
          "8. A number from 1 to 120 is chosen randomly. What is the probability that it is divisible by 6 or 8?",
      "options": ["56/120", "55/120", "54/120", "57/120"],
      "answer": "56/120"
    },
    {
      "question":
          "9. The set of exam scores is {62, 65, 67, 70, 73, 75, 78, 80, 82, 85, 87, 90, 92}. What is the approximate standard deviation?",
      "options": ["9.0", "8.5", "8.0", "9.5"],
      "answer": "8.5"
    },
    {
      "question":
          "10. A die is rolled three times. What is the probability that the sum of the rolls is 10?",
      "options": ["27/216", "25/216", "30/216", "20/216"],
      "answer": "27/216"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 7"),
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
