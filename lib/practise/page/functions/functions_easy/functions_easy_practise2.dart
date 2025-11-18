import 'package:flutter/material.dart';

class FunctionsEasyPractise2 extends StatefulWidget {
  const FunctionsEasyPractise2({super.key});

  @override
  State<FunctionsEasyPractise2> createState() => _FunctionsEasyPractise2State();
}

class _FunctionsEasyPractise2State extends State<FunctionsEasyPractise2> {
  final List<Map<String, Object>> _questions = [
    {
      'question': '1. If f(x) = x + 5, what is f(3)?',
      'options': ['5', '7', '8', '9'],
      'answer': '8',
    },
    {
      'question': '2. If f(x) = 4x, what is f(6)?',
      'options': ['10', '20', '24', '26'],
      'answer': '24',
    },
    {
      'question': '3. If f(x) = x² + 2, what is f(3)?',
      'options': ['9', '10', '11', '12'],
      'answer': '11',
    },
    {
      'question': '4. If f(x) = 2x - 1, find f(7).',
      'options': ['13', '14', '15', '12'],
      'answer': '13',
    },
    {
      'question': '5. If f(x) = x / 4, what is f(12)?',
      'options': ['2', '3', '4', '6'],
      'answer': '3',
    },
    {
      'question': '6. If f(x) = 3x + 2, what is f(0)?',
      'options': ['2', '0', '3', '-2'],
      'answer': '2',
    },
    {
      'question': '7. If f(x) = x - 8, what is f(15)?',
      'options': ['5', '6', '7', '8'],
      'answer': '7',
    },
    {
      'question': '8. If f(x) = 5x, what is f(2)?',
      'options': ['7', '8', '9', '10'],
      'answer': '10',
    },
    {
      'question': '9. If f(x) = x², find f(8).',
      'options': ['16', '32', '64', '81'],
      'answer': '64',
    },
    {
      'question': '10. If f(x) = x + x, what is f(9)?',
      'options': ['9', '18', '27', '36'],
      'answer': '18',
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
          'Functions - Easy Practise 2',
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
