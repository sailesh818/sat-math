import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise6 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise6({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise6> createState() =>
      _ProbabilityStatisticsMediumPractise6State();
}

class _ProbabilityStatisticsMediumPractise6State
    extends State<ProbabilityStatisticsMediumPractise6> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 4 blue, and 3 green balls. Two balls are drawn without replacement. What is the probability that both balls are green?",
      "options": ["1/33", "1/22", "1/11", "1/6"],
      "answer": "1/22"
    },
    {
      "question":
          "2. The mean of six numbers is 14. If five of the numbers are 12, 16, 15, 13, and 14, what is the sixth number?",
      "options": ["14", "13", "15", "16"],
      "answer": "14"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of rolling two odd numbers?",
      "options": ["1/4", "1/3", "1/2", "1/6"],
      "answer": "1/4"
    },
    {
      "question":
          "4. The data set is {2, 3, 3, 4, 5, 5, 5, 6, 7}. What is the mode?",
      "options": ["3", "5", "6", "7"],
      "answer": "5"
    },
    {
      "question":
          "5. A coin is flipped three times. What is the probability of getting at least one head?",
      "options": ["7/8", "3/4", "1/2", "5/8"],
      "answer": "7/8"
    },
    {
      "question":
          "6. The range of {6, 9, 12, 14, 18} is:",
      "options": ["12", "13", "14", "15"],
      "answer": "12"
    },
    {
      "question":
          "7. A spinner with numbers 1–9 is spun. What is the probability of spinning a number divisible by 3?",
      "options": ["1/3", "1/4", "1/2", "2/3"],
      "answer": "1/3"
    },
    {
      "question":
          "8. In a class of 32 students, 18 are boys. If a student is selected randomly, what is the probability it is a girl?",
      "options": ["14/32", "7/16", "1/2", "9/16"],
      "answer": "14/32"
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 4?",
      "options": ["1/4", "1/3", "1/6", "1/5"],
      "answer": "1/4"
    },
    {
      "question":
          "10. The median of {1, 2, 4, 5, 6, 7, 9} is:",
      "options": ["4", "4.5", "5", "5.5"],
      "answer": "5",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 6"),
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
