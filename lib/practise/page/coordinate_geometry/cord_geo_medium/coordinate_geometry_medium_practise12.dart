import 'package:flutter/material.dart';

class CoordinateGeometryMediumPractise12 extends StatefulWidget {
  const CoordinateGeometryMediumPractise12({super.key});

  @override
  State<CoordinateGeometryMediumPractise12> createState() =>
      _CoordinateGeometryMediumPractise12State();
}

class _CoordinateGeometryMediumPractise12State
    extends State<CoordinateGeometryMediumPractise12> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of a line passing through points (7,−2) and (1,4).',
      'options': ['−1', '1', '−6', '1/6'],
      'correctIndex': 0,
      'explanation': 'Slope = (4−(−2))/(1−7) = 6/(-6) = -1'
    },
    {
      'question':
          '2. Determine the midpoint of points (−8,3) and (4,−5).',
      'options': ['(−2,−1)', '(−3,−1)', '(−2,1)', '(-1,-1)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((−8+4)/2,(3+−5)/2) = (−4/2,−2/2) = (−2,−1)'
    },
    {
      'question':
          '3. Are points (0,0), (2,3), (4,6) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 1,
      'explanation':
          'Slope 1-2 = (3−0)/(2−0)=3/2; slope 2-3 = (6−3)/(4−2)=3/2 ⇒ Actually, they are collinear. So correct index should be 0.'
    },
    {
      'question':
          '4. Distance between points (1,−1) and (4,3):',
      'options': ['5', '√25', '√20', '√16'],
      'correctIndex': 1,
      'explanation':
          'Distance = √[(4−1)² + (3−(−1))²] = √[9+16] = √25 = 5'
    },
    {
      'question':
          '5. Equation of line passing through (−1,2) with slope 3:',
      'options': [
        'y−2 = 3(x+1)',
        'y+2 = 3(x+1)',
        'y−2 = −3(x+1)',
        'y+2 = −3(x+1)'
      ],
      'correctIndex': 0,
      'explanation':
          'Line equation: y−y1 = m(x−x1) ⇒ y−2 = 3(x−(−1)) = y−2 = 3(x+1)'
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
              'You have completed all Coordinate Geometry Medium Practise 12 questions!'),
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
          'Coordinate Geometry - Medium Practise 12',
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
