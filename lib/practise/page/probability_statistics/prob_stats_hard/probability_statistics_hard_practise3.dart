import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise3 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise3({super.key});

  @override
  State<ProbabilityStatisticsHardPractise3> createState() =>
      _ProbabilityStatisticsHardPractise3State();
}

class _ProbabilityStatisticsHardPractise3State
    extends State<ProbabilityStatisticsHardPractise3> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A box contains 3 red, 4 blue, and 5 green balls. Four balls are drawn without replacement. What is the probability of drawing exactly two green balls?",
      "options": ["15/33", "25/66", "10/33", "20/66"],
      "answer": "25/66"
    },
    {
      "question":
          "2. A die is rolled five times. What is the probability of getting exactly two 6s?",
      "options": ["125/7776", "250/7776", "625/7776", "100/7776"],
      "answer": "250/7776"
    },
    {
      "question":
          "3. In a class of 40 students, 22 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["253/988", "231/988", "210/988", "220/988"],
      "answer": "253/988"
    },
    {
      "question":
          "4. The data set is {5, 6, 7, 7, 8, 9, 10, 10, 11, 12}. What is the interquartile range (IQR)?",
      "options": ["4", "5", "3", "6"],
      "answer": "4"
    },
    {
      "question":
          "5. A coin is flipped six times. What is the probability of getting at least four heads?",
      "options": ["22/64", "20/64", "15/64", "18/64"],
      "answer": "22/64"
    },
    {
      "question":
          "6. A spinner numbered 1–18 is spun. What is the probability of landing on a prime number or a multiple of 3?",
      "options": ["11/18", "2/3", "10/18", "1/2"],
      "answer": "11/18"
    },
    {
      "question":
          "7. The mean of twelve numbers is 50. If eleven numbers are 48, 52, 49, 51, 50, 53, 47, 52, 50, 51, 49, what is the twelfth number?",
      "options": ["50", "51", "49", "52"],
      "answer": "50"
    },
    {
      "question":
          "8. A number from 1 to 72 is chosen randomly. What is the probability that it is divisible by 8 or 9?",
      "options": ["19/72", "18/72", "20/72", "17/72"],
      "answer": "19/72"
    },
    {
      "question":
          "9. The set of test scores is {68, 70, 72, 75, 78, 80, 83, 85, 88, 90, 92}. What is the approximate standard deviation?",
      "options": ["7.5", "8", "8.5", "9"],
      "answer": "8.5"
    },
    {
      "question":
          "10. A die is rolled three times. What is the probability that the first roll is less than the second, and the second is less than the third?",
      "options": ["5/36", "1/6", "1/12", "7/36"],
      "answer": "5/36"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 3"),
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
