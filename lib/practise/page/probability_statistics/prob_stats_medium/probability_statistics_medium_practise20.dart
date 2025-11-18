import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise20 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise20({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise20> createState() =>
      _ProbabilityStatisticsMediumPractise20State();
}

class _ProbabilityStatisticsMediumPractise20State
    extends State<ProbabilityStatisticsMediumPractise20> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 7 red, 5 blue, and 6 green marbles. Two marbles are drawn without replacement. What is the probability that both are green?",
      "options": ["5/51", "6/51", "1/6", "1/5"],
      "answer": "5/51"
    },
    {
      "question":
          "2. The mean of eight numbers is 22. If seven numbers are 20, 23, 21, 24, 22, 25, 23, what is the eighth number?",
      "options": ["22", "23", "21", "24"],
      "answer": "22"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of rolling a sum of 7?",
      "options": ["1/6", "1/8", "1/12", "1/4"],
      "answer": "1/6"
    },
    {
      "question":
          "4. The data set is {4, 5, 5, 6, 7, 7, 8, 8, 8}. What is the mode?",
      "options": ["5", "6", "7", "8"],
      "answer": "8"
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting at least one tail?",
      "options": ["15/16", "1/2", "7/16", "1/4"],
      "answer": "15/16"
    },
    {
      "question":
          "6. The range of {6, 9, 12, 15, 18} is:",
      "options": ["12", "11", "10", "9"],
      "answer": "12"
    },
    {
      "question":
          "7. A spinner with numbers 1–24 is spun. What is the probability of landing on a multiple of 3 or 4?",
      "options": ["1/2", "2/3", "5/12", "3/4"],
      "answer": "1/2"
    },
    {
      "question":
          "8. In a class of 60 students, 28 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["32/60", "8/15", "1/2", "3/5"],
      "answer": "32/60"
    },
    {
      "question":
          "9. A number from 1 to 48 is chosen randomly. What is the probability it is divisible by 12?",
      "options": ["1/4", "1/5", "1/6", "1/3"],
      "answer": "1/4"
    },
    {
      "question":
          "10. The median of {3, 5, 6, 7, 8, 9, 10, 12, 14} is:",
      "options": ["7", "7.5", "8", "8.5"],
      "answer": "8",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 20"),
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
