import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise21 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise21({super.key});

  @override
  State<ProbabilityStatisticsHardPractise21> createState() =>
      _ProbabilityStatisticsHardPractise21State();
}

class _ProbabilityStatisticsHardPractise21State
    extends State<ProbabilityStatisticsHardPractise21> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 20 red, 10 blue, and 10 green marbles. Six marbles are drawn without replacement. What is the probability that three are red and two are green?",
      "options": ["1140/5600", "1120/5600", "1100/5600", "1150/5600"],
      "answer": "1140/5600"
    },
    {
      "question":
          "2. A die is rolled eight times. What is the probability of getting exactly three 2s and exactly two 5s?",
      "options": ["560/1679616", "570/1679616", "550/1679616", "580/1679616"],
      "answer": "560/1679616"
    },
    {
      "question":
          "3. In a class of 70 students, 35 are girls. If four students are selected randomly without replacement, what is the probability that exactly three are girls?",
      "options": ["595/91390", "600/91390", "590/91390", "605/91390"],
      "answer": "595/91390"
    },
    {
      "question":
          "4. The data set is {12, 13, 14, 15, 15, 16, 17, 18, 18, 19, 20, 21, 22}. What is the interquartile range (IQR)?",
      "options": ["7", "6", "8", "5"],
      "answer": "7"
    },
    {
      "question":
          "5. A coin is flipped seventeen times. What is the probability of getting exactly fourteen heads?",
      "options": ["680/131072", "670/131072", "690/131072", "675/131072"],
      "answer": "680/131072"
    },
    {
      "question":
          "6. A spinner has numbers 1–108. What is the probability of spinning a number divisible by 9 or 12?",
      "options": ["36/108", "35/108", "37/108", "34/108"],
      "answer": "36/108"
    },
    {
      "question":
          "7. The mean of 25 numbers is 70. If 24 numbers are 69, 71, 70, 72, 70, 73, 68, 71, 70, 72, 69, 73, 68, 71, 70, 72, 69, 74, 68, 71, 70, 72, 69, 73, what is the 25th number?",
      "options": ["70", "71", "69", "72"],
      "answer": "70"
    },
    {
      "question":
          "8. A number from 1 to 260 is chosen randomly. What is the probability that it is divisible by 11 or 13?",
      "options": ["44/260", "45/260", "43/260", "46/260"],
      "answer": "44/260"
    },
    {
      "question":
          "9. The set of scores is {82, 84, 86, 88, 90, 92, 94, 96, 98, 100, 102, 104, 106, 108, 110}. What is the approximate standard deviation?",
      "options": ["10.0", "10.2", "9.8", "9.5"],
      "answer": "10.0"
    },
    {
      "question":
          "10. A die is rolled six times. What is the probability that exactly four rolls show numbers greater than 4?",
      "options": ["80/243", "81/243", "78/243", "82/243"],
      "answer": "80/243"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 21"),
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
