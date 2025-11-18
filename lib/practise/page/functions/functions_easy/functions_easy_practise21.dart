import 'package:flutter/material.dart';

class FunctionsEasyPractise21 extends StatefulWidget {
  const FunctionsEasyPractise21({super.key});

  @override
  State<FunctionsEasyPractise21> createState() => _FunctionsEasyPractise21State();
}

class _FunctionsEasyPractise21State extends State<FunctionsEasyPractise21> {
  final List<Map<String, Object>> _questions = [
    {
      'question': '1. If f(x) = x + 8, what is f(1)?',
      'options': ['8', '9', '10', '7'],
      'answer': '9'
    },
    {
      'question': '2. If g(x) = 2x + 3, find g(4).',
      'options': ['10', '11', '12', '9'],
      'answer': '11'
    },
    {
      'question': '3. If f(x) = x² − 3, what is f(3)?',
      'options': ['6', '9', '7', '8'],
      'answer': '6'
    },
    {
      'question': '4. If h(x) = 1/(x + 4), find h(1).',
      'options': ['0.2', '0.25', '0.3', '0.33'],
      'answer': '0.2'
    },
    {
      'question': '5. If f(x) = 3x + 2, find the inverse function f⁻¹(x).',
      'options': ['(x − 2)/3', '(x + 2)/3', '(x − 3)/2', '(x + 3)/2'],
      'answer': '(x − 2)/3'
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
          'Functions Easy Practice 21',
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
