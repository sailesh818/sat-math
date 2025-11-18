import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise3 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise3({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise3> createState() =>
      _ProbabilityStatisticsMediumPractise3State();
}

class _ProbabilityStatisticsMediumPractise3State
    extends State<ProbabilityStatisticsMediumPractise3> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A box contains 4 red, 6 blue, and 5 green balls. Two balls are drawn without replacement. What is the probability that one is red and the other is green?",
      "options": ["10/91", "5/33", "2/11", "4/15"],
      "answer": "10/91"
    },
    {
      "question":
          "2. The mean of seven numbers is 15. If six numbers are 12, 14, 16, 18, 13, and 17, what is the seventh number?",
      "options": ["15", "16", "17", "14"],
      "answer": "15"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of getting at least one 6?",
      "options": ["11/36", "1/6", "5/36", "1/2"],
      "answer": "11/36"
    },
    {
      "question":
          "4. The data set is {3, 4, 5, 5, 6, 7, 7, 7, 8}. What is the mode?",
      "options": ["5", "6", "7", "8"],
      "answer": "7"
    },
    {
      "question":
          "5. A coin is flipped three times. What is the probability of getting no heads?",
      "options": ["1/8", "1/4", "1/2", "1/16"],
      "answer": "1/8"
    },
    {
      "question":
          "6. The range of {5, 9, 12, 8, 15, 18} is:",
      "options": ["10", "13", "12", "8"],
      "answer": "13"
    },
    {
      "question":
          "7. A spinner with 8 equal sections labeled 1–8 is spun. What is the probability of spinning a number less than 5?",
      "options": ["1/2", "1/4", "3/4", "5/8"],
      "answer": "1/2"
    },
    {
      "question":
          "8. In a class of 40 students, 25 are boys. If a student is selected randomly, what is the probability it is a girl?",
      "options": ["15/40", "3/8", "2/5", "1/2"],
      "answer": "15/40"
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 9?",
      "options": ["1/4", "1/3", "1/6", "1/2"],
      "answer": "1/4"
    },
    {
      "question":
          "10. The median of {2, 4, 6, 7, 9, 12, 14, 16} is:",
      "options": ["6", "7", "7.5", "8"],
      "answer": "7.5",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 3"),
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
