import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise14 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise14({super.key});

  @override
  State<ProbabilityStatisticsHardPractise14> createState() =>
      _ProbabilityStatisticsHardPractise14State();
}

class _ProbabilityStatisticsHardPractise14State
    extends State<ProbabilityStatisticsHardPractise14> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 8 red, 5 blue, and 7 green marbles. Four marbles are drawn without replacement. What is the probability that two are red and one is green?",
      "options": ["56/210", "60/210", "50/210", "55/210"],
      "answer": "56/210"
    },
    {
      "question":
          "2. A die is rolled five times. What is the probability of getting exactly two 1s and exactly one 6?",
      "options": ["80/7776", "85/7776", "75/7776", "90/7776"],
      "answer": "80/7776"
    },
    {
      "question":
          "3. In a class of 56 students, 24 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are boys?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "answer": "231/19600"
    },
    {
      "question":
          "4. The data set is {9, 10, 10, 11, 12, 13, 14, 15, 15, 16, 17, 18}. What is the interquartile range (IQR)?",
      "options": ["6", "5", "7", "4"],
      "answer": "6"
    },
    {
      "question":
          "5. A coin is flipped twelve times. What is the probability of getting exactly ten heads?",
      "options": ["66/4096", "70/4096", "60/4096", "68/4096"],
      "answer": "66/4096"
    },
    {
      "question":
          "6. A spinner has numbers 1–50. What is the probability of spinning a number divisible by 5 or 8?",
      "options": ["21/50", "22/50", "23/50", "20/50"],
      "answer": "21/50"
    },
    {
      "question":
          "7. The mean of 18 numbers is 63. If 17 numbers are 62, 64, 61, 65, 63, 66, 60, 64, 63, 65, 62, 67, 61, 64, 63, 65, 62, what is the 18th number?",
      "options": ["63", "64", "62", "65"],
      "answer": "63"
    },
    {
      "question":
          "8. A number from 1 to 180 is chosen randomly. What is the probability that it is divisible by 7 or 9?",
      "options": ["43/180", "45/180", "41/180", "40/180"],
      "answer": "43/180"
    },
    {
      "question":
          "9. The set of scores is {70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96}. What is the approximate standard deviation?",
      "options": ["9.0", "9.5", "8.5", "10.0"],
      "answer": "9.0"
    },
    {
      "question":
          "10. A die is rolled four times. What is the probability that exactly three rolls show odd numbers?",
      "options": ["27/64", "28/64", "26/64", "25/64"],
      "answer": "27/64"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 14"),
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
