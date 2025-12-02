import 'package:flutter/material.dart';

class CoordinateGeometryMediumPractise14 extends StatefulWidget {
  const CoordinateGeometryMediumPractise14({super.key});

  @override
  State<CoordinateGeometryMediumPractise14> createState() =>
      _CoordinateGeometryMediumPractise14State();
}

class _CoordinateGeometryMediumPractise14State
    extends State<CoordinateGeometryMediumPractise14> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of the line joining points (−3,5) and (3,−1).',
      'options': ['−1', '1', '−6', '−1'],
      'correctIndex': 0,
      'hint': 'Slope formula: (y2−y1)/(x2−x1)',
      'explanation': 'Slope = (−1−5)/(3−(−3)) = (−6)/6 = −1'
    },
    {
      'question':
          '2. Determine the midpoint of points (−7,2) and (5,−6).',
      'options': ['(−1,−2)', '(-1, -1)', '(0, -2)', '(-2, -2)'],
      'correctIndex': 0,
      'hint': 'Midpoint = ((x1+x2)/2, (y1+y2)/2)',
      'explanation':
          'Midpoint = ((−7+5)/2, (2+−6)/2) = (−2/2, −4/2) = (−1, −2)'
    },
    {
      'question': '3. Are points (1,2), (4,6), (5,8) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 1,
      'hint': 'Check slopes of consecutive points.',
      'explanation':
          'Slope 1-2 = (6−2)/(4−1)=4/3; slope 2-3 = (8−6)/(5−4)=2 ⇒ Not collinear'
    },
    {
      'question': '4. Distance between points (−2,−3) and (2,1):',
      'options': ['√20', '√18', '√16', '√25'],
      'correctIndex': 0,
      'hint': 'Distance formula: √[(x2−x1)² + (y2−y1)²]',
      'explanation':
          'Distance = √[(2−(−2))² + (1−(−3))²] = √[16 + 16] = √32'
    },
    {
      'question': '5. Equation of line passing through (−1,1) with slope 2:',
      'options': [
        'y−1 = 2(x+1)',
        'y+1 = 2(x+1)',
        'y−1 = −2(x+1)',
        'y+1 = −2(x+1)'
      ],
      'correctIndex': 0,
      'hint': 'Use point-slope form: y−y1 = m(x−x1)',
      'explanation':
          'Equation: y−y1 = m(x−x1) ⇒ y−1 = 2(x−(−1)) = y−1 = 2(x+1)'
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
              'You have completed all Coordinate Geometry Medium Practise 14 questions!'),
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
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text(
          'Coordinate Geometry - Medium Practise 14',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.orange,
              backgroundColor: Colors.orange.shade100,
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
                    ? Colors.green.shade100
                    : isWrong
                        ? Colors.red.shade100
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
                  color: Colors.deepOrange.shade100,
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
                  color: Colors.orange.shade100,
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
                  backgroundColor: Colors.orange,
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
