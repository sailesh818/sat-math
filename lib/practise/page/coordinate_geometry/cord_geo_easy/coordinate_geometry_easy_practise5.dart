import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise5 extends StatefulWidget {
  const CoordinateGeometryEasyPractise5({super.key});

  @override
  State<CoordinateGeometryEasyPractise5> createState() =>
      _CoordinateGeometryEasyPractise5State();
}

class _CoordinateGeometryEasyPractise5State
    extends State<CoordinateGeometryEasyPractise5> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. The point dividing the line joining A(2, 3) and B(8, 9) in the ratio 1:2 internally is:',
      'options': ['(4, 5)', '(6, 7)', '(8, 8)', '(5, 6)'],
      'correctIndex': 3,
      'explanation':
          'Using section formula: ((2×8 + 1×2)/(1+2), (2×9 + 1×3)/(1+2)) = (18/3, 21/3) = (6, 7).'
    },
    {
      'question':
          '2. Find the centroid of the triangle with vertices (0, 0), (6, 0), and (0, 6).',
      'options': ['(3, 2)', '(2, 3)', '(3, 3)', '(4, 2)'],
      'correctIndex': 2,
      'explanation':
          'Centroid = ((x₁ + x₂ + x₃)/3, (y₁ + y₂ + y₃)/3) = (6/3, 6/3) = (3, 3).'
    },
    {
      'question':
          '3. The area of the triangle formed by (0, 0), (4, 0), and (0, 3) is:',
      'options': ['5', '6', '7', '8'],
      'correctIndex': 1,
      'explanation':
          'Area = ½ × base × height = ½ × 4 × 3 = 6 square units.'
    },
    {
      'question':
          '4. Check if the points (1, 2), (3, 6), and (5, 10) are collinear.',
      'options': ['Yes', 'No', 'Can’t say', 'Depends on scale'],
      'correctIndex': 0,
      'explanation':
          'Slope of AB = (6−2)/(3−1) = 2; slope of BC = (10−6)/(5−3) = 2 ⇒ equal slopes ⇒ collinear.'
    },
    {
      'question':
          '5. Find the distance between the parallel lines 3x − 4y + 6 = 0 and 3x − 4y − 2 = 0.',
      'options': ['1', '2', '3/2', '4/√5'],
      'correctIndex': 3,
      'explanation':
          'Distance = |c₁−c₂| / √(a²+b²) = |6−(−2)| / √(3²+ (−4)²) = 8 / 5^0.5 = 4/√5.'
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
          title: const Text('🎉 Great Work!'),
          content: const Text(
              'You have completed all Coordinate Geometry Easy Practise 5 questions!'),
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
          'Coordinate Geometry - Easy Practise 5',
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
            // Question
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
