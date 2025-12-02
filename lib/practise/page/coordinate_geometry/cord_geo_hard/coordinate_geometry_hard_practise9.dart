import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise9 extends StatefulWidget {
  const CoordinateGeometryHardPractise9({super.key});

  @override
  State<CoordinateGeometryHardPractise9> createState() =>
      _CoordinateGeometryHardPractise9State();
}

class _CoordinateGeometryHardPractise9State
    extends State<CoordinateGeometryHardPractise9> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the equation of the line passing through (1,−2) and perpendicular to 2x + 3y − 5 = 0.',
      'options': [
        '3x − 2y − 8 = 0',
        '3x + 2y − 4 = 0',
        '2x − 3y − 1 = 0',
        '−3x + 2y − 1 = 0'
      ],
      'correctIndex': 0,
      'hint': 'Perpendicular slope formula: m1 * m2 = -1, then use point-slope form',
      'explanation':
          'Slope of given line = -2/3; perpendicular slope = 3/2; equation: y + 2 = (−3/2)(x −1) simplified ⇒ 3x−2y−8=0'
    },
    {
      'question': '2. Distance between points (−3,4) and (1,−2):',
      'options': ['6', '√52', '2√13', '5'],
      'correctIndex': 2,
      'hint': 'Use distance formula: √[(x2−x1)² + (y2−y1)²]',
      'explanation':
          'Distance = √[(1−(−3))² + (−2−4)²]=√[(4)² + (−6)²]=√(16+36)=√52=2√13'
    },
    {
      'question': '3. Are points (2,3), (4,7), (6,11) collinear?',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'correctIndex': 0,
      'hint': 'Compare slopes between consecutive points',
      'explanation':
          'Slope (2,3)-(4,7)=2, slope (4,7)-(6,11)=2 ⇒ points are collinear'
    },
    {
      'question':
          '4. Find coordinates dividing the segment joining (−1,2) and (5,10) in the ratio 3:2 externally.',
      'options': ['(8,14)', '(10,16)', '(7,12)', '(6,11)'],
      'correctIndex': 2,
      'hint':
          'Use external division formula: x=(m*x2−n*x1)/(m−n), y=(m*y2−n*y1)/(m−n)',
      'explanation':
          'External division: x=(3*5−2*(−1))/1≈7, y=(3*10−2*2)/1≈12 ⇒ (7,12)'
    },
    {
      'question': '5. Midpoint of points (−6,5) and (4,−3):',
      'options': ['(−1,1)', '(0,1)', '(−1,0)', '(0,0)'],
      'correctIndex': 0,
      'hint': 'Midpoint formula: ((x1+x2)/2, (y1+y2)/2)',
      'explanation': 'Midpoint = ((−6+4)/2,(5+−3)/2)=(-2/2,2/2)=(-1,1)'
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
              'You have completed all questions in Coordinate Geometry Hard Practise 9!'),
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
          'Coordinate Geometry - Hard Practise 9',
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
