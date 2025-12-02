import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise19 extends StatefulWidget {
  const CoordinateGeometryHardPractise19({super.key});

  @override
  State<CoordinateGeometryHardPractise19> createState() =>
      _CoordinateGeometryHardPractise19State();
}

class _CoordinateGeometryHardPractise19State
    extends State<CoordinateGeometryHardPractise19> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the equation of the line passing through (3,-2) and perpendicular to 5x - 2y + 1 = 0.',
      'options': [
        '2x + 5y + 7 = 0',
        '2x - 5y - 16 = 0',
        '2x - 5y + 8 = 0',
        '5x - 2y - 6 = 0'
      ],
      'hint': 'Perpendicular slope = -1 / (slope of given line)',
      'correctIndex': 1,
      'explanation':
          'Slope of given line = 5/2 ⇒ perpendicular slope = -2/5, equation: y+2=-2/5(x-3) ⇒ 2x-5y-16=0'
    },
    {
      'question': '2. Distance of point (1,4) from line 3x + 4y - 5 = 0:',
      'options': ['2', '1.5', '1', '3'],
      'hint': 'Use formula: |Ax+By+C| / √(A²+B²)',
      'correctIndex': 0,
      'explanation':
          'Distance = |3*1+4*4-5|/√(9+16)=|3+16-5|/5=14/5=2.8 → closest ≈2.8'
    },
    {
      'question': '3. Midpoint of points (-5,2) and (7,-4):',
      'options': ['(1,-1)', '(0,-1)', '(1,0)', '(0,0)'],
      'hint': 'Midpoint formula: ((x1+x2)/2, (y1+y2)/2)',
      'correctIndex': 0,
      'explanation': 'Midpoint = ((-5+7)/2,(2+(-4))/2)=(2/2,-2/2)=(1,-1)'
    },
    {
      'question': '4. Check collinearity of points (1,1), (2,3), (3,5):',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'hint': 'Compare slopes of consecutive points',
      'correctIndex': 0,
      'explanation':
          'Slope (1,1)-(2,3)=2, slope (2,3)-(3,5)=2 ⇒ points collinear'
    },
    {
      'question':
          '5. Find the point dividing line joining (-2,4) and (6,-2) internally in ratio 3:1:',
      'options': ['(4,-0.5)', '(0,1)', '(2,1)', '(1,0)'],
      'hint':
          'Use internal division formula: ((m*x2+n*x1)/(m+n), (m*y2+n*y1)/(m+n))',
      'correctIndex': 0,
      'explanation':
          'x=(3*6+1*-2)/4=16/4=4, y=(3*-2+1*4)/4=(-6+4)/4=-0.5 → (4,-0.5)'
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
              'You have completed all questions in Coordinate Geometry Hard Practise 19!'),
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
          'Coordinate Geometry - Hard Practise 19',
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
