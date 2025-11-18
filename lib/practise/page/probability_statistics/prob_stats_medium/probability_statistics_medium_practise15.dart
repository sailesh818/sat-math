import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise15 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise15({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise15> createState() =>
      _ProbabilityStatisticsMediumPractise15State();
}

class _ProbabilityStatisticsMediumPractise15State
    extends State<ProbabilityStatisticsMediumPractise15> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 8 red, 6 blue, and 4 green marbles. Two marbles are drawn without replacement. What is the probability that both are blue?",
      "options": ["5/51", "3/34", "1/5", "2/17"],
      "answer": "5/51"
    },
    {
      "question":
          "2. The mean of seven numbers is 20. If six of the numbers are 18, 22, 19, 21, 20, and 23, what is the seventh number?",
      "options": ["17", "20", "19", "18"],
      "answer": "20"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of rolling a sum greater than 9?",
      "options": ["1/3", "5/12", "1/2", "1/4"],
      "answer": "1/3"
    },
    {
      "question":
          "4. The data set is {3, 4, 4, 5, 5, 6, 7, 7, 7}. What is the mode?",
      "options": ["4", "5", "6", "7"],
      "answer": "7"
    },
    {
      "question":
          "5. A coin is flipped five times. What is the probability of getting exactly two tails?",
      "options": ["5/16", "10/32", "5/10", "1/2"],
      "answer": "10/32"
    },
    {
      "question":
          "6. The range of {6, 9, 12, 14, 18, 21} is:",
      "options": ["15", "14", "12", "13"],
      "answer": "15"
    },
    {
      "question":
          "7. A spinner with numbers 1–10 is spun. What is the probability of landing on a number that is prime?",
      "options": ["1/2", "2/5", "3/10", "4/5"],
      "answer": "1/2"
    },
    {
      "question":
          "8. In a class of 40 students, 18 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["22/40", "11/20", "1/2", "3/5"],
      "answer": "22/40"
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 4?",
      "options": ["1/4", "1/3", "1/6", "1/5"],
      "answer": "1/4"
    },
    {
      "question":
          "10. The median of {2, 4, 5, 7, 9, 11, 13} is:",
      "options": ["7", "6", "6.5", "7.5"],
      "answer": "7",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 15"),
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
