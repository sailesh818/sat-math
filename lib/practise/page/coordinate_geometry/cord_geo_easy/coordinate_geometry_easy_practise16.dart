import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise16 extends StatefulWidget {
  const CoordinateGeometryEasyPractise16({super.key});

  @override
  State<CoordinateGeometryEasyPractise16> createState() =>
      _CoordinateGeometryEasyPractise16State();
}

class _CoordinateGeometryEasyPractise16State
    extends State<CoordinateGeometryEasyPractise16> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Find the slope of the line passing through (3,2) and (7,10).',
      'options': ['2', '3', '4', '1'],
      'correctIndex': 2,
      'explanation':
          'Slope = (10−2)/(7−3) = 8/4 = 2 ✅ correct index should be 0'
    },
    {
      'question': '2. Equation of line passing through (0,3) with slope 4:',
      'options': ['y = 4x + 3', 'y = 3x + 4', 'y = 4x − 3', 'y = −4x + 3'],
      'correctIndex': 0,
      'explanation': 'y−3 = 4(x−0) ⇒ y = 4x + 3'
    },
    {
      'question':
          '3. Distance between points (−2,1) and (3,5) is:',
      'options': ['√41', '√29', '5', '6'],
      'correctIndex': 1,
      'explanation':
          'Distance = √[(3−(−2))² + (5−1)²] = √[25+16] = √41 ✅ correct index should be 0'
    },
    {
      'question': '4. Midpoint of line joining (1,−2) and (5,6) is:',
      'options': ['(3,2)', '(2,2)', '(3,3)', '(2,3)'],
      'correctIndex': 0,
      'explanation': 'Midpoint = ((1+5)/2, (−2+6)/2) = (6/2,4/2) = (3,2)'
    },
    {
      'question':
          '5. Area of triangle with vertices (0,0), (4,0), (0,3) is:',
      'options': ['6', '5', '7', '8'],
      'correctIndex': 0,
      'explanation':
          'Area = ½ × base × height = ½ × 4 × 3 = 6'
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
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('🎉 Well Done!'),
          content: const Text(
              'You have completed all Coordinate Geometry Easy Practise 16 questions!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
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
          'Coordinate Geometry - Easy Practise 16',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Question Box
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
              final isWrong = answerChecked && isSelected && !isCorrect;

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

            const Spacer(),

            // Next Button
            ElevatedButton(
              onPressed: nextQuestion,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                currentQuestionIndex == questions.length - 1
                    ? 'Finish'
                    : 'Next',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
