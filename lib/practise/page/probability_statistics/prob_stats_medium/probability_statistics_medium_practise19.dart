import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise19 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise19({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise19> createState() =>
      _ProbabilityStatisticsMediumPractise19State();
}

class _ProbabilityStatisticsMediumPractise19State
    extends State<ProbabilityStatisticsMediumPractise19> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 3 red, 4 blue, and 5 green marbles. Two marbles are drawn without replacement. What is the probability that both are red?",
      "options": ["3/66", "1/12", "1/11", "1/6"],
      "answer": "3/66"
    },
    {
      "question":
          "2. The mean of nine numbers is 25. If eight numbers are 22, 23, 26, 27, 24, 28, 25, 26, what is the ninth number?",
      "options": ["27", "25", "26", "24"],
      "answer": "25"
    },
    {
      "question":
          "3. A fair die is rolled three times. What is the probability of rolling exactly two 3s?",
      "options": ["25/216", "75/216", "15/216", "50/216"],
      "answer": "75/216"
    },
    {
      "question":
          "4. The data set is {2, 3, 3, 4, 5, 5, 5, 6, 7}. What is the mode?",
      "options": ["3", "5", "6", "4"],
      "answer": "5"
    },
    {
      "question":
          "5. A coin is flipped five times. What is the probability of getting at least one head?",
      "options": ["31/32", "1/2", "15/32", "1/16"],
      "answer": "31/32"
    },
    {
      "question":
          "6. The range of {5, 9, 12, 14, 18, 20} is:",
      "options": ["15", "14", "13", "12"],
      "answer": "15"
    },
    {
      "question":
          "7. A spinner with numbers 1–12 is spun. What is the probability of landing on a number divisible by 4 or 6?",
      "options": ["1/3", "1/2", "1/4", "5/12"],
      "answer": "1/3"
    },
    {
      "question":
          "8. In a class of 45 students, 20 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["25/45", "5/9", "1/2", "3/5"],
      "answer": "25/45"
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 9?",
      "options": ["1/4", "1/3", "1/5", "1/6"],
      "answer": "1/4"
    },
    {
      "question":
          "10. The median of {3, 4, 5, 6, 7, 8, 9, 10, 11} is:",
      "options": ["6", "7", "6.5", "7.5"],
      "answer": "7",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 19"),
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
