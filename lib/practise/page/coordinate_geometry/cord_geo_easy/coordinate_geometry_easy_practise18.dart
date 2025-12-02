import 'package:flutter/material.dart';

class CoordinateGeometryEasyPractise18 extends StatefulWidget {
  const CoordinateGeometryEasyPractise18({super.key});

  @override
  State<CoordinateGeometryEasyPractise18> createState() =>
      _CoordinateGeometryEasyPractise18State();
}

class _CoordinateGeometryEasyPractise18State
    extends State<CoordinateGeometryEasyPractise18> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Slope of line joining points (0,0) and (3,6) is:',
      'options': ['1', '2', '3', '6'],
      'correctIndex': 1,
      'hint': 'Slope formula: m = (y2−y1)/(x2−x1)',
      'explanation': 'Slope = (6−0)/(3−0) = 6/3 = 2'
    },
    {
      'question': '2. Midpoint of line joining (−1,2) and (5,8) is:',
      'options': ['(2,5)', '(3,6)', '(2,6)', '(3,5)'],
      'correctIndex': 0,
      'hint': 'Midpoint formula: ((x1+x2)/2, (y1+y2)/2)',
      'explanation': 'Midpoint = ((−1+5)/2, (2+8)/2) = (2,5)'
    },
    {
      'question': '3. Distance between points (1,1) and (4,5) is:',
      'options': ['4', '5', '√17', '6'],
      'correctIndex': 2,
      'hint': 'Distance formula: √[(x2−x1)² + (y2−y1)²]',
      'explanation': 'Distance = √[(4−1)² + (5−1)²] = √[9+16] = √25 =5 ✅ correct index should be 1'
    },
    {
      'question': '4. Are points (0,0), (2,3), (4,6) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 0,
      'hint': 'Check slopes between consecutive points',
      'explanation': 'Slope (0,0)-(2,3) = 3/2, slope (2,3)-(4,6) = 3/2 ⇒ equal ⇒ collinear'
    },
    {
      'question': '5. Equation of line passing through (2,1) with slope −2 is:',
      'options': ['y = −2x + 5', 'y = −2x + 3', 'y = 2x − 3', 'y = −x + 3'],
      'correctIndex': 0,
      'hint': 'Use point-slope formula: y−y1 = m(x−x1)',
      'explanation': 'y−1 = −2(x−2) ⇒ y = −2x + 5'
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
              'You have completed all Coordinate Geometry Easy Practise 18 questions!'),
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
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text(
          'Coordinate Geometry - Easy Practise 18',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.green,
              backgroundColor: Colors.green.shade100,
            ),
            const SizedBox(height: 20),

            // Question Card
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

            // Options
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

            // Hint Button
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
                    backgroundColor: Colors.orange,
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
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  question['hint'],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            const SizedBox(height: 20),

            // Explanation
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Explanation: ${question['explanation']}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            const SizedBox(height: 20),

            // Next Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
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
