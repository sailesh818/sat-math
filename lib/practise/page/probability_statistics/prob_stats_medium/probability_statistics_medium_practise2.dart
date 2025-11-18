import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise2 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise2({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise2> createState() =>
      _ProbabilityStatisticsMediumPractise2State();
}

class _ProbabilityStatisticsMediumPractise2State
    extends State<ProbabilityStatisticsMediumPractise2> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A box contains 6 red, 4 blue, and 5 green balls. Two balls are drawn without replacement. What is the probability that one is red and the other is blue?",
      "options": ["24/105", "1/4", "1/3", "5/14"],
      "answer": "24/105"
    },
    {
      "question":
          "2. The mean of 7 numbers is 12. If six of the numbers are 10, 14, 11, 13, 12, and 15, what is the seventh number?",
      "options": ["13", "12", "14", "15"],
      "answer": "12"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability that both rolls show an even number?",
      "options": ["1/4", "1/3", "1/2", "1/6"],
      "answer": "1/4"
    },
    {
      "question":
          "4. The data set is {3, 5, 5, 7, 8, 9, 9, 9}. What is the mode?",
      "options": ["5", "7", "8", "9"],
      "answer": "9"
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting exactly three heads?",
      "options": ["1/8", "1/4", "1/2", "1/16"],
      "answer": "1/4"
    },
    {
      "question":
          "6. The range of {6, 10, 15, 8, 12, 18} is:",
      "options": ["10", "12", "8", "6"],
      "answer": "12"
    },
    {
      "question":
          "7. A spinner with numbers 1–10 is spun. What is the probability of spinning a prime number?",
      "options": ["2/5", "1/2", "3/5", "1/3"],
      "answer": "2/5"
    },
    {
      "question":
          "8. In a class of 36 students, 20 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["16/36", "5/9", "2/5", "1/2"],
      "answer": "16/36"
    },
    {
      "question":
          "9. A number from 1 to 30 is chosen randomly. What is the probability it is divisible by 5?",
      "options": ["1/6", "1/5", "1/4", "1/3"],
      "answer": "1/6"
    },
    {
      "question":
          "10. The median of {2, 5, 7, 8, 10, 12, 14} is:",
      "options": ["7", "8", "8.5", "9"],
      "answer": "8",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 2"),
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
