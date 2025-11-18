import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise18 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise18({super.key});

  @override
  State<ProbabilityStatisticsHardPractise18> createState() =>
      _ProbabilityStatisticsHardPractise18State();
}

class _ProbabilityStatisticsHardPractise18State
    extends State<ProbabilityStatisticsHardPractise18> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 10 red, 6 blue, and 4 green marbles. Five marbles are drawn without replacement. What is the probability that two are red and one is green?",
      "options": ["120/380", "118/380", "115/380", "122/380"],
      "answer": "120/380"
    },
    {
      "question":
          "2. A die is rolled six times. What is the probability of getting exactly three 5s and exactly two 2s?",
      "options": ["150/7776", "155/7776", "145/7776", "160/7776"],
      "answer": "150/7776"
    },
    {
      "question":
          "3. In a class of 62 students, 28 are boys. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "answer": "231/19600"
    },
    {
      "question":
          "4. The data set is {9, 10, 11, 12, 12, 13, 14, 15, 15, 16, 17, 18, 19}. What is the interquartile range (IQR)?",
      "options": ["6", "5", "7", "4"],
      "answer": "6"
    },
    {
      "question":
          "5. A coin is flipped fourteen times. What is the probability of getting exactly eleven heads?",
      "options": ["364/16384", "360/16384", "370/16384", "350/16384"],
      "answer": "364/16384"
    },
    {
      "question":
          "6. A spinner has numbers 1–72. What is the probability of spinning a number divisible by 6 or 8?",
      "options": ["27/72", "26/72", "28/72", "25/72"],
      "answer": "27/72"
    },
    {
      "question":
          "7. The mean of 22 numbers is 66. If 21 numbers are 65, 67, 66, 68, 66, 69, 64, 67, 66, 68, 65, 69, 64, 67, 66, 68, 65, 70, 64, 67, 66, what is the 22nd number?",
      "options": ["66", "67", "65", "68"],
      "answer": "66"
    },
    {
      "question":
          "8. A number from 1 to 220 is chosen randomly. What is the probability that it is divisible by 11 or 12?",
      "options": ["37/220", "36/220", "38/220", "35/220"],
      "answer": "37/220"
    },
    {
      "question":
          "9. The set of scores is {75, 77, 79, 81, 83, 85, 87, 89, 91, 93, 95, 97, 99, 101, 103}. What is the approximate standard deviation?",
      "options": ["9.8", "10.0", "9.5", "9.2"],
      "answer": "9.8"
    },
    {
      "question":
          "10. A die is rolled five times. What is the probability that exactly four rolls show prime numbers?",
      "options": ["16/243", "15/243", "17/243", "18/243"],
      "answer": "16/243"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 18"),
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
