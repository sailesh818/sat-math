import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise2 extends StatefulWidget {
  const CoordinateGeometryHardPractise2({super.key});

  @override
  State<CoordinateGeometryHardPractise2> createState() =>
      _CoordinateGeometryHardPractise2State();
}

class _CoordinateGeometryHardPractise2State
    extends State<CoordinateGeometryHardPractise2> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Find the slope of the line passing through points (−3,5) and (4,−2).',
      'options': ['−1', '1', '−7/7', '−1.0'],
      'correctIndex': 0,
      'explanation':
          'Slope = (−2−5)/(4−(−3)) = (−7)/7 = −1'
    },
    {
      'question':
          '2. Equation of a line passing through (1,−2) and parallel to 2x−3y+5=0:',
      'options': [
        '2x−3y−8=0',
        '3x−2y+4=0',
        '2x−3y+1=0',
        '2x+3y−7=0'
      ],
      'correctIndex': 0,
      'explanation':
          'Parallel lines have same slope. Use point-slope form: 2x−3y+c=0. Plug in (1,−2): 2*1−3*(−2)+c=0 ⇒ 2+6+c=0 ⇒ c=−8. Equation: 2x−3y−8=0'
    },
    {
      'question':
          '3. Distance between points (−5,1) and (2,4):',
      'options': ['√58', '√50', '√52', '√45'],
      'correctIndex': 0,
      'explanation':
          'Distance = √[(2−(−5))² + (4−1)²] = √[7²+3²]=√[49+9]=√58'
    },
    {
      'question':
          '4. Find the midpoint of the line joining (−6,3) and (4,−1):',
      'options': ['(−1,1)', '(−2,1)', '(−1,−1)', '(0,1)'],
      'correctIndex': 0,
      'explanation':
          'Midpoint = ((−6+4)/2, (3+−1)/2) = (−2/2,2/2) = (−1,1)'
    },
    {
      'question':
          '5. Are points (1,2), (3,6), (5,10) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 0,
      'explanation':
          'Slope between first two: (6−2)/(3−1)=4/2=2; slope between second two: (10−6)/(5−3)=4/2=2 ⇒ Yes, collinear'
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
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('🎉 Well Done!'),
          content: const Text(
              'You have completed all questions in Coordinate Geometry Hard Practise 2!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
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
          'Coordinate Geometry - Hard Practise 2',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
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
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text(option),
                  onTap: () => checkAnswer(index),
                ),
              );
            }),
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
            const Spacer(),
            ElevatedButton(
              onPressed: nextQuestion,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                currentQuestionIndex == questions.length - 1
                    ? 'Finish'
                    : 'Next',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
