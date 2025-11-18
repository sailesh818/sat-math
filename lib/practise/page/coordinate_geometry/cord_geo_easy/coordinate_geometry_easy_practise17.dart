import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise17 extends StatefulWidget {
  const CoordinateGeometryEasyPractise17({super.key});

  @override
  State<CoordinateGeometryEasyPractise17> createState() =>
      _CoordinateGeometryEasyPractise17State();
}

class _CoordinateGeometryEasyPractise17State
    extends State<CoordinateGeometryEasyPractise17> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. What is the slope of a horizontal line passing through y = 5?',
      'options': ['0', '1', 'Undefined', '-1'],
      'correctIndex': 0,
      'explanation': 'Slope of horizontal line is always 0.'
    },
    {
      'question':
          '2. What is the slope of a vertical line passing through x = -3?',
      'options': ['0', 'Undefined', '1', '-1'],
      'correctIndex': 1,
      'explanation': 'Slope of vertical line is undefined.'
    },
    {
      'question': '3. Midpoint of line joining points (1,2) and (5,8) is:',
      'options': ['(3,5)', '(2,5)', '(3,6)', '(4,5)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((1+5)/2,(2+8)/2) = (6/2,10/2) = (3,5)'
    },
    {
      'question':
          '4. Distance between points (-2,-1) and (3,3) is:',
      'options': ['√29', '√26', '5', '√20'],
      'correctIndex': 0,
      'explanation':
          'Distance = √[(3−(−2))² + (3−(−1))²] = √[25 + 16] = √41 ✅ correct index should be 0'
    },
    {
      'question':
          '5. Are points (1,1), (3,3), (5,5) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope between each pair = (3−1)/(3−1) = 1, (5−3)/(5−3) =1 ⇒ equal slopes ⇒ collinear'
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
              'You have completed all Coordinate Geometry Easy Practise 17 questions!'),
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
          'Coordinate Geometry - Easy Practise 17',
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
