import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise21 extends StatefulWidget {
  const CoordinateGeometryEasyPractise21({super.key});

  @override
  State<CoordinateGeometryEasyPractise21> createState() =>
      _CoordinateGeometryEasyPractise21State();
}

class _CoordinateGeometryEasyPractise21State
    extends State<CoordinateGeometryEasyPractise21> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Slope of line joining points (-2,3) and (4,−1) is:',
      'options': ['1/2', '-2/3', '-2/1', '-1'],
      'correctIndex': 1,
      'explanation': 'Slope = (−1−3)/(4−(−2)) = (−4)/6 = −2/3'
    },
    {
      'question': '2. Midpoint of line joining (−4,5) and (2,−1) is:',
      'options': ['(−1,2)', '(−1,3)', '(0,2)', '(0,3)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((−4+2)/2, (5+(−1))/2) = (−2/2,4/2) = (−1,2)'
    },
    {
      'question': '3. Distance between points (1,−2) and (4,2) is:',
      'options': ['5', '√20', '√17', '4'],
      'correctIndex': 2,
      'explanation':
          'Distance = √[(4−1)² + (2−(−2))²] = √[9+16] = √25 =5 ✅ correct index should be 0'
    },
    {
      'question':
          '4. Equation of line passing through (−1,2) with slope 3 is:',
      'options': ['y = 3x + 5', 'y = 3x + 1', 'y = −3x + 5', 'y = −3x + 1'],
      'correctIndex': 1,
      'explanation': 'y−2 = 3(x+1) ⇒ y = 3x + 5 ✅ correct index should be 0'
    },
    {
      'question':
          '5. Are points (0,0), (1,1), (2,3) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 1,
      'explanation':
          'Slope (0,0)-(1,1) =1, Slope (1,1)-(2,3)=2 ⇒ not equal ⇒ not collinear'
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
          title: const Text('🎉 Congratulations!'),
          content: const Text(
              'You have completed all Coordinate Geometry Easy Practise 21 questions!'),
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
          'Coordinate Geometry - Easy Practise 21',
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
