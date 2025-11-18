import 'package:flutter/material.dart';

class ProbabilityStatisticsMediumPractise16 extends StatefulWidget {
  const ProbabilityStatisticsMediumPractise16({super.key});

  @override
  State<ProbabilityStatisticsMediumPractise16> createState() =>
      _ProbabilityStatisticsMediumPractise16State();
}

class _ProbabilityStatisticsMediumPractise16State
    extends State<ProbabilityStatisticsMediumPractise16> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 4 red, 5 blue, and 6 green marbles. Two marbles are drawn without replacement. What is the probability that both are green?",
      "options": ["5/91", "2/15", "1/6", "1/5"],
      "answer": "5/91"
    },
    {
      "question":
          "2. The mean of six numbers is 16. If five numbers are 15, 17, 16, 18, and 16, what is the sixth number?",
      "options": ["16", "15", "17", "18"],
      "answer": "16"
    },
    {
      "question":
          "3. A fair die is rolled three times. What is the probability of rolling exactly one 6?",
      "options": ["75/216", "125/216", "91/216", "5/36"],
      "answer": "75/216"
    },
    {
      "question":
          "4. The data set is {3, 4, 4, 5, 6, 6, 7}. What is the mode?",
      "options": ["4", "5", "6", "7"],
      "answer": "4"
    },
    {
      "question":
          "5. A coin is flipped four times. What is the probability of getting exactly two heads?",
      "options": ["3/8", "1/2", "1/4", "1/16"],
      "answer": "3/8"
    },
    {
      "question":
          "6. The range of {5, 8, 10, 12, 15} is:",
      "options": ["10", "9", "12", "11"],
      "answer": "10"
    },
    {
      "question":
          "7. A spinner with numbers 1–18 is spun. What is the probability of landing on a multiple of 6?",
      "options": ["1/3", "1/6", "1/2", "2/3"],
      "answer": "1/3"
    },
    {
      "question":
          "8. In a class of 48 students, 20 are girls. If a student is selected randomly, what is the probability it is a boy?",
      "options": ["28/48", "7/12", "1/2", "3/5"],
      "answer": "28/48"
    },
    {
      "question":
          "9. A number from 1 to 36 is chosen randomly. What is the probability it is divisible by 3?",
      "options": ["1/3", "1/4", "1/2", "1/5"],
      "answer": "1/3"
    },
    {
      "question":
          "10. The median of {2, 3, 5, 6, 7, 8, 10} is:",
      "options": ["6", "5", "6.5", "7"],
      "answer": "6",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Medium Practice 16"),
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
