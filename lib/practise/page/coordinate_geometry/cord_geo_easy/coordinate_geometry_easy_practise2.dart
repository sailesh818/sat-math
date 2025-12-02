import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise2 extends StatefulWidget {
  const CoordinateGeometryEasyPractise2({super.key});

  @override
  State<CoordinateGeometryEasyPractise2> createState() =>
      _CoordinateGeometryEasyPractise2State();
}

class _CoordinateGeometryEasyPractise2State
    extends State<CoordinateGeometryEasyPractise2> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of the line passing through the points (3, 4) and (9, 10).',
      'options': ['1', '1.5', '2', '3'],
      'correctIndex': 0,
      'hint': 'Slope = (y₂−y₁)/(x₂−x₁)',
      'explanation': 'Slope = (10 − 4) / (9 − 3) = 6 / 6 = 1.'
    },
    {
      'question': '2. The line joining (2, 3) and (8, k) has a slope of 1. Find k.',
      'options': ['7', '8', '9', '10'],
      'correctIndex': 2,
      'hint': 'Slope formula: (k−3)/(8−2) = 1',
      'explanation':
          'Slope = (k − 3) / (8 − 2) = 1 → k − 3 = 6 → k = 9.'
    },
    {
      'question': '3. Find the distance between points (1, 1) and (4, 5).',
      'options': ['4', '5', '6', '7'],
      'correctIndex': 1,
      'hint': 'Distance = √((x₂−x₁)² + (y₂−y₁)²)',
      'explanation':
          'Distance = √((4−1)² + (5−1)²) = √(9 + 16) = √25 = 5.'
    },
    {
      'question':
          '4. What is the midpoint of the line segment joining (2, 7) and (10, 3)?',
      'options': ['(5,6)', '(6,5)', '(7,4)', '(8,3)'],
      'correctIndex': 1,
      'hint': 'Midpoint = ((x₁+x₂)/2 , (y₁+y₂)/2)',
      'explanation': 'Midpoint = ((2+10)/2, (7+3)/2) = (6, 5).'
    },
    {
      'question':
          '5. Find the coordinates of the centroid of a triangle with vertices (0, 0), (6, 0), and (3, 6).',
      'options': ['(3,2)', '(3,3)', '(2,3)', '(4,4)'],
      'correctIndex': 0,
      'hint': 'Centroid = ((x₁+x₂+x₃)/3 , (y₁+y₂+y₃)/3)',
      'explanation':
          'Centroid = ((0+6+3)/3, (0+0+6)/3) = (3, 2).'
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
              child: const Text('OK'),
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
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text(
          'Coordinate Geometry - Easy Practise 2',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.green,
              backgroundColor: Colors.green.shade100,
            ),
            const SizedBox(height: 20),
            // Question Card
            Card(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Options
            ...List.generate(question['options'].length, (index) {
              final option = question['options'][index];
              final isSelected = selectedAnswerIndex == index;
              final isCorrect =
                  answerChecked && index == question['correctIndex'];
              final isWrong =
                  answerChecked && isSelected && !isCorrect;

              return Card(
                color: isCorrect
                    ? Colors.green.shade100
                    : isWrong
                        ? Colors.red.shade100
                        : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text(option),
                  onTap: () => checkAnswer(index),
                ),
              );
            }),
            const SizedBox(height: 10),
            // Hint Button
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
                  label: const Text(
                    "Hint",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                child: Text(
                  question['hint'],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            const SizedBox(height: 20),
            // Explanation
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Explanation: ${question['explanation']}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            const SizedBox(height: 20),
            // Next Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1
                      ? 'Finish'
                      : 'Next Question',
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
