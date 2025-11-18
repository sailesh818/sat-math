import 'package:flutter/material.dart';

class CoordinateGeometryMediumPractise17 extends StatefulWidget {
  const CoordinateGeometryMediumPractise17({super.key});

  @override
  State<CoordinateGeometryMediumPractise17> createState() =>
      _CoordinateGeometryMediumPractise17State();
}

class _CoordinateGeometryMediumPractise17State
    extends State<CoordinateGeometryMediumPractise17> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of the line passing through points (1,−4) and (5,2).',
      'options': ['3/2', '−3/2', '1/2', '−1/2'],
      'correctIndex': 0,
      'explanation':
          'Slope = (2−(−4))/(5−1) = 6/4 = 3/2'
    },
    {
      'question':
          '2. Find the midpoint of points (−5,3) and (7,−1).',
      'options': ['(1,1)', '(0,1)', '(1,0)', '(−1,1)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((−5+7)/2, (3+−1)/2) = (2/2,2/2) = (1,1)'
    },
    {
      'question':
          '3. Are points (2,3), (4,7), (6,11) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope 1-2 = (7−3)/(4−2)=4/2=2; slope 2-3 = (11−7)/(6−4)=4/2=2 ⇒ Yes, collinear'
    },
    {
      'question':
          '4. Distance between points (−1,−2) and (3,2):',
      'options': ['√32', '√20', '√16', '√18'],
      'correctIndex': 0,
      'explanation':
          'Distance = √[(3−(−1))² + (2−(−2))²] = √[16 + 16] = √32'
    },
    {
      'question':
          '5. Equation of line passing through (0,−3) with slope 5:',
      'options': [
        'y+3 = 5x',
        'y−3 = 5x',
        'y+3 = −5x',
        'y−3 = −5x'
      ],
      'correctIndex': 0,
      'explanation':
          'Equation: y−y1 = m(x−x1) ⇒ y−(−3)=5(x−0) ⇒ y+3 = 5x'
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
              'You have completed all Coordinate Geometry Medium Practise 17 questions!'),
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
          'Coordinate Geometry - Medium Practise 17',
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
