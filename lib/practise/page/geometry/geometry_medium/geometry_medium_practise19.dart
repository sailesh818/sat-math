import 'package:flutter/material.dart';

class GeometryMediumPractise19 extends StatefulWidget {
  const GeometryMediumPractise19({super.key});

  @override
  State<GeometryMediumPractise19> createState() => _GeometryMediumPractise19State();
}

class _GeometryMediumPractise19State extends State<GeometryMediumPractise19> {
  final List<Map<String, Object>> _questions = [
    {
      'question': '1. A triangle has sides 9 cm, 12 cm, and 15 cm. What type of triangle is it?',
      'options': ['Right triangle', 'Acute triangle', 'Obtuse triangle', 'Equilateral triangle'],
      'answer': 'Right triangle',
      'hint': 'Check if the sides satisfy the Pythagorean theorem.',
      'explanation': 'A triangle with sides 9, 12, and 15 satisfies the Pythagorean theorem: 9² + 12² = 15², hence it is a right triangle.'
    },
    {
      'question': '2. A circle has a diameter of 14 cm. What is its circumference? (Use π ≈ 3.14)',
      'options': ['43.96 cm', '40 cm', '45 cm', '42 cm'],
      'answer': '43.96 cm',
      'hint': 'Use the formula: Circumference = π × diameter.',
      'explanation': 'Circumference = 3.14 × 14 = 43.96 cm.'
    },
    {
      'question': '3. A rectangle has length 16 cm and width 30 cm. What is the diagonal?',
      'options': ['34 cm', '32 cm', '33 cm', '35 cm'],
      'answer': '34 cm',
      'hint': 'Use the Pythagorean theorem: diagonal² = length² + width².',
      'explanation': 'Diagonal = √(16² + 30²) = √(256 + 900) = √1156 = 34 cm.'
    },
    {
      'question': '4. A rhombus has diagonals 18 cm and 24 cm. What is its area?',
      'options': ['216 cm²', '220 cm²', '210 cm²', '200 cm²'],
      'answer': '216 cm²',
      'hint': 'Use the formula: Area = (diagonal1 × diagonal2) / 2.',
      'explanation': 'Area = (18 × 24) / 2 = 216 cm².'
    },
    {
      'question': '5. A regular hexagon has a perimeter of 72 cm. What is the length of one side?',
      'options': ['12 cm', '14 cm', '10 cm', '13 cm'],
      'answer': '12 cm',
      'hint': 'Use the formula: Side length = Perimeter / 6.',
      'explanation': 'Side length = 72 / 6 = 12 cm.'
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
            child: const Text('Back', style: TextStyle(color: Colors.indigo)),
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
            child: const Text('Restart', style: TextStyle(color: Colors.indigo)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          'Geometry - Medium Practice 19',
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
              color: Colors.indigo,
              backgroundColor: Colors.indigo.shade100,
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
                    backgroundColor: Colors.indigo,
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
                  color: Colors.indigo.shade100,
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
                  color: Colors.indigo.shade100,
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
                backgroundColor: Colors.indigo,
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
