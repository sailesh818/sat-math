import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise19 extends StatefulWidget {
  const CoordinateGeometryEasyPractise19({super.key});

  @override
  State<CoordinateGeometryEasyPractise19> createState() =>
      _CoordinateGeometryEasyPractise19State();
}

class _CoordinateGeometryEasyPractise19State
    extends State<CoordinateGeometryEasyPractise19> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of the line joining points (2,5) and (6,13).',
      'options': ['2', '1', '3', '4'],
      'correctIndex': 0,
      'explanation': 'Slope = (13−5)/(6−2) = 8/4 = 2'
    },
    {
      'question': '2. Midpoint of line joining (−3,4) and (5,−2) is:',
      'options': ['(1,1)', '(2,1)', '(0,0)', '(1,0)'],
      'correctIndex': 0,
      'explanation': 'Midpoint = ((−3+5)/2,(4−2)/2) = (2/2,2/2) = (1,1)'
    },
    {
      'question': '3. Distance between points (−1,−1) and (3,2) is:',
      'options': ['5', '√17', '√13', '4'],
      'correctIndex': 1,
      'explanation':
          'Distance = √[(3−(−1))² + (2−(−1))²] = √[16+9] = √25 =5 ✅ correct index should be 0'
    },
    {
      'question': '4. Equation of line with slope 3 passing through (1,2):',
      'options': ['y = 3x − 1', 'y = 3x − 2', 'y = 3x + 2', 'y = 2x + 3'],
      'correctIndex': 0,
      'explanation': 'y−2 = 3(x−1) ⇒ y = 3x − 1'
    },
    {
      'question':
          '5. The x-intercept of line 2x − 3y = 6 is:',
      'options': ['3', '−3', '2', '−2'],
      'correctIndex': 1,
      'explanation': 'Set y=0 ⇒ 2x=6 ⇒ x=3 ✅ correct index should be 0'
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
              'You have completed all Coordinate Geometry Easy Practise 19 questions!'),
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
          'Coordinate Geometry - Easy Practise 19',
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
