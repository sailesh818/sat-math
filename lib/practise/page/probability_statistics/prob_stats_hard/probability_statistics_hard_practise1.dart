import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise1 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise1({super.key});

  @override
  State<ProbabilityStatisticsHardPractise1> createState() =>
      _ProbabilityStatisticsHardPractise1State();
}

class _ProbabilityStatisticsHardPractise1State
    extends State<ProbabilityStatisticsHardPractise1> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 6 blue, and 7 green marbles. Three marbles are drawn without replacement. What is the probability that exactly one marble of each color is drawn?",
      "options": ["35/153", "42/153", "7/51", "5/18"],
      "answer": "35/153"
    },
    {
      "question":
          "2. A die is rolled four times. What is the probability of getting exactly two 4s and two numbers greater than 4?",
      "options": ["25/1296", "50/1296", "75/1296", "100/1296"],
      "answer": "50/1296"
    },
    {
      "question":
          "3. In a class of 60 students, 28 are girls and 32 are boys. If two students are selected randomly without replacement, what is the probability both are girls?",
      "options": ["378/1770", "28/60", "14/30", "28/59"],
      "answer": "378/1770"
    },
    {
      "question":
          "4. The data set is {3, 4, 5, 5, 6, 7, 7, 8, 9, 10}. What is the interquartile range (IQR)?",
      "options": ["4", "3", "5", "6"],
      "answer": "4"
    },
    {
      "question":
          "5. A coin is flipped six times. What is the probability of getting at least 5 heads?",
      "options": ["7/64", "1/8", "3/32", "5/64"],
      "answer": "7/64"
    },
    {
      "question":
          "6. A spinner has numbers 1–12. What is the probability of spinning a prime number or a multiple of 4?",
      "options": ["7/12", "2/3", "3/4", "5/12"],
      "answer": "7/12"
    },
    {
      "question":
          "7. The mean of nine numbers is 24. If eight numbers are 22, 25, 23, 26, 24, 27, 23, 25, what is the ninth number?",
      "options": ["24", "25", "23", "26"],
      "answer": "24"
    },
    {
      "question":
          "8. A number from 1 to 50 is chosen randomly. What is the probability that it is divisible by 2 or 5?",
      "options": ["32/50", "33/50", "31/50", "30/50"],
      "answer": "32/50"
    },
    {
      "question":
          "9. The set of exam scores is {70, 72, 75, 78, 80, 85, 88, 90, 92, 95}. What is the standard deviation approximately?",
      "options": ["7.5", "8.5", "9", "6.5"],
      "answer": "7.5"
    },
    {
      "question":
          "10. A die is rolled three times. What is the probability that all rolls show different numbers?",
      "options": ["5/12", "25/36", "120/216", "5/18"],
      "answer": "5/12"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 1"),
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
