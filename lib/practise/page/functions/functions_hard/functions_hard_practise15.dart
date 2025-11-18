import 'package:flutter/material.dart';

class FunctionsHardPractise15 extends StatefulWidget {
  const FunctionsHardPractise15({super.key});

  @override
  State<FunctionsHardPractise15> createState() =>
      _FunctionsHardPractise15State();
}

class _FunctionsHardPractise15State extends State<FunctionsHardPractise15> {
  final List<Map<String, Object>> _questions = [
    {
      'question': '1. If f(x) = x³ + 3x² − x − 3, find f(1).',
      'options': ['0', '1', '2', '3'],
      'answer': '0',
    },
    {
      'question': '2. Solve for x: 2x³ − 3x² − 5x + 6 = 0.',
      'options': ['x = 1, 2, -3', 'x = 1, -1, 3', 'x = 2, -1, 3', 'x = 1, 2, 3'],
      'answer': 'x = 1, 2, -3',
    },
    {
      'question': '3. If g(x) = 2x − 1 and f(x) = x² + 1, find (f ∘ g)(4).',
      'options': ['49', '64', '36', '81'],
      'answer': '49',
    },
    {
      'question': '4. If f(x) = √(x² − 4), find x such that f(x) = 3.',
      'options': ['x = ±5', 'x = ±7', 'x = ±6', 'x = ±4'],
      'answer': 'x = ±5',
    },
    {
      'question': '5. If f(x) = x³ − 4x + 2, find f(0).',
      'options': ['2', '0', '1', '−2'],
      'answer': '2',
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
          'Functions Hard Practice 15',
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
