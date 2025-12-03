import 'package:flutter/material.dart';

class GeometryHardPractise3 extends StatefulWidget {
  const GeometryHardPractise3({super.key});

  @override
  State<GeometryHardPractise3> createState() => _GeometryHardPractise3State();
}

class _GeometryHardPractise3State extends State<GeometryHardPractise3> {
  final List<Map<String, Object>> _questions = [
    {
      'question': '1. A circle has a diameter of 18 cm. What is the area of the circle? (Use π ≈ 3.14)',
      'options': ['254.34 cm²', '256 cm²', '250 cm²', '260 cm²'],
      'answer': '254.34 cm²',
      'hint': 'Use the formula: Area = π * r². First, find the radius.',
      'explanation': 'Radius = diameter / 2 = 18 / 2 = 9 cm. Area = 3.14 * 9² = 254.34 cm².'
    },
    {
      'question': '2. In a right triangle, the legs are 7 cm and 24 cm. What is the hypotenuse?',
      'options': ['25 cm', '26 cm', '23 cm', '24 cm'],
      'answer': '25 cm',
      'hint': 'Use Pythagoras theorem: a² + b² = c²',
      'explanation': 'Using the Pythagoras theorem: 7² + 24² = c² => 49 + 576 = c² => c = √625 = 25 cm.'
    },
    {
      'question': '3. A square has a diagonal of 10√2 cm. What is its area?',
      'options': ['100 cm²', '50 cm²', '80 cm²', '120 cm²'],
      'answer': '100 cm²',
      'hint': 'Use the formula: Area = (diagonal²) / 2',
      'explanation': 'Area = (10√2)² / 2 = 200 / 2 = 100 cm².'
    },
    {
      'question': '4. A trapezoid has bases 14 cm and 22 cm, with height 9 cm. What is its area?',
      'options': ['162 cm²', '150 cm²', '160 cm²', '170 cm²'],
      'answer': '162 cm²',
      'hint': 'Use the formula: Area = (1/2) * (b1 + b2) * h',
      'explanation': 'Area = (1/2) * (14 + 22) * 9 = 162 cm².'
    },
    {
      'question': '5. An equilateral triangle has side length 12 cm. What is its area?',
      'options': ['36√3 cm²', '32√3 cm²', '30√3 cm²', '34√3 cm²'],
      'answer': '36√3 cm²',
      'hint': 'Use the formula: Area = (√3 / 4) * a²',
      'explanation': 'Area = (√3 / 4) * 12² = 36√3 cm².'
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
            child: const Text('Back', style: TextStyle(color: Colors.orange)),
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
            child: const Text('Restart', style: TextStyle(color: Colors.orange)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          'Geometry - Hard Practise 3',
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
              color: Colors.orange,
              backgroundColor: Colors.orange.shade100,
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
                    backgroundColor: Colors.orange,
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
                  color: Colors.orange.shade100,
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
                  color: Colors.orange.shade100,
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
                backgroundColor: Colors.orange,
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
