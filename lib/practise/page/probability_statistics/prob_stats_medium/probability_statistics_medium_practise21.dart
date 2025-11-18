import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise21 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise21({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise21> createState() =>
      _ProbabilityStatisticsMediumPractise21State();
}

class _ProbabilityStatisticsMediumPractise21State
    extends State<ProbabilityStatisticsMediumPractise21> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 4 blue, and 3 green marbles. Two marbles are drawn at random without replacement. What is the probability that both are blue?",
      "options": ["1/9", "2/33", "1/11", "1/6"],
      "answer": "2/33"
    },
    {
      "question":
          "2. The mean of five numbers is 12. If four of the numbers are 10, 14, 11, and 13, what is the fifth number?",
      "options": ["12", "13", "14", "15"],
      "answer": "12"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of getting a sum of 7?",
      "options": ["1/6", "1/8", "1/12", "1/9"],
      "answer": "1/6"
    },
    {
      "question":
          "4. The data set is {3, 7, 7, 9, 12, 12, 12, 15}. What is the mode?",
      "options": ["7", "9", "12", "15"],
      "answer": "12"
    },
    {
      "question":
          "5. A coin is flipped three times. What is the probability of getting exactly two heads?",
      "options": ["1/2", "3/8", "1/4", "1/8"],
      "answer": "3/8"
    },
    {
      "question":
          "6. The range of {5, 8, 12, 7, 10, 15} is:",
      "options": ["10", "12", "8", "7"],
      "answer": "10"
    },
    {
      "question":
          "7. A spinner with 6 equal sections labeled 1–6 is spun. What is the probability of spinning a prime number?",
      "options": ["1/2", "1/3", "1/6", "2/3"],
      "answer": "1/2"
    },
    {
      "question":
          "8. In a class of 30 students, 18 are boys. If a student is selected at random, what is the probability it is a girl?",
      "options": ["3/5", "2/5", "1/2", "1/3"],
      "answer": "2/5"
    },
    {
      "question":
          "9. A number from 1 to 24 is chosen at random. What is the probability it is divisible by 4?",
      "options": ["1/4", "1/6", "1/3", "1/2"],
      "answer": "1/6"
    },
    {
      "question":
          "10. The median of {1, 3, 5, 7, 9, 11, 13} is:",
      "options": ["6", "7", "7.5", "8"],
      "answer": "7",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 21"),
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
