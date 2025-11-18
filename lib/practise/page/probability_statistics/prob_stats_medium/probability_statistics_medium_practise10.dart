import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise10 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise10({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise10> createState() =>
      _ProbabilityStatisticsMediumPractise10State();
}

class _ProbabilityStatisticsMediumPractise10State
    extends State<ProbabilityStatisticsMediumPractise10> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 4 red, 6 blue, and 5 green marbles. Two marbles are drawn without replacement. What is the probability that both are red?",
      "options": ["2/39", "1/11", "1/7", "1/5"],
      "answer": "2/39"
    },
    {
      "question":
          "2. The mean of seven numbers is 15. If six of the numbers are 12, 16, 14, 15, 17, and 16, what is the seventh number?",
      "options": ["15", "16", "14", "17"],
      "answer": "15"
    },
    {
      "question":
          "3. A fair die is rolled three times. What is the probability of rolling exactly two 5s?",
      "options": ["5/72", "1/6", "1/12", "1/9"],
      "answer": "5/72"
    },
    {
      "question":
          "4. The data set is {3, 3, 4, 5, 5, 5, 6, 7}. What is the mode?",
      "options": ["3", "4", "5", "6"],
      "answer": "5"
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting at least one tail?",
      "options": ["15/16", "1/2", "3/4", "7/16"],
      "answer": "15/16"
    },
    {
      "question":
          "6. The range of {7, 9, 12, 14, 18, 21} is:",
      "options": ["14", "12", "15", "16"],
      "answer": "14"
    },
    {
      "question":
          "7. A spinner with numbers 1–12 is spun. What is the probability of spinning a number divisible by 4?",
      "options": ["1/3", "1/4", "1/2", "1/6"],
      "answer": "1/3"
    },
    {
      "question":
          "8. In a class of 28 students, 12 are boys. If a student is selected randomly, what is the probability it is a girl?",
      "options": ["16/28", "4/7", "1/2", "2/3"],
      "answer": "16/28"
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 9?",
      "options": ["1/4", "1/3", "1/5", "1/6"],
      "answer": "1/4"
    },
    {
      "question":
          "10. The median of {1, 3, 5, 7, 9, 11, 13, 15, 17} is:",
      "options": ["8", "9", "9.5", "10"],
      "answer": "9",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 10"),
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
