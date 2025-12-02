import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise4 extends StatefulWidget {
  const CoordinateGeometryEasyPractise4({super.key});

  @override
  State<CoordinateGeometryEasyPractise4> createState() =>
      _CoordinateGeometryEasyPractise4State();
}

class _CoordinateGeometryEasyPractise4State
    extends State<CoordinateGeometryEasyPractise4> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Find the distance between the points (1, 2) and (4, 6).',
      'options': ['5', '6', '7', '4'],
      'correctIndex': 0,
      'hint': 'Use distance formula: √[(x₂−x₁)² + (y₂−y₁)²]',
      'explanation': '√[(4−1)² + (6−2)²] = √[9+16] = √25 = 5.'
    },
    {
      'question': '2. Find the midpoint of the line joining (2, 3) and (4, 7).',
      'options': ['(3, 5)', '(2, 4)', '(4, 6)', '(3, 4)'],
      'correctIndex': 0,
      'hint': 'Midpoint = ((x₁+x₂)/2 , (y₁+y₂)/2)',
      'explanation': 'Midpoint = ((2+4)/2, (3+7)/2) = (3, 5).'
    },
    {
      'question': '3. What is the slope of the line joining (1, 2) and (3, 6)?',
      'options': ['1', '2', '3', '4'],
      'correctIndex': 1,
      'hint': 'Slope = (y₂−y₁)/(x₂−x₁)',
      'explanation': 'Slope = (6−2)/(3−1) = 4/2 = 2.'
    },
    {
      'question': '4. If a line passes through (0, 5) and (2, 9), find its equation.',
      'options': ['y = 2x + 5', 'y = 3x + 5', 'y = 2x + 4', 'y = 3x − 1'],
      'correctIndex': 0,
      'hint': 'Equation: y − y₁ = m(x − x₁)',
      'explanation': 'Slope = (9−5)/(2−0)=2 → y − 5 = 2(x − 0) → y = 2x + 5.'
    },
    {
      'question': '5. What is the distance between points (−2, 1) and (1, 5)?',
      'options': ['3', '4', '5', '6'],
      'correctIndex': 2,
      'hint': 'Use distance formula: √[(x₂−x₁)² + (y₂−y₁)²]',
      'explanation': 'Distance = √[(1−(−2))² + (5−1)²] = √[9+16] = √25 = 5.'
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
          content: const Text(
              'You have finished all Coordinate Geometry Easy Practise 4 questions!'),
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
          'Coordinate Geometry - Easy Practise 4',
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
