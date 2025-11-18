import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise17 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise17({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise17> createState() =>
      _ProbabilityStatisticsMediumPractise17State();
}

class _ProbabilityStatisticsMediumPractise17State
    extends State<ProbabilityStatisticsMediumPractise17> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 6 blue, and 4 green marbles. Two marbles are drawn without replacement. What is the probability that one is red and one is green?",
      "options": ["20/105", "1/5", "2/7", "1/4"],
      "answer": "20/105"
    },
    {
      "question":
          "2. The mean of seven numbers is 18. If six numbers are 17, 18, 19, 16, 20, 18, what is the seventh number?",
      "options": ["17", "18", "19", "16"],
      "answer": "18"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of rolling at least one 5?",
      "options": ["11/36", "5/12", "1/2", "25/36"],
      "answer": "11/36"
    },
    {
      "question":
          "4. The data set is {2, 3, 3, 4, 5, 5, 6, 6, 6}. What is the mode?",
      "options": ["3", "5", "6", "4"],
      "answer": "6"
    },
    {
      "question":
          "5. A coin is flipped five times. What is the probability of getting exactly three heads?",
      "options": ["5/16", "10/32", "10/16", "1/2"],
      "answer": "10/32"
    },
    {
      "question":
          "6. The range of {7, 10, 12, 15, 18} is:",
      "options": ["11", "10", "12", "13"],
      "answer": "11"
    },
    {
      "question":
          "7. A spinner with numbers 1–20 is spun. What is the probability of landing on a number divisible by 4?",
      "options": ["1/5", "1/4", "1/6", "1/3"],
      "answer": "1/5"
    },
    {
      "question":
          "8. In a class of 50 students, 22 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["28/50", "7/12", "1/2", "3/5"],
      "answer": "28/50"
    },
    {
      "question":
          "9. A number from 1 to 48 is chosen randomly. What is the probability it is divisible by 8?",
      "options": ["1/6", "1/5", "1/8", "1/4"],
      "answer": "1/6"
    },
    {
      "question":
          "10. The median of {3, 4, 5, 6, 7, 8, 9, 10} is:",
      "options": ["6", "6.5", "7", "7.5"],
      "answer": "6.5",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 17"),
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
