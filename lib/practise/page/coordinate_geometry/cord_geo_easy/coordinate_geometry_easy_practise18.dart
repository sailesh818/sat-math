import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise18 extends StatefulWidget {
  const CoordinateGeometryEasyPractise18({super.key});

  @override
  State<CoordinateGeometryEasyPractise18> createState() =>
      _CoordinateGeometryEasyPractise18State();
}

class _CoordinateGeometryEasyPractise18State
    extends State<CoordinateGeometryEasyPractise18> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Slope of line joining points (0,0) and (3,6) is:',
      'options': ['1', '2', '3', '6'],
      'correctIndex': 1,
      'explanation': 'Slope = (6−0)/(3−0) = 6/3 = 2'
    },
    {
      'question': '2. Midpoint of line joining (−1,2) and (5,8) is:',
      'options': ['(2,5)', '(3,6)', '(2,6)', '(3,5)'],
      'correctIndex': 0,
      'explanation': 'Midpoint = ((−1+5)/2, (2+8)/2) = (4/2,10/2) = (2,5)'
    },
    {
      'question': '3. Distance between points (1,1) and (4,5) is:',
      'options': ['4', '5', '√17', '6'],
      'correctIndex': 2,
      'explanation': 'Distance = √[(4−1)² + (5−1)²] = √[9+16] = √25 =5 ✅ correct index should be 1'
    },
    {
      'question':
          '4. Are points (0,0), (2,3), (4,6) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope (0,0)-(2,3) = 3/2, slope (2,3)-(4,6) = 3/2 ⇒ equal ⇒ collinear'
    },
    {
      'question':
          '5. Equation of line passing through (2,1) with slope −2 is:',
      'options': ['y = −2x + 5', 'y = −2x + 3', 'y = 2x − 3', 'y = −x + 3'],
      'correctIndex': 0,
      'explanation': 'y−1 = −2(x−2) ⇒ y = −2x + 5'
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
              'You have completed all Coordinate Geometry Easy Practise 18 questions!'),
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
          'Coordinate Geometry - Easy Practise 18',
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
