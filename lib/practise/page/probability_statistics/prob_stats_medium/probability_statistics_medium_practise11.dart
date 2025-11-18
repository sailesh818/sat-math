import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise11 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise11({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise11> createState() =>
      _ProbabilityStatisticsMediumPractise11State();
}

class _ProbabilityStatisticsMediumPractise11State
    extends State<ProbabilityStatisticsMediumPractise11> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 3 red, 5 blue, and 6 green marbles. Two marbles are drawn without replacement. What is the probability that one is blue and one is green?",
      "options": ["30/136", "15/34", "1/4", "3/10"],
      "answer": "30/136"
    },
    {
      "question":
          "2. The mean of six numbers is 18. If five numbers are 16, 17, 19, 20, and 18, what is the sixth number?",
      "options": ["20", "18", "19", "17"],
      "answer": "18"
    },
    {
      "question":
          "3. A fair die is rolled three times. What is the probability of rolling at least one 6?",
      "options": ["91/216", "125/216", "5/36", "1/2"],
      "answer": "91/216"
    },
    {
      "question":
          "4. The data set is {2, 3, 3, 4, 5, 5, 5, 6}. What is the mode?",
      "options": ["3", "4", "5", "6"],
      "answer": "5"
    },
    {
      "question":
          "5. A coin is flipped three times. What is the probability of getting exactly two tails?",
      "options": ["3/8", "1/2", "1/4", "1/8"],
      "answer": "3/8"
    },
    {
      "question":
          "6. The range of {6, 9, 11, 14, 17} is:",
      "options": ["11", "12", "10", "9"],
      "answer": "11"
    },
    {
      "question":
          "7. A spinner with numbers 1–10 is spun. What is the probability of landing on an even number?",
      "options": ["1/2", "3/5", "2/5", "1/3"],
      "answer": "1/2"
    },
    {
      "question":
          "8. In a class of 50 students, 22 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["28/50", "14/25", "1/2", "3/5"],
      "answer": "28/50"
    },
    {
      "question":
          "9. A number from 1 to 60 is chosen randomly. What is the probability it is divisible by 5?",
      "options": ["1/5", "1/6", "1/4", "1/3"],
      "answer": "1/5"
    },
    {
      "question":
          "10. The median of {1, 4, 5, 7, 8, 10, 12} is:",
      "options": ["5", "6", "7", "7.5"],
      "answer": "7",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 11"),
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
