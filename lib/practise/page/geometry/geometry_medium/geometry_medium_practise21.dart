import 'package:flutter/material.dart';

class GeometryMediumPractise21 extends StatefulWidget {
  const GeometryMediumPractise21({super.key});

  @override
  State<GeometryMediumPractise21> createState() => _GeometryMediumPractise21State();
}

class _GeometryMediumPractise21State extends State<GeometryMediumPractise21> {
  final List<Map<String, Object>> _questions = [
    {
      'question': '1. A triangle has sides 12 cm, 16 cm, and 20 cm. What type of triangle is it?',
      'options': ['Right triangle', 'Acute triangle', 'Obtuse triangle', 'Isosceles triangle'],
      'answer': 'Right triangle',
      'hint': 'Check if the sides satisfy the Pythagorean theorem.',
      'explanation': 'A triangle with sides 12, 16, and 20 satisfies the Pythagorean theorem: 12² + 16² = 20², hence it is a right triangle.'
    },
    {
      'question': '2. A circle has a radius of 8 cm. What is its circumference? (Use π ≈ 3.14)',
      'options': ['50.24 cm', '48 cm', '52 cm', '49 cm'],
      'answer': '50.24 cm',
      'hint': 'Use the formula: Circumference = 2 × π × radius.',
      'explanation': 'Circumference = 2 × 3.14 × 8 = 50.24 cm.'
    },
    {
      'question': '3. A rectangle has length 20 cm and width 21 cm. What is the diagonal?',
      'options': ['29 cm', '30 cm', '31 cm', '28 cm'],
      'answer': '29 cm',
      'hint': 'Use the Pythagorean theorem: diagonal² = length² + width².',
      'explanation': 'Diagonal = √(20² + 21²) = √(400 + 441) = √841 = 29 cm.'
    },
    {
      'question': '4. A rhombus has diagonals 10 cm and 30 cm. What is its area?',
      'options': ['150 cm²', '155 cm²', '160 cm²', '145 cm²'],
      'answer': '150 cm²',
      'hint': 'Use the formula: Area = (diagonal1 × diagonal2) / 2.',
      'explanation': 'Area = (10 × 30) / 2 = 150 cm².'
    },
    {
      'question': '5. A regular pentagon has a perimeter of 85 cm. What is the length of one side?',
      'options': ['17 cm', '16 cm', '18 cm', '15 cm'],
      'answer': '17 cm',
      'hint': 'Use the formula: Side length = Perimeter / 5.',
      'explanation': 'Side length = 85 / 5 = 17 cm.'
    },
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;
  String? _selectedAnswer;
  bool _answered = false;
  bool _showHint = false;

  void _checkAnswer(String selectedOption) {
    if (_answered) return;

    final correctAnswer = _questions[_currentQuestionIndex]['answer'] as String;
    setState(() {
      _selectedAnswer = selectedOption;
      _answered = true;
      if (selectedOption == correctAnswer) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = null;
        _answered = false;
        _showHint = false;
      });
    } else {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('🎯 Practice Completed!'),
        content: Text(
          'You scored $_score out of ${_questions.length}',
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Back', style: TextStyle(color: Colors.teal)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _score = 0;
                _currentQuestionIndex = 0;
                _selectedAnswer = null;
                _answered = false;
              });
            },
            child: const Text('Restart', style: TextStyle(color: Colors.teal)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text(
          'Geometry - Medium Practise 21',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / _questions.length,
              color: Colors.teal,
              backgroundColor: Colors.teal.shade100,
            ),
            const SizedBox(height: 20),
            Text(
              question['question'] as String,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),
            ...(question['options'] as List<String>).map((option) {
              final isSelected = option == _selectedAnswer;
              final isCorrect = option == question['answer'];
              Color getColor() {
                if (!_answered) return Colors.white;
                if (isCorrect) return Colors.green.shade200;
                if (isSelected && !isCorrect) return Colors.red.shade200;
                return Colors.white;
              }

              return Card(
                color: getColor(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  title: Text(option, style: const TextStyle(fontSize: 18)),
                  onTap: () => _checkAnswer(option),
                ),
              );
            }),
            const SizedBox(height: 20),

            // Hint button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () => setState(() {
                    _showHint = !_showHint;
                  }),
                  icon: const Icon(Icons.lightbulb_outline, color: Colors.white),
                  label: const Text("Hint", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ],
            ),

            if (_showHint)
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  question['hint'] as String,
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            // Explanation
            if (_answered)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Explanation: ${question['explanation']}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const Spacer(),

            // Next button
            ElevatedButton(
              onPressed: _answered ? _nextQuestion : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                _currentQuestionIndex == _questions.length - 1 ? 'Finish' : 'Next',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
