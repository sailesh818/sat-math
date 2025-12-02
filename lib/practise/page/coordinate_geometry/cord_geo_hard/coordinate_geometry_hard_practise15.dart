import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise15 extends StatefulWidget {
  const CoordinateGeometryHardPractise15({super.key});

  @override
  State<CoordinateGeometryHardPractise15> createState() =>
      _CoordinateGeometryHardPractise15State();
}

class _CoordinateGeometryHardPractise15State
    extends State<CoordinateGeometryHardPractise15> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of the line perpendicular to the line joining points (2,3) and (5,11).',
      'options': ['-8/3', '3/8', '8/3', '-3/8'],
      'hint': 'Slope of perpendicular line = -1 / slope of original line',
      'correctIndex': 3,
      'explanation':
          'Slope of line through (2,3),(5,11) = (11-3)/(5-2) = 8/3, perpendicular slope = -3/8'
    },
    {
      'question': '2. Distance of point (4,5) from line 3x - 4y + 7 = 0:',
      'options': ['4', '5', '6', '7'],
      'hint': 'Distance formula: |Ax+By+C|/√(A²+B²)',
      'correctIndex': 1,
      'explanation':
          'Distance = |3*4 -4*5 +7| / √(3²+(-4)²) = |12-20+7|/5 = |-1|/5 = 0.2'
    },
    {
      'question': '3. Find the midpoint of points (−3,2) and (7,8):',
      'options': ['(2,5)', '(2,4)', '(3,5)', '(3,4)'],
      'hint': 'Midpoint formula: ((x1+x2)/2, (y1+y2)/2)',
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((-3+7)/2, (2+8)/2) = (4/2,10/2) = (2,5)'
    },
    {
      'question': '4. Are points (1,2), (3,5), (6,10) collinear?',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'hint': 'Compare slopes between consecutive points',
      'correctIndex': 1,
      'explanation':
          'Slope (1,2)-(3,5)=3/2, slope (3,5)-(6,10)=5/3 → slopes unequal ⇒ No'
    },
    {
      'question':
          '5. Point dividing line joining (0,0) and (8,6) internally in ratio 2:2:',
      'options': ['(4,3)', '(4,2)', '(2,3)', '(3,2)'],
      'hint': 'Ratio 2:2 = 1:1, use midpoint formula',
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((0+8)/2, (0+6)/2) = (4,3)'
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
              'You have completed all questions in Coordinate Geometry Hard Practise 15!'),
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
          'Coordinate Geometry - Hard Practise 15',
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
