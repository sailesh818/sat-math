import 'package:flutter/material.dart';

class GeometryHardPractise14 extends StatefulWidget {
  const GeometryHardPractise14({super.key});

  @override
  State<GeometryHardPractise14> createState() => _GeometryHardPractise14State();
}

class _GeometryHardPractise14State extends State<GeometryHardPractise14> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. A right triangle has legs 8 cm and 15 cm. What is the hypotenuse?',
      'options': ['17 cm', '16 cm', '18 cm', '15 cm'],
      'correctIndex': 0,
      'hint': 'Use the Pythagorean theorem: a² + b² = c².',
      'explanation': 'Hypotenuse c = √(8² + 15²) = √(64 + 225) = √289 = 17 cm.',
    },
    {
      'question': '2. A circle has radius 12 cm. What is the area of a quarter circle? (Use π ≈ 3.14)',
      'options': ['113.04 cm²', '110 cm²', '115 cm²', '120 cm²'],
      'correctIndex': 0,
      'hint': 'Area of quarter circle = 1/4 * π * r².',
      'explanation': 'Area = 0.25 * 3.14 * 12² = 0.25 * 3.14 * 144 ≈ 113.04 cm².',
    },
    {
      'question': '3. A square has area 225 cm². What is the length of its diagonal?',
      'options': ['15√2 cm', '14√2 cm', '16 cm', '13√2 cm'],
      'correctIndex': 0,
      'hint': 'Diagonal = side * √2. Side = √area.',
      'explanation': 'Side = √225 = 15 cm. Diagonal = 15 * √2 = 15√2 cm.',
    },
    {
      'question': '4. A trapezoid has bases 10 cm and 18 cm, height 7 cm. What is its area?',
      'options': ['98 cm²', '100 cm²', '96 cm²', '105 cm²'],
      'correctIndex': 0,
      'hint': 'Area = 1/2 * (b₁ + b₂) * height.',
      'explanation': 'Area = 0.5 * (10 + 18) * 7 = 0.5 * 28 * 7 = 98 cm².',
    },
    {
      'question': '5. An equilateral triangle has side length 14 cm. What is its height?',
      'options': ['7√3 cm', '8√3 cm', '6√3 cm', '9 cm'],
      'correctIndex': 0,
      'hint': 'Height = (side * √3) / 2.',
      'explanation': 'Height = 14 * √3 / 2 = 7√3 cm.',
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
          title: const Text('🎉 Great Job!'),
          content: const Text('You have completed all practise questions!'),
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
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          'Geometry - Hard Practise 14',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// QUESTION CARD
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// OPTIONS
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
                    backgroundColor: Colors.orange,
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    option,
                    style: const TextStyle(fontSize: 17),
                  ),
                  onTap: () => checkAnswer(index),
                ),
              );
            }),

            const SizedBox(height: 10),

            /// HINT BUTTON
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
                    backgroundColor: Colors.brown,
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
                  color: Colors.orange.shade100,
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
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Explanation: ${question['explanation']}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            /// NEXT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
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
