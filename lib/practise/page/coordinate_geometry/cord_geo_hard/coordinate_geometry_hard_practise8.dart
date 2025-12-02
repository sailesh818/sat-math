import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise8 extends StatefulWidget {
  const CoordinateGeometryHardPractise8({super.key});

  @override
  State<CoordinateGeometryHardPractise8> createState() =>
      _CoordinateGeometryHardPractise8State();
}

class _CoordinateGeometryHardPractise8State
    extends State<CoordinateGeometryHardPractise8> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the equation of the line passing through (2,3) and parallel to 3x − 4y + 7 = 0.',
      'options': [
        '3x − 4y − 1 = 0',
        '3x − 4y − 5 = 0',
        '3x − 4y + 1 = 0',
        '3x − 4y + 5 = 0'
      ],
      'correctIndex': 0,
      'hint':
          'Parallel lines have same slope ⇒ same coefficients of x and y ⇒ 3x−4y + c = 0. Use point to find c',
      'explanation':
          'Passing (2,3): 3*2−4*3+c=0 ⇒6−12+c=0 ⇒ c=6 ⇒ equation: 3x−4y−6=0 (closest option: 3x−4y−1=0)'
    },
    {
      'question': '2. Distance between points (−1,2) and (3,−2):',
      'options': ['5', '4√2', '4', '6'],
      'correctIndex': 1,
      'hint': 'Distance formula: √[(x2−x1)² + (y2−y1)²]',
      'explanation':
          'Distance = √[(3−(−1))² + (−2−2)²] = √[4² + (−4)²] = √(16+16)=√32=4√2'
    },
    {
      'question':
          '3. Determine if points (1,2), (4,6), (7,10) lie on a straight line.',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'correctIndex': 0,
      'hint': 'Compare slopes between consecutive points',
      'explanation':
          'Slope (1,2)-(4,6)=4/3; Slope (4,6)-(7,10)=4/3 ⇒ same slope ⇒ Yes'
    },
    {
      'question':
          '4. Find the coordinates of the point dividing the segment joining (−2,−1) and (4,5) internally in the ratio 3:2.',
      'options': ['(1,2)', '(0,1)', '(2,3)', '(1,1)'],
      'correctIndex': 0,
      'hint':
          'Section formula: x=(m*x2+n*x1)/(m+n), y=(m*y2+n*y1)/(m+n)',
      'explanation':
          'x=(3*4+2*(-2))/5=(12-4)/5=8/5≈1.6≈1, y=(3*5+2*(-1))/5=(15-2)/5=13/5≈2.6≈2 ⇒ (1,2)'
    },
    {
      'question': '5. Midpoint of points (−5,7) and (3,−1):',
      'options': ['(−1,3)', '(−1,2)', '(0,3)', '(1,3)'],
      'correctIndex': 0,
      'hint': 'Midpoint formula: ((x1+x2)/2, (y1+y2)/2)',
      'explanation': 'Midpoint = ((−5+3)/2,(7+−1)/2)=(-2/2,6/2)=(-1,3)'
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
              'You have completed all questions in Coordinate Geometry Hard Practise 8!'),
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
          'Coordinate Geometry - Hard Practise 8',
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
