import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise5 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise5({super.key});

  @override
  State<ProbabilityStatisticsHardPractise5> createState() =>
      _ProbabilityStatisticsHardPractise5State();
}

class _ProbabilityStatisticsHardPractise5State
    extends State<ProbabilityStatisticsHardPractise5> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 red, 5 blue, and 4 green marbles. Four marbles are drawn without replacement. What is the probability that exactly two are red and one is blue?",
      "options": ["25/91", "20/91", "30/91", "15/91"],
      "answer": "25/91"
    },
    {
      "question":
          "2. A die is rolled five times. What is the probability of getting exactly three 6s?",
      "options": ["250/7776", "500/7776", "625/7776", "375/7776"],
      "answer": "250/7776"
    },
    {
      "question":
          "3. In a class of 55 students, 25 are girls. If two students are selected randomly without replacement, what is the probability that one is a boy and one is a girl?",
      "options": ["625/1485", "600/1485", "550/1485", "625/1550"],
      "answer": "625/1485"
    },
    {
      "question":
          "4. The data set is {5, 6, 6, 7, 7, 8, 9, 10, 10, 11, 12}. What is the interquartile range (IQR)?",
      "options": ["4", "5", "6", "3"],
      "answer": "4"
    },
    {
      "question":
          "5. A coin is flipped eight times. What is the probability of getting at least six heads?",
      "options": ["37/256", "56/256", "70/256", "28/256"],
      "answer": "37/256"
    },
    {
      "question":
          "6. A spinner has numbers 1–30. What is the probability of landing on a prime number or a multiple of 5?",
      "options": ["17/30", "16/30", "15/30", "14/30"],
      "answer": "17/30"
    },
    {
      "question":
          "7. The mean of 10 numbers is 45. If nine numbers are 43, 46, 44, 47, 45, 48, 42, 46, 44, what is the tenth number?",
      "options": ["45", "46", "44", "47"],
      "answer": "45"
    },
    {
      "question":
          "8. A number from 1 to 80 is chosen randomly. What is the probability that it is divisible by 4 or 7?",
      "options": ["32/80", "31/80", "30/80", "33/80"],
      "answer": "32/80"
    },
    {
      "question":
          "9. The set of scores is {65, 68, 70, 72, 75, 78, 80, 82, 85, 88, 90, 92}. What is the approximate standard deviation?",
      "options": ["8.2", "8.5", "9.0", "7.8"],
      "answer": "8.2"
    },
    {
      "question":
          "10. A die is rolled three times. What is the probability that the numbers are in strictly increasing order?",
      "options": ["5/36", "1/6", "7/36", "1/12"],
      "answer": "5/36"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 5"),
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
