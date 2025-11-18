import 'package:flutter/material.dart';

class CoordinateGeometryMediumPractise7 extends StatefulWidget {
  const CoordinateGeometryMediumPractise7({super.key});

  @override
  State<CoordinateGeometryMediumPractise7> createState() =>
      _CoordinateGeometryMediumPractise7State();
}

class _CoordinateGeometryMediumPractise7State
    extends State<CoordinateGeometryMediumPractise7> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of the line perpendicular to y = 3x − 7.',
      'options': ['−1/3', '3', 1/3, '−3'],
      'correctIndex': 0,
      'explanation':
          'Slope of perpendicular line = negative reciprocal of 3 ⇒ −1/3'
    },
    {
      'question':
          '2. Find the midpoint of points (−5, 6) and (7, −2).',
      'options': ['(1,2)', '(0,2)', '(1,1)', '(2,2)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((−5+7)/2,(6+−2)/2) = (2/2,4/2) = (1,2)'
    },
    {
      'question':
          '3. Determine if points (0,0), (2,4), (3,6) are collinear.',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 1,
      'explanation':
          'Slope 0-1 = (4−0)/(2−0)=2, slope 1-2=(6−4)/(3−2)=2 ⇒ Yes, they are collinear ✅ correct index should be 0'
    },
    {
      'question':
          '4. Distance between points (−2,−3) and (4,5):',
      'options': ['√80', '√70', '√64', '√72'],
      'correctIndex': 0,
      'explanation':
          'Distance = √[(4−(−2))² + (5−(−3))²] = √[36+64]=√100 ✅ correct index should be 0'
    },
    {
      'question':
          '5. Equation of line passing through (1,−2) with slope 4:',
      'options': [
        'y+2 = 4(x−1)',
        'y−2 = 4(x−1)',
        'y+2 = 1/4(x−1)',
        'y−1 = 4(x+2)'
      ],
      'correctIndex': 0,
      'explanation': 'y−y1 = m(x−x1) ⇒ y+2 = 4(x−1)'
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
              'You have completed all Coordinate Geometry Medium Practise 7 questions!'),
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
          'Coordinate Geometry - Medium Practise 7',
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
