import 'package:flutter/material.dart';

class FunctionsEasyPractise13 extends StatefulWidget {
  const FunctionsEasyPractise13({super.key});

  @override
  State<FunctionsEasyPractise13> createState() => _FunctionsEasyPractise13State();
}

class _FunctionsEasyPractise13State extends State<FunctionsEasyPractise13> {
  final List<Map<String, Object>> _questions = [
    {
      'question': '1. If f(x) = 2x − 1, what is f(5)?',
      'options': ['9', '10', '11', '8'],
      'answer': '9'
    },
    {
      'question': '2. If g(x) = x² − x, find g(4).',
      'options': ['12', '16', '20', '8'],
      'answer': '12'
    },
    {
      'question': '3. If f(x) = x + 7, what is f(−3)?',
      'options': ['4', '5', '3', '2'],
      'answer': '4'
    },
    {
      'question': '4. If h(x) = 3 − x, find h(1).',
      'options': ['2', '1', '0', '3'],
      'answer': '2'
    },
    {
      'question': '5. If f(x) = 4x + 5, find the inverse function f⁻¹(x).',
      'options': ['(x − 5)/4', '(x + 5)/4', '(x − 4)/5', '(x + 4)/5'],
      'answer': '(x − 5)/4'
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
          'Functions Easy Practice 13',
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
