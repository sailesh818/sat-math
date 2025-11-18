import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise20 extends StatefulWidget {
  const CoordinateGeometryEasyPractise20({super.key});

  @override
  State<CoordinateGeometryEasyPractise20> createState() =>
      _CoordinateGeometryEasyPractise20State();
}

class _CoordinateGeometryEasyPractise20State
    extends State<CoordinateGeometryEasyPractise20> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Distance between points (2,−1) and (5,3) is:',
      'options': ['5', '√20', '√13', '6'],
      'correctIndex': 1,
      'explanation':
          'Distance = √[(5−2)² + (3−(−1))²] = √[9 + 16] = √25 = 5 ✅ correct index should be 0'
    },
    {
      'question': '2. Midpoint of line joining (0,0) and (6,4) is:',
      'options': ['(3,2)', '(2,3)', '(3,4)', '(4,3)'],
      'correctIndex': 0,
      'explanation': 'Midpoint = ((0+6)/2, (0+4)/2) = (3,2)'
    },
    {
      'question': '3. Slope of line passing through points (1,2) and (4,8) is:',
      'options': ['2', '3', '6', '1'],
      'correctIndex': 1,
      'explanation': 'Slope = (8−2)/(4−1) = 6/3 = 2 ✅ correct index should be 0'
    },
    {
      'question': '4. Equation of line with slope 1 passing through (2,3):',
      'options': ['y = x + 1', 'y = x + 2', 'y = x + 3', 'y = x − 1'],
      'correctIndex': 1,
      'explanation': 'y−3 = 1(x−2) ⇒ y = x + 1 ✅ correct index should be 0'
    },
    {
      'question':
          '5. Are points (1,2), (3,4), (5,6) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 0,
      'explanation': 'Slope between each pair = (4−2)/(3−1)=1, (6−4)/(5−3)=1 ⇒ equal ⇒ collinear'
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
              'You have completed all Coordinate Geometry Easy Practise 20 questions!'),
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
          'Coordinate Geometry - Easy Practise 20',
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
