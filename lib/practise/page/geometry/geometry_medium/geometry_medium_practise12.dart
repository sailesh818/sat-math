import 'package:flutter/material.dart';

class GeometryMediumPractise12 extends StatefulWidget {
  const GeometryMediumPractise12({super.key});

  @override
  State<GeometryMediumPractise12> createState() =>
      _GeometryMediumPractise12State();
}

class _GeometryMediumPractise12State extends State<GeometryMediumPractise12> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. A triangle has angles in the ratio 3:4:5. What is the measure of the smallest angle?',
      'options': ['45°', '30°', '36°', '40°'],
      'correctIndex': 2,
      'hint': 'The sum of angles in a triangle is 180°. Use the ratio to find the angles.',
      'explanation':
          'The total of the ratios is 3 + 4 + 5 = 12. So, 180 ÷ 12 = 15°. Then, multiply 3 by 15 to find the smallest angle: 3 × 15 = 45°.'
    },
    {
      'question': '2. A circle has a radius of 10 cm. What is its area? (Use π ≈ 3.14)',
      'options': ['314 cm²', '300 cm²', '320 cm²', '310 cm²'],
      'correctIndex': 0,
      'hint': 'Area = π × r²',
      'explanation': 'Area = 3.14 × 10² = 3.14 × 100 = 314 cm²'
    },
    {
      'question':
          '3. A rectangle has a length of 14 cm and width of 9 cm. What is the diagonal?',
      'options': ['16.4 cm', '17 cm', '15 cm', '16 cm'],
      'correctIndex': 0,
      'hint': 'Use Pythagoras theorem: diagonal² = length² + width²',
      'explanation': 'Diagonal = √(14² + 9²) = √(196 + 81) = √277 = 16.4 cm'
    },
    {
      'question':
          '4. A rhombus has diagonals of 10 cm and 24 cm. What is its area?',
      'options': ['120 cm²', '100 cm²', '110 cm²', '130 cm²'],
      'correctIndex': 0,
      'hint': 'Area = (diagonal1 × diagonal2) ÷ 2',
      'explanation': 'Area = (10 × 24) ÷ 2 = 240 ÷ 2 = 120 cm²'
    },
    {
      'question':
          '5. A regular pentagon has perimeter 60 cm. What is the length of one side?',
      'options': ['12 cm', '10 cm', '11 cm', '13 cm'],
      'correctIndex': 0,
      'hint': 'Side length = perimeter ÷ 5',
      'explanation': 'Side = 60 ÷ 5 = 12 cm'
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
        builder: (_) => AlertDialog(
          title: const Text('🎯 Practice Completed!'),
          content: Text(
            'You completed ${questions.length} questions!',
            style: const TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child:
                  const Text('Back', style: TextStyle(color: Colors.brown)),
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
              child:
                  const Text('Restart', style: TextStyle(color: Colors.brown)),
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
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: const Text(
          'Geometry - Medium Practise 12',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.brown,
              backgroundColor: Colors.brown.shade100,
            ),
            const SizedBox(height: 20),

            // QUESTION
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w600, height: 1.4),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // OPTIONS
            ...List.generate(question['options'].length, (index) {
              final option = question['options'][index];
              final isSelected = selectedAnswerIndex == index;
              final isCorrect =
                  answerChecked && index == question['correctIndex'];
              final isWrong = answerChecked && isSelected && !isCorrect;

              return Card(
                color: isCorrect
                    ? Colors.lightGreen.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.brown,
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(option, style: const TextStyle(fontSize: 17)),
                  onTap: () => checkAnswer(index),
                ),
              );
            }),
            const SizedBox(height: 10),

            // HINT BUTTON
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
                    backgroundColor: Colors.brown.shade400,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ],
            ),

            if (showHint)
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.brown.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  question['hint'],
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            // EXPLANATION
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.brown.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Explanation: ${question['explanation']}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            // NEXT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: answerChecked ? nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1
                      ? "Finish"
                      : "Next Question",
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
