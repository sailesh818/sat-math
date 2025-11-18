import 'package:flutter/material.dart';

class FunctionsHardPractise8 extends StatefulWidget {
  const FunctionsHardPractise8({super.key});

  @override
  State<FunctionsHardPractise8> createState() =>
      _FunctionsHardPractise8State();
}

class _FunctionsHardPractise8State extends State<FunctionsHardPractise8> {
  final List<Map<String, Object>> _questions = [
    {
      'question': '1. If f(x) = 2x³ − 3x² + 5x − 6, find f(2).',
      'options': ['2', '6', '8', '10'],
      'answer': '6',
    },
    {
      'question': '2. If f(x) = 3x² + 2x − 1, solve f(x) = 0.',
      'options': ['x = −1 or ⅓', 'x = 1 or −⅓', 'x = 1 or 3', 'x = −2 or 2'],
      'answer': 'x = −1 or ⅓',
    },
    {
      'question': '3. If f(x) = 2x + 1 and g(x) = x² − 1, find (f ∘ g)(2).',
      'options': ['7', '6', '5', '8'],
      'answer': '7',
    },
    {
      'question': '4. If f(x) = 4x − 7, find x such that f(x) = 5.',
      'options': ['x = 3', 'x = 2', 'x = 1', 'x = 4'],
      'answer': 'x = 3',
    },
    {
      'question': '5. If f(x) = √(x² + 1), find x such that f(x) = 5.',
      'options': ['x = 4', 'x = 3', 'x = 2', 'x = 5'],
      'answer': 'x = 4',
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
          'Functions Hard Practice 8',
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
