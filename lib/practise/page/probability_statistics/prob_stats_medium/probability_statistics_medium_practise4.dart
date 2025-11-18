import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise4 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise4({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise4> createState() =>
      _ProbabilityStatisticsMediumPractise4State();
}

class _ProbabilityStatisticsMediumPractise4State
    extends State<ProbabilityStatisticsMediumPractise4> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 7 red, 5 blue, and 3 green marbles. Two marbles are drawn without replacement. What is the probability that both are red?",
      "options": ["7/30", "7/45", "7/15", "1/3"],
      "answer": "7/30"
    },
    {
      "question":
          "2. The mean of eight numbers is 20. If seven numbers are 18, 22, 19, 21, 20, 23, and 17, what is the eighth number?",
      "options": ["20", "21", "22", "19"],
      "answer": "20"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of getting a sum greater than 9?",
      "options": ["1/3", "5/12", "1/2", "7/12"],
      "answer": "1/3"
    },
    {
      "question":
          "4. The data set is {4, 5, 5, 6, 7, 7, 7, 8, 9}. What is the mode?",
      "options": ["5", "6", "7", "8"],
      "answer": "7"
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting exactly two heads?",
      "options": ["3/8", "1/4", "1/2", "1/8"],
      "answer": "3/8"
    },
    {
      "question":
          "6. The range of {3, 6, 8, 9, 12, 15, 18} is:",
      "options": ["12", "15", "18", "10"],
      "answer": "15"
    },
    {
      "question":
          "7. A spinner with numbers 1–12 is spun. What is the probability of landing on a multiple of 4?",
      "options": ["1/4", "1/3", "1/2", "1/6"],
      "answer": "1/3"
    },
    {
      "question":
          "8. In a class of 50 students, 30 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["20/50", "3/5", "1/2", "2/5"],
      "answer": "20/50"
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 6?",
      "options": ["1/6", "1/4", "1/5", "1/3"],
      "answer": "1/6"
    },
    {
      "question":
          "10. The median of {1, 3, 5, 6, 8, 9, 11, 13} is:",
      "options": ["5", "6", "6.5", "7"],
      "answer": "6.5",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 4"),
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
