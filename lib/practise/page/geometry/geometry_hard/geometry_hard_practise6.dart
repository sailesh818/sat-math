import 'package:flutter/material.dart';

class GeometryHardPractise6 extends StatefulWidget {
  const GeometryHardPractise6({super.key});

  @override
  State<GeometryHardPractise6> createState() => _GeometryHardPractise6State();
}

class _GeometryHardPractise6State extends State<GeometryHardPractise6> {
  final List<Map<String, Object>> _questions = [
    {
      'question': '1. A circle has a circumference of 31.4 cm. What is the radius? (Use π ≈ 3.14)',
      'options': ['5 cm', '6 cm', '4 cm', '7 cm'],
      'answer': '5 cm',
      'hint': 'Use the formula: Circumference = 2πr.',
      'explanation': 'Circumference = 2 * 3.14 * r = 31.4 => r = 31.4 / (2 * 3.14) = 5 cm.'
    },
    {
      'question': '2. A right triangle has legs 9 cm and 12 cm. What is the hypotenuse?',
      'options': ['15 cm', '13 cm', '14 cm', '16 cm'],
      'answer': '15 cm',
      'hint': 'Use Pythagoras theorem: a² + b² = c².',
      'explanation': 'Using Pythagoras theorem: c² = 9² + 12² = 81 + 144 = 225, so c = √225 = 15 cm.'
    },
    {
      'question': '3. A square has area 196 cm². What is its perimeter?',
      'options': ['56 cm', '52 cm', '50 cm', '54 cm'],
      'answer': '56 cm',
      'hint': 'The area of a square is s², where s is the side length.',
      'explanation': 'Side length s = √196 = 14 cm. Perimeter = 4 * 14 = 56 cm.'
    },
    {
      'question': '4. A trapezoid has bases 12 cm and 20 cm, and height 6 cm. What is its area?',
      'options': ['96 cm²', '90 cm²', '100 cm²', '92 cm²'],
      'answer': '96 cm²',
      'hint': 'Use the area formula for a trapezoid: Area = (1/2) * (b1 + b2) * h.',
      'explanation': 'Area = (1/2) * (12 + 20) * 6 = (1/2) * 32 * 6 = 96 cm².'
    },
    {
      'question': '5. An equilateral triangle has side length 10 cm. What is its height?',
      'options': ['5√3 cm', '6 cm', '4√3 cm', '5 cm'],
      'answer': '5√3 cm',
      'hint': 'Use the formula for the height of an equilateral triangle: h = (s√3)/2.',
      'explanation': 'Height = (10 * √3) / 2 = 5√3 cm.'
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
            child: const Text('Back', style: TextStyle(color: Colors.purple)),
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
            child: const Text('Restart', style: TextStyle(color: Colors.purple)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          'Geometry - Hard Practise 6',
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
              color: Colors.purple,
              backgroundColor: Colors.purple.shade100,
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

            // Hint Button
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
                    backgroundColor: Colors.purple,
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
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  question['hint'] as String,
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            // Explanation Section
            if (_answered)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Explanation: ${question['explanation']}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const Spacer(),

            // Next/Finish Button
            ElevatedButton(
              onPressed: _answered ? _nextQuestion : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                _currentQuestionIndex == _questions.length - 1
                    ? 'Finish'
                    : 'Next',
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
