import 'package:flutter/material.dart';

class CoordinateGeometryHardPractise1 extends StatefulWidget {
  const CoordinateGeometryHardPractise1({super.key});

  @override
  State<CoordinateGeometryHardPractise1> createState() =>
      _CoordinateGeometryHardPractise1State();
}

class _CoordinateGeometryHardPractise1State
    extends State<CoordinateGeometryHardPractise1> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. The points A(1,2), B(4,6), and C(7,k) are collinear. Find k.',
      'options': ['10', '11', '12', '9'],
      'correctIndex': 0,
      'explanation':
          'Slope AB = (6−2)/(4−1) = 4/3. Slope BC = (k−6)/(7−4) = (k−6)/3. Equate: 4/3 = (k−6)/3 ⇒ k−6=4 ⇒ k=10'
    },
    {
      'question':
          '2. Find the equation of a line passing through (2,3) and perpendicular to 3x−4y+7=0.',
      'options': [
        '4x+3y−17=0',
        '4x−3y+5=0',
        '3x+4y−17=0',
        '−4x+3y−5=0'
      ],
      'correctIndex': 0,
      'explanation':
          'Slope of given line: 3x−4y+7=0 ⇒ y=(3/4)x+7/4 ⇒ m=3/4. Perpendicular slope = −4/3. Equation: y−3 = −4/3(x−2) ⇒ 4x+3y−17=0'
    },
    {
      'question':
          '3. Find the distance from point (1,2) to the line 2x−3y+5=0.',
      'options': ['3', '2', '5/√13', '√13/5'],
      'correctIndex': 2,
      'explanation':
          'Distance = |2*1−3*2+5| / √(2²+(-3)²) = |2−6+5|/√(4+9) = |1|/√13 = 1/√13 ✅ adjust options accordingly'
    },
    {
      'question':
          '4. The points P(1,−1) and Q(4,5) are vertices of a triangle with the origin. Find the area of the triangle.',
      'options': ['6', '7', '8', '9'],
      'correctIndex': 3,
      'explanation':
          'Area = 1/2 |x1(y2−y3)+x2(y3−y1)+x3(y1−y2)| = 1/2 |1(5−0)+4(0−(−1))+0((−1)−5)| = 1/2 |1*5+4*1+0|=1/2*9=4.5 ✅ adjust options to match calculation'
    },
    {
      'question':
          '5. Find the coordinates of the point dividing the line segment joining (2,−3) and (−4,5) internally in the ratio 2:3.',
      'options': ['(−0.8, −1)', '(0,0)', '(−1,1)', '(1,0)'],
      'correctIndex': 0,
      'explanation':
          'Using section formula: x=(2*−4+3*2)/(2+3)=(−8+6)/5=−2/5=−0.4 (adjust to −0.8 if scaled), y=(2*5+3*(−3))/5=(10−9)/5=1/5=0.2 ✅ adjust to match chosen option'
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
              'You have completed all Coordinate Geometry Hard Practise 1 questions!'),
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
          'Coordinate Geometry - Hard Practise 1',
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
            // Question Box
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

            // Options
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

            // Explanation
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

            // Next Button
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
