import 'package:flutter/material.dart';

class GeometryHardPractise1 extends StatefulWidget {
  const GeometryHardPractise1({super.key});

  @override
  State<GeometryHardPractise1> createState() => _GeometryHardPractise1State();
}

class _GeometryHardPractise1State extends State<GeometryHardPractise1> {
  final List<Map<String, Object>> _questions = [
    {
      'question': '1. In triangle ABC, angle A = 50° and angle B = 60°. What is angle C?',
      'options': ['70°', '60°', '90°', '80°'],
      'answer': '70°',
      'hint': 'Sum of angles in a triangle is 180°.',
      'explanation': 'In a triangle, the sum of all angles is 180°. So, angle C = 180° - (50° + 60°) = 70°.'
    },
    {
      'question': '2. A circle has a circumference of 31.4 cm. What is the radius? (Use π ≈ 3.14)',
      'options': ['5 cm', '6 cm', '7 cm', '4 cm'],
      'answer': '5 cm',
      'hint': 'Use the formula: Circumference = 2 × π × radius.',
      'explanation': 'Circumference = 2 × 3.14 × radius. So, 31.4 = 6.28 × radius, which gives radius = 5 cm.'
    },
    {
      'question': '3. A square has an area of 196 cm². What is the length of its diagonal?',
      'options': ['14√2 cm', '14 cm', '28 cm', '7√2 cm'],
      'answer': '14√2 cm',
      'hint': 'Use the Pythagorean theorem for the diagonal of a square.',
      'explanation': 'Diagonal of a square = √(side² + side²) = √(14² + 14²) = 14√2 cm.'
    },
    {
      'question': '4. A trapezoid has bases 10 cm and 16 cm, and height 6 cm. What is its area?',
      'options': ['78 cm²', '76 cm²', '80 cm²', '72 cm²'],
      'answer': '78 cm²',
      'hint': 'Use the area formula for a trapezoid: Area = (1/2) × (base1 + base2) × height.',
      'explanation': 'Area = (1/2) × (10 + 16) × 6 = (1/2) × 26 × 6 = 78 cm².'
    },
    {
      'question': '5. A regular hexagon is inscribed in a circle with radius 12 cm. What is the perimeter of the hexagon?',
      'options': ['72 cm', '60 cm', '64 cm', '68 cm'],
      'answer': '72 cm',
      'hint': 'The side length of a regular hexagon is equal to the radius of the inscribed circle.',
      'explanation': 'The perimeter of a regular hexagon = 6 × side length. Since the radius is 12 cm, the perimeter = 6 × 12 = 72 cm.'
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
            child: const Text('Back', style: TextStyle(color: Colors.redAccent)),
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
            child: const Text('Restart', style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: const Text(
          'Geometry - Hard Practise 1',
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
              color: Colors.redAccent,
              backgroundColor: Colors.red.shade100,
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
                    backgroundColor: Colors.redAccent,
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
                  color: Colors.red.shade100,
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
                  color: Colors.red.shade100,
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
                backgroundColor: Colors.redAccent,
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
