import 'package:flutter/material.dart';

class FunctionsMediumPractise9 extends StatefulWidget {
  const FunctionsMediumPractise9({super.key});

  @override
  State<FunctionsMediumPractise9> createState() =>
      _FunctionsMediumPractise9State();
}

class _FunctionsMediumPractise9State extends State<FunctionsMediumPractise9> {
  final List<Map<String, Object>> _questions = [
    {
      'question': '1. If f(x) = 2x + 5 and g(x) = x − 3, find (f ∘ g)(4).',
      'options': ['7', '9', '11', '13'],
      'answer': '7',
    },
    {
      'question': '2. If f(x) = x² + 3x and g(x) = 2x − 1, find (g ∘ f)(2).',
      'options': ['11', '15', '17', '19'],
      'answer': '15',
    },
    {
      'question': '3. If f(x) = 3x − 4, find x such that f(x) = 8.',
      'options': ['2', '3', '4', '5'],
      'answer': '4',
    },
    {
      'question': '4. If f(x) = x² − x − 6, find f(3).',
      'options': ['0', '2', '3', '4'],
      'answer': '0',
    },
    {
      'question': '5. If f(x) = 5x + 9, find the inverse function f⁻¹(x).',
      'options': ['(x − 9)/5', '(x + 9)/5', '(5x + 9)/1', '(x − 5)/9'],
      'answer': '(x − 9)/5',
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
          'Functions Medium Practice 9',
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
