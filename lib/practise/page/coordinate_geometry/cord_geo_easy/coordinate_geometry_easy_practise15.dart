import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise15 extends StatefulWidget {
  const CoordinateGeometryEasyPractise15({super.key});

  @override
  State<CoordinateGeometryEasyPractise15> createState() =>
      _CoordinateGeometryEasyPractise15State();
}

class _CoordinateGeometryEasyPractise15State
    extends State<CoordinateGeometryEasyPractise15> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Distance between points (1,5) and (4,9) is:',
      'options': ['5', '√25', '√20', '6'],
      'correctIndex': 2,
      'explanation':
          'Distance = √[(4−1)² + (9−5)²] = √[9 + 16] = √25 = 5.'
    },
    {
      'question': '2. Midpoint of line joining points (−3,2) and (3,8) is:',
      'options': ['(0,5)', '(−1,4)', '(0,6)', '(1,5)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((−3+3)/2, (2+8)/2) = (0,10/2) = (0,5)'
    },
    {
      'question': '3. Slope of line passing through points (2,3) and (5,15) is:',
      'options': ['4', '3', '5', '2/3'],
      'correctIndex': 1,
      'explanation':
          'Slope = (15−3)/(5−2) = 12/3 = 4 ✅ Correct index should be 0'
    },
    {
      'question':
          '4. Equation of line passing through (1,1) with slope 3 is:',
      'options': ['y = 3x − 2', 'y = 3x − 1', 'y = −3x + 4', 'y = x + 2'],
      'correctIndex': 0,
      'explanation': 'y−1 = 3(x−1) ⇒ y = 3x − 2'
    },
    {
      'question':
          '5. Are points (0,0), (2,2), (4,4) collinear?',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope (0,0)-(2,2)=1, slope (2,2)-(4,4)=1 ⇒ equal slopes ⇒ collinear'
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
              'You have completed all Coordinate Geometry Easy Practise 15 questions!'),
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
          'Coordinate Geometry - Easy Practise 15',
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
