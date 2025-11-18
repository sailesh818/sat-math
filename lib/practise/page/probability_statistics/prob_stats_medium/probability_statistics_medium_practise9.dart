import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise9 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise9({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise9> createState() =>
      _ProbabilityStatisticsMediumPractise9State();
}

class _ProbabilityStatisticsMediumPractise9State
    extends State<ProbabilityStatisticsMediumPractise9> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 red, 5 blue, and 7 green marbles. Two marbles are drawn without replacement. What is the probability that one is red and one is green?",
      "options": ["42/153", "7/33", "1/5", "2/9"],
      "answer": "42/153"
    },
    {
      "question":
          "2. The mean of eight numbers is 20. If seven numbers are 18, 22, 19, 21, 20, 23, and 17, what is the eighth number?",
      "options": ["20", "21", "19", "18"],
      "answer": "20"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of getting a sum of 8?",
      "options": ["5/36", "7/36", "1/6", "1/4"],
      "answer": "5/36"
    },
    {
      "question":
          "4. The data set is {3, 4, 4, 5, 6, 6, 6, 7, 8}. What is the mode?",
      "options": ["4", "5", "6", "7"],
      "answer": "6"
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting exactly two heads?",
      "options": ["3/8", "1/2", "1/4", "1/16"],
      "answer": "3/8"
    },
    {
      "question":
          "6. The range of {5, 8, 12, 14, 18, 20} is:",
      "options": ["15", "12", "13", "10"],
      "answer": "15"
    },
    {
      "question":
          "7. A spinner with numbers 1–10 is spun. What is the probability of landing on a number divisible by 2 or 5?",
      "options": ["3/5", "1/2", "1/4", "2/5"],
      "answer": "3/5"
    },
    {
      "question":
          "8. In a class of 40 students, 18 are boys. If a student is selected randomly, what is the probability it is a girl?",
      "options": ["22/40", "11/20", "1/2", "9/20"],
      "answer": "22/40"
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 6?",
      "options": ["1/6", "1/4", "1/5", "1/3"],
      "answer": "1/6"
    },
    {
      "question":
          "10. The median of {2, 4, 6, 7, 9, 11, 13, 15} is:",
      "options": ["6", "6.5", "7", "7.5"],
      "answer": "7.5",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 9"),
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
