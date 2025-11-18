import 'package:flutter/material.dart';

class FunctionsHardPractise16 extends StatefulWidget {
  const FunctionsHardPractise16({super.key});

  @override
  State<FunctionsHardPractise16> createState() =>
      _FunctionsHardPractise16State();
}

class _FunctionsHardPractise16State extends State<FunctionsHardPractise16> {
  final List<Map<String, Object>> _questions = [
    {
      'question': '1. If f(x) = 4x³ − 3x² + 2x − 1, find f(1).',
      'options': ['2', '3', '4', '1'],
      'answer': '2',
    },
    {
      'question': '2. Solve for x: x³ − 6x² + 11x − 6 = 0.',
      'options': ['x = 1, 2, 3', 'x = 1, 3, 4', 'x = 2, 3, 4', 'x = 0, 1, 2'],
      'answer': 'x = 1, 2, 3',
    },
    {
      'question': '3. If g(x) = x² + x and f(x) = 2x − 1, find (f ∘ g)(2).',
      'options': ['5', '7', '9', '3'],
      'answer': '5',
    },
    {
      'question': '4. If f(x) = √(x + 7), find x such that f(x) = 5.',
      'options': ['18', '16', '20', '17'],
      'answer': '18',
    },
    {
      'question': '5. If f(x) = x³ + x² − x − 1, find f(−1).',
      'options': ['0', '−2', '2', '1'],
      'answer': '0',
    },
  ];

  int _currentQuestion = 0;
  String _selectedAnswer = '';
  bool _isAnswered = false;
  int _score = 0;

  void _checkAnswer(String value) {
    if (_isAnswered) return;
    setState(() {
      _selectedAnswer = value;
      _isAnswered = true;
      if (value == _questions[_currentQuestion]['answer']) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestion < _questions.length - 1) {
        _currentQuestion++;
        _selectedAnswer = '';
        _isAnswered = false;
      } else {
        _showFinalScore();
      }
    });
  }

  void _showFinalScore() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('🎯 Practice Complete'),
        content: Text('You scored $_score out of ${_questions.length}!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _currentQuestion = 0;
                _score = 0;
                _selectedAnswer = '';
                _isAnswered = false;
              });
            },
            child: const Text('Restart'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final current = _questions[_currentQuestion];
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text(
          'Functions Hard Practice 16',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              current['question'] as String,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            ...(current['options'] as List<String>).map((option) {
              final isSelected = option == _selectedAnswer;
              final isCorrect =
                  option == current['answer'] && _isAnswered;
              final isWrong = isSelected && !isCorrect;

              Color? color;
              if (_isAnswered) {
                if (isCorrect) color = Colors.green;
                if (isWrong) color = Colors.red;
              }

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color ?? Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: const BorderSide(color: Colors.green, width: 1.5),
                  ),
                  onPressed: () => _checkAnswer(option),
                  child: Text(option),
                ),
              );
            }),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: Text(
                  _currentQuestion == _questions.length - 1
                      ? 'Finish'
                      : 'Next',
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
