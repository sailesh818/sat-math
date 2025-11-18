import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise2 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise2({super.key});

  @override
  State<ProbabilityStatisticsHardPractise2> createState() =>
      _ProbabilityStatisticsHardPractise2State();
}

class _ProbabilityStatisticsHardPractise2State
    extends State<ProbabilityStatisticsHardPractise2> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 4 red, 5 blue, and 6 green marbles. Three marbles are drawn without replacement. What is the probability that exactly two are blue?",
      "options": ["25/91", "20/91", "10/91", "15/91"],
      "answer": "25/91"
    },
    {
      "question":
          "2. A fair die is rolled four times. What is the probability of getting exactly one 6?",
      "options": ["125/1296", "250/1296", "75/1296", "100/1296"],
      "answer": "250/1296"
    },
    {
      "question":
          "3. In a class of 50 students, 18 are girls. If three students are selected randomly without replacement, what is the probability all are boys?",
      "options": ["32*31*30/50*49*48", "18/50", "32/50", "31/49"],
      "answer": "32*31*30/50*49*48"
    },
    {
      "question":
          "4. The data set is {4, 5, 5, 6, 7, 8, 8, 9, 10, 10, 11}. What is the interquartile range (IQR)?",
      "options": ["4", "5", "6", "3"],
      "answer": "4"
    },
    {
      "question":
          "5. A coin is flipped five times. What is the probability of getting at least three heads?",
      "options": ["16/32", "10/32", "26/32", "12/32"],
      "answer": "16/32"
    },
    {
      "question":
          "6. A spinner has numbers 1–20. What is the probability of spinning a multiple of 3 or 5?",
      "options": ["13/20", "3/5", "12/20", "2/5"],
      "answer": "13/20"
    },
    {
      "question":
          "7. The mean of ten numbers is 30. If nine numbers are 28, 29, 31, 32, 30, 33, 27, 31, 30, what is the tenth number?",
      "options": ["30", "31", "29", "32"],
      "answer": "30"
    },
    {
      "question":
          "8. A number from 1 to 60 is chosen randomly. What is the probability that it is divisible by 4 or 6?",
      "options": ["26/60", "24/60", "25/60", "28/60"],
      "answer": "26/60"
    },
    {
      "question":
          "9. The set of exam scores is {70, 72, 75, 78, 80, 82, 85, 88, 90, 95, 98}. What is the approximate standard deviation?",
      "options": ["8.5", "9", "7.5", "10"],
      "answer": "8.5"
    },
    {
      "question":
          "10. A die is rolled three times. What is the probability that no number is repeated?",
      "options": ["5/12", "25/36", "120/216", "7/12"],
      "answer": "5/12"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 2"),
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
