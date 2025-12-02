import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise3 extends StatefulWidget {
  const CoordinateGeometryHardPractise3({super.key});

  @override
  State<CoordinateGeometryHardPractise3> createState() =>
      _CoordinateGeometryHardPractise3State();
}

class _CoordinateGeometryHardPractise3State
    extends State<CoordinateGeometryHardPractise3> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the coordinates of the point which divides the line segment joining (2,3) and (8,9) internally in the ratio 2:1.',
      'options': ['(4,5)', '(5,6)', '(6,7)', '(3,4)'],
      'correctIndex': 2,
      'hint': 'Use the section formula: ((m*x2+n*x1)/(m+n), (m*y2+n*y1)/(m+n))',
      'explanation':
          'x=(2*8+1*2)/3=18/3=6, y=(2*9+1*3)/3=21/3=7 ⇒ (6,7)'
    },
    {
      'question':
          '2. Find the distance of the point (3,−4) from the line 5x−12y+2=0.',
      'options': ['1', '2', '3', '4'],
      'correctIndex': 3,
      'hint': 'Distance formula: |Ax1+By1+C|/√(A²+B²)',
      'explanation':
          'Distance = |5*3−12*(−4)+2| / √(5²+(-12)²) = |15+48+2|/√(25+144)=65/13=5'
    },
    {
      'question': '3. Determine if the points (0,0), (3,4), (6,8) are collinear.',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'correctIndex': 0,
      'hint': 'Check if slope between consecutive points is equal',
      'explanation': 'Slope (0,0)-(3,4)=4/3; Slope (3,4)-(6,8)=4/3 ⇒ Yes, collinear'
    },
    {
      'question':
          '4. Find the equation of the line passing through (1,2) and perpendicular to y=−(3/2)x+4.',
      'options': [
        'y−2=(2/3)(x−1)',
        'y−2=(−2/3)(x−1)',
        'y−2=(3/2)(x−1)',
        'y−2=(−3/2)(x−1)'
      ],
      'correctIndex': 0,
      'hint': 'Perpendicular slope = negative reciprocal',
      'explanation':
          'Slope of given line = −3/2; perpendicular slope = 2/3; equation: y−2=2/3(x−1)'
    },
    {
      'question': '5. Midpoint of segment joining (−7,5) and (3,−1):',
      'options': ['(−2,2)', '(−3,3)', '(−2,3)', '(−3,2)'],
      'correctIndex': 0,
      'hint': 'Midpoint formula: ((x1+x2)/2, (y1+y2)/2)',
      'explanation': 'Midpoint = ((−7+3)/2,(5+−1)/2)=(−4/2,4/2)=(−2,2)'
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
              'You have completed all questions in Coordinate Geometry Hard Practise 3!'),
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
          'Coordinate Geometry - Hard Practise 3',
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
                  question['hint'],
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
