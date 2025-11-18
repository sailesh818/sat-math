import 'package:flutter/material.dart';

class ProbabilityStatisticsHardPractise4 extends StatefulWidget {
  const ProbabilityStatisticsHardPractise4({super.key});

  @override
  State<ProbabilityStatisticsHardPractise4> createState() =>
      _ProbabilityStatisticsHardPractise4State();
}

class _ProbabilityStatisticsHardPractise4State
    extends State<ProbabilityStatisticsHardPractise4> {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "1. A bag contains 5 red, 6 blue, and 4 green balls. Three balls are drawn without replacement. What is the probability that at least two are blue?",
      "options": ["25/91", "20/91", "15/91", "30/91"],
      "answer": "25/91"
    },
    {
      "question":
          "2. A die is rolled four times. What is the probability of getting at least three 5s?",
      "options": ["11/1296", "16/1296", "31/1296", "41/1296"],
      "answer": "31/1296"
    },
    {
      "question":
          "3. In a class of 60 students, 24 are girls. If three students are selected randomly without replacement, what is the probability that exactly one is a girl?",
      "options": ["28/57", "27/57", "24/57", "30/57"],
      "answer": "28/57"
    },
    {
      "question":
          "4. The data set is {4, 5, 6, 6, 7, 8, 8, 9, 10, 11, 12}. What is the interquartile range (IQR)?",
      "options": ["4", "5", "6", "3"],
      "answer": "4"
    },
    {
      "question":
          "5. A coin is flipped seven times. What is the probability of getting exactly four heads?",
      "options": ["35/128", "21/128", "70/128", "56/128"],
      "answer": "35/128"
    },
    {
      "question":
          "6. A spinner has numbers 1–24. What is the probability of spinning a prime number or a multiple of 4?",
      "options": ["14/24", "13/24", "12/24", "11/24"],
      "answer": "14/24"
    },
    {
      "question":
          "7. The mean of fifteen numbers is 40. If fourteen numbers are 38, 42, 39, 41, 40, 43, 37, 42, 40, 41, 39, 44, 36, 41, what is the fifteenth number?",
      "options": ["40", "41", "39", "42"],
      "answer": "40"
    },
    {
      "question":
          "8. A number from 1 to 90 is chosen randomly. What is the probability that it is divisible by 5 or 6?",
      "options": ["42/90", "40/90", "41/90", "44/90"],
      "answer": "42/90"
    },
    {
      "question":
          "9. The set of scores is {65, 68, 70, 73, 75, 78, 80, 82, 85, 88, 90}. What is the approximate standard deviation?",
      "options": ["8.0", "7.5", "9.0", "8.5"],
      "answer": "8.0"
    },
    {
      "question":
          "10. A die is rolled three times. What is the probability that the first roll is even, the second roll is odd, and the third roll is a multiple of 3?",
      "options": ["1/12", "1/9", "1/6", "1/8"],
      "answer": "1/12"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Probability & Statistics Hard Practice 4"),
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
