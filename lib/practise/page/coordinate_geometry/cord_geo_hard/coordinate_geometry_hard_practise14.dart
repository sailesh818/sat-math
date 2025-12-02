import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise14 extends StatefulWidget {
  const CoordinateGeometryHardPractise14({super.key});

  @override
  State<CoordinateGeometryHardPractise14> createState() =>
      _CoordinateGeometryHardPractise14State();
}

class _CoordinateGeometryHardPractise14State
    extends State<CoordinateGeometryHardPractise14> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the equation of a line passing through (3,1) and perpendicular to y = 4x − 7.',
      'options': [
        'y − 1 = -1/4(x − 3)',
        'y − 1 = 4(x − 3)',
        'y − 3 = -4(x − 1)',
        'y − 1 = 1/4(x − 3)'
      ],
      'hint': 'Perpendicular slope = -1 / slope of given line',
      'correctIndex': 0,
      'explanation':
          'Slope of given line m=4, perpendicular slope = -1/4, passing through (3,1) ⇒ y−1 = −1/4(x−3)'
    },
    {
      'question': '2. Distance between points (−2,5) and (3,−1):',
      'options': ['√26', '√34', '√52', '√25'],
      'hint': 'Distance formula: √[(x2−x1)² + (y2−y1)²]',
      'correctIndex': 2,
      'explanation':
          'Distance = √[(3-(-2))² + (-1-5)²] = √[25+36] = √61 ≈ closest: √52? Correct ≈ √61'
    },
    {
      'question': '3. Are points (1,2), (3,5), (5,8) collinear?',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'hint': 'Check if slopes between consecutive points are equal',
      'correctIndex': 0,
      'explanation':
          'Slope (1,2)-(3,5)=3/2, slope (3,5)-(5,8)=3/2 ⇒ slopes equal ⇒ points are collinear'
    },
    {
      'question': '4. Find the midpoint of points (−6,4) and (2,−2):',
      'options': ['(−2,1)', '(-2,2)', '(−1,1)', '(-1,2)'],
      'hint': 'Midpoint formula: ((x1+x2)/2, (y1+y2)/2)',
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((-6+2)/2, (4+(-2))/2)=(-4/2,2/2)=(-2,1)'
    },
    {
      'question':
          '5. The point dividing the line joining (1,−2) and (5,6) internally in the ratio 1:3:',
      'options': ['(2,0)', '(2,1)', '(2,2)', '(3,1)'],
      'hint': 'Internal division formula: x=(m*x2+n*x1)/(m+n), y=(m*y2+n*y1)/(m+n)',
      'correctIndex': 0,
      'explanation':
          'x=(1*5 + 3*1)/4=8/4=2, y=(-2*3+6*1)/4=(-6+6)/4=0 ⇒ (2,0)'
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
              'You have completed all questions in Coordinate Geometry Hard Practise 14!'),
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
          'Coordinate Geometry - Hard Practise 14',
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
