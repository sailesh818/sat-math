import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise12 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise12({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise12> createState() =>
      _ProbabilityStatisticsMediumPractise12State();
}

class _ProbabilityStatisticsMediumPractise12State
    extends State<ProbabilityStatisticsMediumPractise12> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 7 red, 6 blue, and 5 green marbles. Two marbles are drawn without replacement. What is the probability that both are green?",
      "options": ["5/153", "1/6", "1/5", "1/8"],
      "answer": "5/153"
    },
    {
      "question":
          "2. The mean of eight numbers is 22. If seven numbers are 20, 21, 23, 22, 24, 25, and 21, what is the eighth number?",
      "options": ["22", "23", "21", "24"],
      "answer": "22"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of getting a sum of 7?",
      "options": ["1/6", "1/5", "1/4", "1/8"],
      "answer": "1/6"
    },
    {
      "question":
          "4. The data set is {3, 4, 4, 5, 5, 6, 6, 6, 7}. What is the mode?",
      "options": ["4", "5", "6", "7"],
      "answer": "6"
    },
    {
      "question":
          "5. A coin is flipped five times. What is the probability of getting exactly three heads?",
      "options": ["5/16", "1/4", "3/8", "1/2"],
      "answer": "5/16"
    },
    {
      "question":
          "6. The range of {8, 11, 13, 17, 20} is:",
      "options": ["12", "13", "11", "10"],
      "answer": "12"
    },
    {
      "question":
          "7. A spinner with numbers 1–9 is spun. What is the probability of spinning a number divisible by 3?",
      "options": ["1/3", "1/4", "1/2", "2/3"],
      "answer": "1/3"
    },
    {
      "question":
          "8. In a class of 45 students, 28 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["17/45", "28/45", "3/5", "1/2"],
      "answer": "17/45"
    },
    {
      "question":
          "9. A number from 1 to 50 is chosen randomly. What is the probability it is divisible by 5?",
      "options": ["1/5", "1/6", "1/4", "1/3"],
      "answer": "1/5"
    },
    {
      "question":
          "10. The median of {2, 4, 6, 8, 10, 12, 14, 16} is:",
      "options": ["8", "9", "10", "9.5"],
      "answer": "9",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 12"),
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
