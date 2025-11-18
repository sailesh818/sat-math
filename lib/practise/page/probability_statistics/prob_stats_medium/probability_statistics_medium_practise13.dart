import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise13 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise13({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise13> createState() =>
      _ProbabilityStatisticsMediumPractise13State();
}

class _ProbabilityStatisticsMediumPractise13State
    extends State<ProbabilityStatisticsMediumPractise13> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 7 blue, and 8 green marbles. Two marbles are drawn without replacement. What is the probability that one is red and one is green?",
      "options": ["40/190", "1/5", "7/20", "2/9"],
      "answer": "40/190"
    },
    {
      "question":
          "2. The mean of ten numbers is 25. If nine numbers are 22, 24, 26, 28, 23, 27, 25, 26, and 24, what is the tenth number?",
      "options": ["25", "24", "26", "27"],
      "answer": "25"
    },
    {
      "question":
          "3. A fair die is rolled three times. What is the probability of rolling at least one 4?",
      "options": ["91/216", "125/216", "1/2", "5/36"],
      "answer": "91/216"
    },
    {
      "question":
          "4. The data set is {2, 3, 3, 4, 5, 5, 5, 6, 6}. What is the mode?",
      "options": ["3", "5", "6", "4"],
      "answer": "5"
    },
    {
      "question":
          "5. A coin is flipped six times. What is the probability of getting exactly three heads?",
      "options": ["5/16", "10/32", "15/32", "3/8"],
      "answer": "15/32"
    },
    {
      "question":
          "6. The range of {9, 11, 14, 17, 20, 22} is:",
      "options": ["13", "12", "11", "14"],
      "answer": "13"
    },
    {
      "question":
          "7. A spinner with numbers 1–15 is spun. What is the probability of landing on a multiple of 3?",
      "options": ["1/5", "1/3", "1/4", "2/5"],
      "answer": "1/5"
    },
    {
      "question":
          "8. In a class of 60 students, 25 are boys. If a student is selected randomly, what is the probability it is a girl?",
      "options": ["35/60", "7/12", "1/2", "3/5"],
      "answer": "35/60"
    },
    {
      "question":
          "9. A number from 1 to 45 is chosen randomly. What is the probability it is divisible by 9?",
      "options": ["1/5", "1/4", "1/6", "1/9"],
      "answer": "1/5"
    },
    {
      "question":
          "10. The median of {1, 2, 4, 5, 7, 8, 9, 11} is:",
      "options": ["5", "5.5", "6", "6.5"],
      "answer": "5.5",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 13"),
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
