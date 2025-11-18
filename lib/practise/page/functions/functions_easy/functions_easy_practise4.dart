import 'package:flutter/material.dart';

class FunctionsEasyPractise4 extends StatefulWidget {
  const FunctionsEasyPractise4({super.key});

  @override
  State<FunctionsEasyPractise4> createState() => _FunctionsEasyPractise4State();
}

class _FunctionsEasyPractise4State extends State<FunctionsEasyPractise4> {
  final List<Map<String, Object>> _questions = [
    {
      'question':
          '1. If f(x) = x + 3 and g(x) = 2x, then what is f(g(2))?',
      'options': ['5', '6', '7', '8'],
      'answer': '7',
    },
    {
      'question':
          '2. If f(x) = 3x - 2 and g(x) = x + 4, what is g(f(2))?',
      'options': ['6', '7', '8', '9'],
      'answer': '8',
    },
    {
      'question': '3. If f(x) = x - 5, find the value of x for which f(x) = 0.',
      'options': ['3', '4', '5', '6'],
      'answer': '5',
    },
    {
      'question':
          '4. If f(x) = 2x + 1, what is the inverse function f⁻¹(x)?',
      'options': ['(x - 1)/2', '(x + 1)/2', '(x/2) + 1', '2x - 1'],
      'answer': '(x - 1)/2',
    },
    {
      'question':
          '5. If f(x) = x² and g(x) = x + 1, what is f(g(3))?',
      'options': ['9', '10', '15', '16'],
      'answer': '16',
    },
    {
      'question':
          '6. If f(x) = 3x + 4, what is x when f(x) = 13?',
      'options': ['2', '3', '4', '5'],
      'answer': '3',
    },
    {
      'question':
          '7. If f(x) = 2x - 3 and g(x) = x², find g(f(3)).',
      'options': ['4', '6', '9', '16'],
      'answer': '9',
    },
    {
      'question':
          '8. If f(x) = 5x + 2, what is f⁻¹(12)?',
      'options': ['1', '2', '3', '4'],
      'answer': '2',
    },
    {
      'question':
          '9. If f(x) = x/3 + 1, what is the value of f(6)?',
      'options': ['2', '3', '4', '5'],
      'answer': '3',
    },
    {
      'question':
          '10. If f(x) = 4x - 7 and g(x) = x + 5, find f(g(1)).',
      'options': ['8', '9', '10', '11'],
      'answer': '8',
    },
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;
  String? _selectedAnswer;
  bool _answered = false;

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
            child: const Text('Back', style: TextStyle(color: Colors.green)),
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
            child:
                const Text('Restart', style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          'Functions - Easy Practise 4',
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
              color: Colors.green,
              backgroundColor: Colors.green.shade100,
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
            const Spacer(),
            ElevatedButton(
              onPressed: _answered ? _nextQuestion : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
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
