import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise8 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise8({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise8> createState() =>
      _ProbabilityStatisticsMediumPractise8State();
}

class _ProbabilityStatisticsMediumPractise8State
    extends State<ProbabilityStatisticsMediumPractise8> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 7 blue, and 8 green marbles. Two marbles are drawn without replacement. What is the probability that one is red and one is blue?",
      "options": ["35/190", "7/40", "5/20", "1/5"],
      "answer": "35/190"
    },
    {
      "question":
          "2. The mean of nine numbers is 18. If eight of the numbers are 16, 17, 18, 19, 20, 15, 21, and 18, what is the ninth number?",
      "options": ["18", "19", "20", "17"],
      "answer": "18"
    },
    {
      "question":
          "3. A fair die is rolled three times. What is the probability of rolling exactly one 6?",
      "options": ["5/18", "1/6", "1/2", "1/3"],
      "answer": "5/18"
    },
    {
      "question":
          "4. The data set is {1, 2, 2, 3, 4, 4, 4, 5}. What is the mode?",
      "options": ["2", "3", "4", "5"],
      "answer": "4"
    },
    {
      "question":
          "5. A coin is flipped five times. What is the probability of getting exactly four heads?",
      "options": ["5/32", "1/4", "5/16", "1/2"],
      "answer": "5/32"
    },
    {
      "question":
          "6. The range of {4, 7, 9, 10, 12, 15} is:",
      "options": ["11", "10", "12", "9"],
      "answer": "11"
    },
    {
      "question":
          "7. A spinner with numbers 1–12 is spun. What is the probability of spinning a number divisible by 3?",
      "options": ["1/4", "1/3", "1/2", "1/6"],
      "answer": "1/4"
    },
    {
      "question":
          "8. In a class of 36 students, 20 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["16/36", "2/5", "1/2", "5/9"],
      "answer": "16/36"
    },
    {
      "question":
          "9. A number from 1 to 48 is chosen randomly. What is the probability it is divisible by 8?",
      "options": ["1/6", "1/8", "1/4", "1/5"],
      "answer": "1/6"
    },
    {
      "question":
          "10. The median of {3, 5, 7, 9, 11, 13, 15, 17} is:",
      "options": ["8", "9", "10", "11"],
      "answer": "10",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 8"),
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
