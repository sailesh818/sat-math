import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise5 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise5({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise5> createState() =>
      _ProbabilityStatisticsMediumPractise5State();
}

class _ProbabilityStatisticsMediumPractise5State
    extends State<ProbabilityStatisticsMediumPractise5> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 8 red, 6 blue, and 4 green balls. Two balls are drawn without replacement. What is the probability that one is red and one is green?",
      "options": ["16/153", "8/91", "1/5", "2/9"],
      "answer": "16/153"
    },
    {
      "question":
          "2. The mean of six numbers is 18. If five numbers are 16, 20, 17, 19, and 18, what is the sixth number?",
      "options": ["18", "19", "17", "20"],
      "answer": "18"
    },
    {
      "question":
          "3. A fair die is rolled three times. What is the probability of getting exactly two 6s?",
      "options": ["5/36", "1/6", "1/12", "1/9"],
      "answer": "5/36"
    },
    {
      "question":
          "4. The data set is {2, 3, 4, 4, 5, 5, 5, 6}. What is the mode?",
      "options": ["4", "5", "6", "3"],
      "answer": "5"
    },
    {
      "question":
          "5. A coin is flipped five times. What is the probability of getting exactly three heads?",
      "options": ["5/16", "10/32", "5/32", "1/4"],
      "answer": "10/32"
    },
    {
      "question":
          "6. The range of {7, 9, 12, 15, 18, 20} is:",
      "options": ["13", "12", "15", "14"],
      "answer": "13"
    },
    {
      "question":
          "7. A spinner with numbers 1–10 is spun. What is the probability of landing on a number divisible by 2 or 5?",
      "options": ["3/5", "1/2", "4/5", "2/5"],
      "answer": "3/5"
    },
    {
      "question":
          "8. In a class of 45 students, 28 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["17/45", "7/15", "1/2", "2/5"],
      "answer": "17/45"
    },
    {
      "question":
          "9. A number from 1 to 48 is chosen randomly. What is the probability it is divisible by 8?",
      "options": ["1/6", "1/8", "1/5", "1/4"],
      "answer": "1/6"
    },
    {
      "question":
          "10. The median of {3, 5, 7, 9, 11, 13, 15} is:",
      "options": ["7", "8", "9", "9.5"],
      "answer": "9",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 5"),
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
