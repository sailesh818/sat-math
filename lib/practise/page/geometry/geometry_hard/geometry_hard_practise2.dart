import 'package:flutter/material.dart';

class GeometryHardPractise2 extends StatefulWidget {
  const GeometryHardPractise2({super.key});

  @override
  State<GeometryHardPractise2> createState() => _GeometryHardPractise2State();
}

class _GeometryHardPractise2State extends State<GeometryHardPractise2> {
  final List<Map<String, Object>> _questions = [
    {
      'question': '1. In a right triangle, one leg is 9 cm and the hypotenuse is 15 cm. What is the length of the other leg?',
      'options': ['12 cm', '10 cm', '13 cm', '14 cm'],
      'answer': '12 cm',
      'hint': 'Use Pythagoras theorem: a² + b² = c²',
      'explanation': 'Using the Pythagoras theorem: 9² + b² = 15² => b² = 15² - 9² => b² = 225 - 81 = 144 => b = √144 = 12 cm.'
    },
    {
      'question': '2. A circle has a radius of 10 cm. What is the area of a sector with a 60° central angle? (Use π ≈ 3.14)',
      'options': ['52.33 cm²', '50 cm²', '48 cm²', '55 cm²'],
      'answer': '52.33 cm²',
      'hint': 'Use the formula: Area = (θ / 360) × π × r²',
      'explanation': 'Area = (60 / 360) × 3.14 × 10² = (1/6) × 3.14 × 100 = 52.33 cm².'
    },
    {
      'question': '3. A rectangle has perimeter 50 cm and length 15 cm. What is the width?',
      'options': ['10 cm', '12 cm', '8 cm', '9 cm'],
      'answer': '10 cm',
      'hint': 'Use the perimeter formula: P = 2(l + w)',
      'explanation': 'Perimeter = 50, so 50 = 2(15 + w) => 50 = 30 + 2w => 2w = 20 => w = 10 cm.'
    },
    {
      'question': '4. An equilateral triangle has a perimeter of 24 cm. What is the area?',
      'options': ['16√3 cm²', '12√3 cm²', '18 cm²', '8√3 cm²'],
      'answer': '16√3 cm²',
      'hint': 'Use the formula for area of an equilateral triangle: Area = (√3 / 4) × a²',
      'explanation': 'Side of the equilateral triangle = 24 / 3 = 8 cm. Area = (√3 / 4) × 8² = (√3 / 4) × 64 = 16√3 cm².'
    },
    {
      'question': '5. A trapezoid has bases 12 cm and 20 cm, with height 8 cm. What is its area?',
      'options': ['128 cm²', '120 cm²', '125 cm²', '130 cm²'],
      'answer': '128 cm²',
      'hint': 'Use the area formula for trapezoid: Area = (1/2) × (b1 + b2) × h',
      'explanation': 'Area = (1/2) × (12 + 20) × 8 = (1/2) × 32 × 8 = 128 cm².'
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
            child: const Text('Back', style: TextStyle(color: Colors.deepPurple)),
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
            child: const Text('Restart', style: TextStyle(color: Colors.deepPurple)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          'Geometry - Hard Practise 2',
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
              color: Colors.deepPurple,
              backgroundColor: Colors.deepPurple.shade100,
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
                    backgroundColor: Colors.deepPurple,
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
                  color: Colors.deepPurple.shade100,
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
                  color: Colors.deepPurple.shade100,
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
                backgroundColor: Colors.deepPurple,
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
