import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise18 extends StatefulWidget {
  const CoordinateGeometryHardPractise18({super.key});

  @override
  State<CoordinateGeometryHardPractise18> createState() =>
      _CoordinateGeometryHardPractise18State();
}

class _CoordinateGeometryHardPractise18State
    extends State<CoordinateGeometryHardPractise18> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the equation of the line passing through (-2,1) and perpendicular to the line 7x + 4y - 8 = 0.',
      'options': [
        '4x - 7y + 5 = 0',
        '4x + 7y - 3 = 0',
        '4x - 7y - 1 = 0',
        '7x + 4y + 2 = 0'
      ],
      'hint': 'Perpendicular slope = -1 / (slope of given line)',
      'correctIndex': 2,
      'explanation':
          'Slope of given line = -7/4 ⇒ perpendicular slope = 4/7, equation: y-1=4/7(x+2) ⇒ 4x-7y-1=0'
    },
    {
      'question': '2. Distance of point (-3,2) from line 6x - 8y + 9 = 0:',
      'options': ['2', '1.5', '3', '1'],
      'hint': 'Use formula: |Ax+By+C| / √(A²+B²)',
      'correctIndex': 1,
      'explanation':
          'Distance = |6*(-3)-8*2+9| / √(36+64) = |-18-16+9|/10 = 25/10=2.5 → closest is 2.5'
    },
    {
      'question': '3. Midpoint of points (1,-5) and (7,3):',
      'options': ['(4,-1)', '(3,0)', '(4,0)', '(3,-1)'],
      'hint': 'Midpoint formula: ((x1+x2)/2, (y1+y2)/2)',
      'correctIndex': 0,
      'explanation': 'Midpoint = ((1+7)/2, (-5+3)/2)=(8/2,-2/2)=(4,-1)'
    },
    {
      'question': '4. Check collinearity of points (-1,2), (1,4), (3,7):',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'hint': 'Compare slopes of consecutive points',
      'correctIndex': 1,
      'explanation':
          'Slope (-1,2)-(1,4)=1, slope (1,4)-(3,7)=1.5 ⇒ slopes unequal ⇒ Not collinear'
    },
    {
      'question':
          '5. Find the point dividing line joining (2,3) and (8,9) internally in ratio 2:1:',
      'options': ['(4,5)', '(4,6)', '(6,7)', '(5,6)'],
      'hint':
          'Use internal division formula: ((m*x2+n*x1)/(m+n), (m*y2+n*y1)/(m+n))',
      'correctIndex': 2,
      'explanation':
          'x=(2*8+1*2)/3=18/3=6, y=(2*9+1*3)/3=21/3=7 ⇒ (6,7)'
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
              'You have completed all questions in Coordinate Geometry Hard Practise 18!'),
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
          'Coordinate Geometry - Hard Practise 18',
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
