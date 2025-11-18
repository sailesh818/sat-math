import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise7 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise7({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise7> createState() =>
      _ProbabilityStatisticsMediumPractise7State();
}

class _ProbabilityStatisticsMediumPractise7State
    extends State<ProbabilityStatisticsMediumPractise7> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 6 red, 5 blue, and 4 green marbles. Two marbles are drawn without replacement. What is the probability that both are blue?",
      "options": ["5/91", "1/3", "5/55", "1/6"],
      "answer": "5/91"
    },
    {
      "question":
          "2. The mean of seven numbers is 16. If six numbers are 14, 15, 17, 16, 18, and 16, what is the seventh number?",
      "options": ["16", "17", "18", "15"],
      "answer": "16"
    },
    {
      "question":
          "3. A fair die is rolled twice. What is the probability of getting a 2 and a 5 in any order?",
      "options": ["1/18", "1/12", "1/9", "1/6"],
      "answer": "1/18"
    },
    {
      "question":
          "4. The data set is {2, 4, 4, 5, 6, 6, 6, 7}. What is the mode?",
      "options": ["4", "5", "6", "7"],
      "answer": "6"
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting at least one tail?",
      "options": ["15/16", "3/4", "1/2", "7/16"],
      "answer": "15/16"
    },
    {
      "question":
          "6. The range of {5, 8, 10, 12, 15} is:",
      "options": ["10", "12", "15", "8"],
      "answer": "10"
    },
    {
      "question":
          "7. A spinner with numbers 1–8 is spun. What is the probability of spinning a number greater than 5?",
      "options": ["3/8", "1/2", "1/4", "5/8"],
      "answer": "3/8"
    },
    {
      "question":
          "8. In a class of 30 students, 12 are boys. If a student is selected randomly, what is the probability it is a girl?",
      "options": ["18/30", "3/5", "2/5", "1/2"],
      "answer": "18/30"
    },
    {
      "question":
          "9. A number from 1 to 24 is chosen randomly. What is the probability it is divisible by 3?",
      "options": ["1/3", "1/4", "1/6", "1/2"],
      "answer": "1/3"
    },
    {
      "question":
          "10. The median of {1, 3, 5, 7, 9, 11, 13, 15} is:",
      "options": ["7", "7.5", "8", "8.5"],
      "answer": "8",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 7"),
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
