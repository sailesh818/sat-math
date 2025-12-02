import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise10 extends StatefulWidget {
  const CoordinateGeometryHardPractise10({super.key});

  @override
  State<CoordinateGeometryHardPractise10> createState() =>
      _CoordinateGeometryHardPractise10State();
}

class _CoordinateGeometryHardPractise10State
    extends State<CoordinateGeometryHardPractise10> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the coordinates of the point which divides the line joining (1,2) and (7,8) internally in the ratio 5:2.',
      'options': ['(5,6)', '(4,5)', '(3,4)', '(6,7)'],
      'correctIndex': 0,
      'hint': 'Use the internal division formula: x=(m*x2+n*x1)/(m+n), y=(m*y2+n*y1)/(m+n)',
      'explanation':
          'Internal division formula: x=(5*7+2*1)/(5+2)=37/7≈5.29≈5, y=(5*8+2*2)/7=42/7=6'
    },
    {
      'question': '2. Distance from point (3,−1) to the line 5x−12y+9=0:',
      'options': ['2', '3', '1', '4'],
      'correctIndex': 1,
      'hint': 'Distance formula: |Ax+By+C| / √(A²+B²)',
      'explanation':
          'Distance = |5*3−12*(−1)+9| / √(25+144)=|15+12+9|/13=36/13≈2.77≈3'
    },
    {
      'question': '3. Are the points (2,3), (4,7), (5,10) collinear?',
      'options': ['Yes', 'No', 'Cannot determine', 'Partially'],
      'correctIndex': 1,
      'hint': 'Compare slopes of consecutive points',
      'explanation':
          'Slope (2,3)-(4,7)=2, slope (4,7)-(5,10)=3 ⇒ slopes unequal ⇒ No'
    },
    {
      'question':
          '4. Find the equation of the line passing through (−2,1) and having slope 3:',
      'options': ['y−1=3(x+2)', 'y+1=3(x−2)', 'y−1=3(x−2)', 'y+1=3(x+2)'],
      'correctIndex': 0,
      'hint': 'Use point-slope form: y−y1=m(x−x1)',
      'explanation': 'Equation: y−y1=m(x−x1) ⇒ y−1=3(x+2)'
    },
    {
      'question':
          '5. Midpoint of segment joining points (−3,4) and (5,−2):',
      'options': ['(1,1)', '(0,1)', '(1,0)', '(−1,1)'],
      'correctIndex': 0,
      'hint': 'Use midpoint formula: ((x1+x2)/2, (y1+y2)/2)',
      'explanation': 'Midpoint = ((−3+5)/2,(4+−2)/2)=(2/2,2/2)=(1,1)'
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
              'You have completed all questions in Coordinate Geometry Hard Practise 10!'),
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
          'Coordinate Geometry - Hard Practise 10',
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
