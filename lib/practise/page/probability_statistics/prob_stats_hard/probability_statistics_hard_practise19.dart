import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise19 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise19({super.key});

  @override
  State<ProbabilityStatisticsHardPractise19> createState() =>
      _ProbabilityStatisticsHardPractise19State();
}

class _ProbabilityStatisticsHardPractise19State
    extends State<ProbabilityStatisticsHardPractise19> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 12 red, 8 blue, and 6 green marbles. Five marbles are drawn without replacement. What is the probability that three are red and one is blue?",
      "options": ["144/560", "145/560", "140/560", "150/560"],
      "answer": "144/560"
    },
    {
      "question":
          "2. A die is rolled seven times. What is the probability of getting exactly three 3s and two 6s?",
      "options": ["210/279936", "220/279936", "205/279936", "215/279936"],
      "answer": "210/279936"
    },
    {
      "question":
          "3. In a class of 64 students, 30 are boys. If three students are selected randomly without replacement, what is the probability that exactly two are girls?",
      "options": ["231/19600", "220/19600", "245/19600", "210/19600"],
      "answer": "231/19600"
    },
    {
      "question":
          "4. The data set is {10, 11, 12, 13, 14, 15, 15, 16, 17, 18, 19, 20}. What is the interquartile range (IQR)?",
      "options": ["6", "5", "7", "4"],
      "answer": "6"
    },
    {
      "question":
          "5. A coin is flipped fifteen times. What is the probability of getting exactly twelve heads?",
      "options": ["455/32768", "460/32768", "450/32768", "440/32768"],
      "answer": "455/32768"
    },
    {
      "question":
          "6. A spinner has numbers 1–84. What is the probability of spinning a number divisible by 7 or 12?",
      "options": ["29/84", "30/84", "28/84", "31/84"],
      "answer": "29/84"
    },
    {
      "question":
          "7. The mean of 23 numbers is 67. If 22 numbers are 66, 68, 67, 69, 67, 70, 65, 68, 67, 69, 66, 70, 65, 68, 67, 69, 66, 71, 65, 68, 67, 69, what is the 23rd number?",
      "options": ["67", "68", "66", "69"],
      "answer": "67"
    },
    {
      "question":
          "8. A number from 1 to 240 is chosen randomly. What is the probability that it is divisible by 8 or 15?",
      "options": ["46/240", "45/240", "44/240", "47/240"],
      "answer": "46/240"
    },
    {
      "question":
          "9. The set of scores is {78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100, 102}. What is the approximate standard deviation?",
      "options": ["9.7", "9.5", "10.0", "9.2"],
      "answer": "9.7"
    },
    {
      "question":
          "10. A die is rolled five times. What is the probability that exactly two rolls show even numbers?",
      "options": ["80/243", "81/243", "78/243", "82/243"],
      "answer": "80/243"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 19"),
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
