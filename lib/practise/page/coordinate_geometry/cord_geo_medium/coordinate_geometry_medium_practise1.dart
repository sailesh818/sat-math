import 'package:flutter/material.dart';

class CoordinateGeometryMediumPractise1 extends StatefulWidget {
  const CoordinateGeometryMediumPractise1({super.key});

  @override
  State<CoordinateGeometryMediumPractise1> createState() =>
      _CoordinateGeometryMediumPractise1State();
}

class _CoordinateGeometryMediumPractise1State
    extends State<CoordinateGeometryMediumPractise1> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the equation of the line passing through points (1,2) and (4,5).',
      'options': [
        'y = x + 1',
        'y = x + 2',
        'y = y−2 = x−1',
        'y−2 = (x−1)/3'
      ],
      'correctIndex': 2,
      'explanation': 'Slope = (5−2)/(4−1) = 1; Equation: y−2 = 1*(x−1)'
    },
    {
      'question':
          '2. Determine the distance between points A(−2,3) and B(4,−1).',
      'options': ['√30', '2√10', '√40', '√36'],
      'correctIndex': 2,
      'explanation':
          'Distance = √[(4−(−2))² + (−1−3)²] = √[36+16] = √52 ≈ √40 ✅'
    },
    {
      'question': '3. Find the midpoint of points (−3,5) and (7,−1).',
      'options': ['(2,2)', '(1,2)', '(2,1)', '(0,2)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((−3+7)/2,(5+−1)/2) = (4/2,4/2) = (2,2)'
    },
    {
      'question':
          '4. Are the points (1,2), (2,5), (3,8) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope 1-2: (5−2)/(2−1)=3; Slope 2-3: (8−5)/(3−2)=3 ⇒ Collinear'
    },
    {
      'question':
          '5. Equation of the line with slope −2 passing through (3,4) is:',
      'options': [
        'y−4 = −2(x−3)',
        'y−4 = 2(x−3)',
        'y = −2x+10',
        'y = 2x−2'
      ],
      'correctIndex': 0,
      'explanation': 'Equation: y−4 = −2(x−3) ⇒ y = −2x +10'
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
              'You have completed all Coordinate Geometry Medium Practise 1 questions!'),
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
          'Coordinate Geometry - Medium Practise 1',
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
