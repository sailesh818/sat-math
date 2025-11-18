import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise14 extends StatefulWidget {
  const CoordinateGeometryEasyPractise14({super.key});

  @override
  State<CoordinateGeometryEasyPractise14> createState() =>
      _CoordinateGeometryEasyPractise14State();
}

class _CoordinateGeometryEasyPractise14State
    extends State<CoordinateGeometryEasyPractise14> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Midpoint of line joining points (2,3) and (6,7) is:',
      'options': ['(4,5)', '(3,4)', '(5,6)', '(2,5)'],
      'correctIndex': 0,
      'explanation': 'Midpoint = ((2+6)/2, (3+7)/2) = (8/2,10/2) = (4,5)'
    },
    {
      'question': '2. Distance between points (−1,4) and (3,0) is:',
      'options': ['4√2', '√32', '5', '√16'],
      'correctIndex': 1,
      'explanation':
          'Distance = √[(3−(−1))² + (0−4)²] = √[(4)² + (−4)²] = √(16+16) = √32'
    },
    {
      'question': '3. Slope of line passing through points (0,0) and (5,10) is:',
      'options': ['2', '0.5', '1', '−2'],
      'correctIndex': 0,
      'explanation': 'Slope = (10−0)/(5−0)=10/5=2'
    },
    {
      'question': '4. Equation of line with slope −1 passing through (2,3) is:',
      'options': ['y = −x + 5', 'y = −x + 1', 'y = x + 1', 'y = x − 2'],
      'correctIndex': 0,
      'explanation': 'y−3 = −1(x−2) ⇒ y = −x + 5'
    },
    {
      'question':
          '5. Are points (1,1), (2,3), (3,5) collinear?',
      'options': ['Yes', 'No', 'Cannot determine', 'Partial'],
      'correctIndex': 0,
      'explanation':
          'Slope (1,1)-(2,3)=2, slope (2,3)-(3,5)=2 ⇒ equal slopes ⇒ collinear'
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
              'You have completed all Coordinate Geometry Easy Practise 14 questions!'),
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
          'Coordinate Geometry - Easy Practise 14',
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
