import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise14 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise14({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise14> createState() =>
      _ProbabilityStatisticsMediumPractise14State();
}

class _ProbabilityStatisticsMediumPractise14State
    extends State<ProbabilityStatisticsMediumPractise14> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 red, 5 blue, and 7 green marbles. Two marbles are drawn without replacement. What is the probability that one is red and one is blue?",
      "options": ["30/153", "1/5", "2/7", "1/4"],
      "answer": "30/153"
    },
    {
      "question":
          "2. The mean of nine numbers is 18. If eight numbers are 17, 19, 18, 16, 20, 21, 18, 17, what is the ninth number?",
      "options": ["18", "19", "17", "16"],
      "answer": "18"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of rolling doubles?",
      "options": ["1/6", "1/4", "1/5", "1/3"],
      "answer": "1/6"
    },
    {
      "question":
          "4. The data set is {3, 4, 4, 5, 5, 6, 7}. What is the mode?",
      "options": ["4", "5", "6", "7"],
      "answer": "4"
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting exactly one head?",
      "options": ["1/4", "1/2", "1/8", "1/16"],
      "answer": "1/4"
    },
    {
      "question":
          "6. The range of {5, 9, 12, 14, 18} is:",
      "options": ["13", "12", "11", "10"],
      "answer": "13"
    },
    {
      "question":
          "7. A spinner with numbers 1–12 is spun. What is the probability of landing on a number divisible by 2 or 3?",
      "options": ["2/3", "1/2", "5/12", "3/4"],
      "answer": "2/3"
    },
    {
      "question":
          "8. In a class of 36 students, 15 are boys. If a student is selected randomly, what is the probability it is a girl?",
      "options": ["21/36", "7/12", "1/2", "3/5"],
      "answer": "21/36"
    },
    {
      "question":
          "9. A number from 1 to 30 is chosen randomly. What is the probability it is divisible by 5?",
      "options": ["1/6", "1/5", "1/4", "1/3"],
      "answer": "1/6"
    },
    {
      "question":
          "10. The median of {2, 4, 6, 8, 10, 12, 14, 16, 18} is:",
      "options": ["9", "10", "10.5", "11"],
      "answer": "10",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 14"),
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
