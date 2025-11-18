import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise18 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise18({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise18> createState() =>
      _ProbabilityStatisticsMediumPractise18State();
}

class _ProbabilityStatisticsMediumPractise18State
    extends State<ProbabilityStatisticsMediumPractise18> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 red, 4 blue, and 5 green marbles. Two marbles are drawn without replacement. What is the probability that one is red and one is blue?",
      "options": ["24/105", "1/5", "2/7", "1/4"],
      "answer": "24/105"
    },
    {
      "question":
          "2. The mean of eight numbers is 20. If seven numbers are 18, 22, 19, 21, 20, 23, 19, what is the eighth number?",
      "options": ["20", "21", "19", "22"],
      "answer": "20"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of rolling a sum less than 5?",
      "options": ["1/6", "1/4", "1/3", "1/2"],
      "answer": "1/6"
    },
    {
      "question":
          "4. The data set is {3, 4, 4, 5, 6, 6, 7, 7}. What is the mode?",
      "options": ["4", "5", "6", "4 & 6"],
      "answer": "4 & 6"
    },
    {
      "question":
          "5. A coin is flipped six times. What is the probability of getting exactly four heads?",
      "options": ["15/64", "20/64", "10/64", "25/64"],
      "answer": "15/64"
    },
    {
      "question":
          "6. The range of {8, 11, 14, 17, 19} is:",
      "options": ["11", "10", "12", "9"],
      "answer": "11"
    },
    {
      "question":
          "7. A spinner with numbers 1–15 is spun. What is the probability of landing on a prime number?",
      "options": ["7/15", "1/2", "1/3", "2/5"],
      "answer": "7/15"
    },
    {
      "question":
          "8. In a class of 40 students, 18 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["22/40", "11/20", "1/2", "3/5"],
      "answer": "22/40"
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 6?",
      "options": ["1/6", "1/5", "1/4", "1/3"],
      "answer": "1/6"
    },
    {
      "question":
          "10. The median of {2, 4, 5, 7, 8, 10, 12} is:",
      "options": ["7", "6", "6.5", "8"],
      "answer": "7",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 18"),
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
