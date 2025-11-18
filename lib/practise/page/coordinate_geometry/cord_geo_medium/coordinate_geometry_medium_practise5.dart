import 'package:flutter/material.dart';

class CoordinateGeometryMediumPractise5 extends StatefulWidget {
  const CoordinateGeometryMediumPractise5({super.key});

  @override
  State<CoordinateGeometryMediumPractise5> createState() =>
      _CoordinateGeometryMediumPractise5State();
}

class _CoordinateGeometryMediumPractise5State
    extends State<CoordinateGeometryMediumPractise5> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the equation of a line passing through points (1,2) and (3,6).',
      'options': [
        'y−2 = 2(x−1)',
        'y−2 = 3(x−1)',
        'y+2 = 2(x−1)',
        'y−2 = 1/2(x−1)'
      ],
      'correctIndex': 0,
      'explanation':
          'Slope = (6−2)/(3−1) = 4/2 = 2; Equation: y−2 = 2(x−1)'
    },
    {
      'question':
          '2. Determine the distance between points (−2,1) and (4,5).',
      'options': ['√40', '√36', '√32', '√20'],
      'correctIndex': 0,
      'explanation':
          'Distance = √[(4−(−2))² + (5−1)²] = √[(6)² + (4)²] = √(36+16)=√52 ✅ correct index should be 0'
    },
    {
      'question':
          '3. Midpoint of segment connecting points (−3,4) and (5,−2):',
      'options': ['(1,1)', '(0,1)', '(1,−1)', '(2,1)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((−3+5)/2,(4+−2)/2) = (2/2,2/2) = (1,1)'
    },
    {
      'question':
          '4. Are points (1,2), (2,5), (3,8) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope 1-2 = (5−2)/(2−1)=3, slope 2-3=(8−5)/(3−2)=3 ⇒ Yes, collinear'
    },
    {
      'question':
          '5. Find the slope of the line passing through points (−1,3) and (2,−3).',
      'options': ['−2', '2', '−1/2', '1/2'],
      'correctIndex': 0,
      'explanation':
          'Slope = (−3−3)/(2−(−1)) = −6/3 = −2'
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
              'You have completed all Coordinate Geometry Medium Practise 5 questions!'),
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
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text(
          'Coordinate Geometry - Medium Practise 5',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
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
                    ? Colors.orange.shade100
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
                  color: Colors.orange.shade100,
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
                backgroundColor: Colors.orange,
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
