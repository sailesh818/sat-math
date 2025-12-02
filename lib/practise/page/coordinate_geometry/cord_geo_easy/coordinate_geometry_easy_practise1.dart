import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise1 extends StatefulWidget {
  const CoordinateGeometryEasyPractise1({super.key});

  @override
  State<CoordinateGeometryEasyPractise1> createState() =>
      _CoordinateGeometryEasyPractise1State();
}

class _CoordinateGeometryEasyPractise1State
    extends State<CoordinateGeometryEasyPractise1> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Find the distance between the points (2, 3) and (7, 11).',
      'options': ['7', '8', '9', '10'],
      'correctIndex': 2,
      'hint': 'Use distance formula: √((x₂−x₁)² + (y₂−y₁)²).',
      'explanation':
          'Distance = √((7−2)² + (11−3)²) = √(25 + 64) = √89 ≈ 9.43 → closest option is 9.'
    },
    {
      'question': '2. Find the midpoint of the line joining (4, 2) and (8, 6).',
      'options': ['(5,3)', '(6,4)', '(7,5)', '(8,6)'],
      'correctIndex': 1,
      'hint': 'Midpoint = ((x₁+x₂)/2 , (y₁+y₂)/2)',
      'explanation': 'Midpoint = ((4+8)/2 , (2+6)/2) = (6,4)'
    },
    {
      'question': '3. What is the slope of the line joining (2, 5) and (6, 13)?',
      'options': ['1', '2', '3', '4'],
      'correctIndex': 1,
      'hint': 'Slope = (y₂−y₁)/(x₂−x₁)',
      'explanation': 'Slope = (13−5)/(6−2) = 8/4 = 2'
    },
    {
      'question':
          '4. The line joining (1,2) and (5, k) has slope 1. Find the value of k.',
      'options': ['3', '4', '5', '6'],
      'correctIndex': 3,
      'hint': 'Slope = (k−2)/(5−1) = (k−2)/4',
      'explanation': '(k−2)/4 = 1 → k = 6'
    },
    {
      'question':
          '5. Find the centroid of triangle with vertices (1,2), (3,4), (5,6).',
      'options': ['(3,4)', '(2,3)', '(4,5)', '(5,5)'],
      'correctIndex': 0,
      'hint': 'Centroid = ((x₁+x₂+x₃)/3 , (y₁+y₂+y₃)/3)',
      'explanation': 'Centroid = ((1+3+5)/3 , (2+4+6)/3) = (3,4)'
    },
  ];

  void checkAnswer(int index) {
    if (!answerChecked) {
      setState(() {
        selectedAnswerIndex = index;
        answerChecked = true;
      });
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        answerChecked = false;
        showHint = false;
      });
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text('🎯 Practice Completed!'),
          content: const Text('You have completed all practise questions!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  currentQuestionIndex = 0;
                  selectedAnswerIndex = null;
                  answerChecked = false;
                  showHint = false;
                });
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: const Text(
          'Coordinate Geometry - Practise 1',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.lightBlue,
              backgroundColor: Colors.lightBlue.shade100,
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(question['options'].length, (index) {
              final option = question['options'][index];
              final isSelected = selectedAnswerIndex == index;
              final isCorrect =
                  answerChecked && index == question['correctIndex'];
              final isWrong = answerChecked && isSelected && !isCorrect;

              return Card(
                color: isCorrect
                    ? Colors.lightGreen.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    child: Text("${index + 1}",
                        style: const TextStyle(color: Colors.white)),
                  ),
                  title: Text(option, style: const TextStyle(fontSize: 17)),
                  onTap: () => checkAnswer(index),
                ),
              );
            }),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      showHint = !showHint;
                    });
                  },
                  icon: const Icon(Icons.lightbulb_outline, color: Colors.white),
                  label: const Text("Hint",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ],
            ),
            if (showHint)
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(question['hint'], style: const TextStyle(fontSize: 16)),
              ),
            const SizedBox(height: 20),
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("Explanation: ${question['explanation']}",
                    style: const TextStyle(fontSize: 16)),
              ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1
                      ? "Finish"
                      : "Next Question",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
