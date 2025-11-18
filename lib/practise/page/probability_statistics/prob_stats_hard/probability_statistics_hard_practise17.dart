import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise17 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise17({super.key});

  @override
  State<ProbabilityStatisticsHardPractise17> createState() =>
      _ProbabilityStatisticsHardPractise17State();
}

class _ProbabilityStatisticsHardPractise17State
    extends State<ProbabilityStatisticsHardPractise17> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 9 red, 6 blue, and 5 green marbles. Five marbles are drawn without replacement. What is the probability that three are red and one is blue?",
      "options": ["84/380", "85/380", "80/380", "82/380"],
      "answer": "84/380"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting exactly two 6s and one 3?",
      "options": ["90/7776", "85/7776", "95/7776", "80/7776"],
      "answer": "90/7776"
    },
    {
      "question":
          "3. In a class of 58 students, 26 are girls. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "answer": "231/19600"
    },
    {
      "question":
          "4. The data set is {8, 9, 10, 10, 11, 12, 13, 14, 14, 15, 16, 17, 18}. What is the interquartile range (IQR)?",
      "options": ["6", "5", "7", "4"],
      "answer": "6"
    },
    {
      "question":
          "5. A coin is flipped thirteen times. What is the probability of getting exactly ten heads?",
      "options": ["286/8192", "280/8192", "290/8192", "300/8192"],
      "answer": "286/8192"
    },
    {
      "question":
          "6. A spinner has numbers 1–60. What is the probability of spinning a number divisible by 4 or 5?",
      "options": ["33/60", "32/60", "34/60", "31/60"],
      "answer": "33/60"
    },
    {
      "question":
          "7. The mean of 21 numbers is 65. If 20 numbers are 64, 66, 65, 67, 65, 68, 63, 66, 65, 67, 64, 69, 62, 66, 65, 67, 64, 68, 63, 66, what is the 21st number?",
      "options": ["65", "66", "64", "67"],
      "answer": "65"
    },
    {
      "question":
          "8. A number from 1 to 210 is chosen randomly. What is the probability that it is divisible by 7 or 10?",
      "options": ["57/210", "55/210", "56/210", "58/210"],
      "answer": "57/210"
    },
    {
      "question":
          "9. The set of scores is {72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100}. What is the approximate standard deviation?",
      "options": ["9.6", "9.5", "10.0", "9.0"],
      "answer": "9.6"
    },
    {
      "question":
          "10. A die is rolled five times. What is the probability that exactly three rolls show odd numbers?",
      "options": ["80/243", "81/243", "85/243", "75/243"],
      "answer": "80/243"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 17"),
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
