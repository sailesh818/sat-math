import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise1 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise1({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise1> createState() =>
      _ProbabilityStatisticsMediumPractise1State();
}

class _ProbabilityStatisticsMediumPractise1State
    extends State<ProbabilityStatisticsMediumPractise1> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 3 blue, and 2 green marbles. Two marbles are drawn without replacement. What is the probability that both are blue?",
      "options": ["1/15", "2/45", "1/6", "3/20"],
      "answer": "2/45"
    },
    {
      "question":
          "2. The mean of five numbers is 14. If four of the numbers are 12, 16, 13, and 15, what is the fifth number?",
      "options": ["14", "15", "16", "13"],
      "answer": "14"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of getting a sum of 8?",
      "options": ["5/36", "7/36", "1/6", "1/8"],
      "answer": "5/36"
    },
    {
      "question":
          "4. The data set is {2, 3, 5, 5, 7, 9, 9, 9}. What is the mode?",
      "options": ["5", "7", "9", "3"],
      "answer": "9"
    },
    {
      "question":
          "5. A coin is flipped three times. What is the probability of getting exactly two tails?",
      "options": ["1/2", "3/8", "1/4", "1/8"],
      "answer": "3/8"
    },
    {
      "question":
          "6. The range of {4, 8, 12, 7, 10, 15} is:",
      "options": ["10", "11", "12", "8"],
      "answer": "11"
    },
    {
      "question":
          "7. A spinner with 6 equal sections labeled 1–6 is spun. What is the probability of spinning a number that is prime?",
      "options": ["1/2", "1/3", "1/6", "2/3"],
      "answer": "1/2"
    },
    {
      "question":
          "8. In a class of 28 students, 18 are boys. If a student is selected randomly, what is the probability that it is a girl?",
      "options": ["5/14", "10/28", "1/2", "2/7"],
      "answer": "10/28"
    },
    {
      "question":
          "9. A number from 1 to 24 is chosen randomly. What is the probability it is divisible by 6?",
      "options": ["1/4", "1/3", "1/6", "1/2"],
      "answer": "1/4"
    },
    {
      "question":
          "10. The median of {1, 4, 6, 7, 9, 12, 15} is:",
      "options": ["6", "7", "7.5", "8"],
      "answer": "7",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 1"),
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
