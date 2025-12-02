import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise6 extends StatefulWidget {
  const CoordinateGeometryHardPractise6({super.key});

  @override
  State<CoordinateGeometryHardPractise6> createState() =>
      _CoordinateGeometryHardPractise6State();
}

class _CoordinateGeometryHardPractise6State
    extends State<CoordinateGeometryHardPractise6> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the coordinates of the point dividing the line segment joining (1,2) and (7,8) internally in the ratio 1:2.',
      'options': ['(5,6)', '(3,4)', '(4,5)', '(2,3)'],
      'correctIndex': 1,
      'hint': 'Use the section formula: x = (m2*x1 + m1*x2)/(m1+m2), y = (m2*y1 + m1*y2)/(m1+m2)',
      'explanation':
          'Section formula: x=(1*7+2*1)/3=9/3=3, y=(1*8+2*2)/3=12/3=4. ✅ Option: (3,4)'
    },
    {
      'question': '2. Distance of the point (2,−3) from the line 3x+4y−12=0:',
      'options': ['3', '4', '5', '6'],
      'correctIndex': 2,
      'hint': 'Distance formula: |Ax1 + By1 + C| / √(A²+B²)',
      'explanation':
          'Distance = |3*2+4*(-3)-12| / √(9+16) = |6-12-12|/5=18/5=3.6≈3.6'
    },
    {
      'question': '3. Determine if points (1,1), (2,3), (3,5) are collinear.',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'correctIndex': 0,
      'hint': 'Compare slopes between consecutive points',
      'explanation':
          'Slope (1,1)-(2,3)=2/1=2; Slope (2,3)-(3,5)=2/1=2 ⇒ Yes, collinear'
    },
    {
      'question':
          '4. Equation of the line passing through (2,3) and perpendicular to y=1/2 x + 4:',
      'options': [
        'y−3=−2(x−2)',
        'y−3=2(x−2)',
        'y−3=1/2(x−2)',
        'y−3=−1/2(x−2)'
      ],
      'correctIndex': 0,
      'hint': 'Perpendicular slope = -1/m; use point-slope formula',
      'explanation':
          'Slope of given line = 1/2; perpendicular slope = -2; equation: y−3=−2(x−2)'
    },
    {
      'question': '5. Midpoint of segment joining (−5,4) and (3,−2):',
      'options': ['(−1,1)', '(−2,1)', '(−1,2)', '(−2,2)'],
      'correctIndex': 0,
      'hint': 'Midpoint formula: ((x1+x2)/2, (y1+y2)/2)',
      'explanation':
          'Midpoint = ((−5+3)/2,(4+−2)/2)=(−2/2,2/2)=(−1,1)'
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
        showHint = false;
      });
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text('🎉 Well Done!'),
          content: const Text(
              'You have completed all questions in Coordinate Geometry Hard Practise 6!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  currentQuestionIndex = 0;
                  selectedAnswerIndex = null;
                  answerChecked = false;
                  showHint = false;
                });
              },
              child: const Text('Restart'),
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
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        title: const Text(
          'Coordinate Geometry - Hard Practise 6',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.red,
              backgroundColor: Colors.red.shade100,
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
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
            ...List.generate(question['options'].length, (index) {
              final option = question['options'][index];
              final isSelected = selectedAnswerIndex == index;
              final isCorrect =
                  answerChecked && index == question['correctIndex'];
              final isWrong = answerChecked && isSelected && !isCorrect;

              return Card(
                color: isCorrect
                    ? Colors.red.shade100
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  title: Text(option),
                  onTap: () => checkAnswer(index),
                ),
              );
            }),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      showHint = !showHint;
                    });
                  },
                  icon: const Icon(Icons.lightbulb_outline, color: Colors.white),
                  label: const Text(
                    "Hint",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ],
            ),
            if (showHint)
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  question['hint'] ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            const SizedBox(height: 20),
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Explanation: ${question['explanation']}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1
                      ? 'Finish'
                      : 'Next Question',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
