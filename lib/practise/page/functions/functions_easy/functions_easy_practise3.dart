import 'package:flutter/material.dart';

class FunctionsEasyPractise3 extends StatefulWidget {
  const FunctionsEasyPractise3({super.key});

  @override
  State<FunctionsEasyPractise3> createState() => _FunctionsEasyPractise3State();
}

class _FunctionsEasyPractise3State extends State<FunctionsEasyPractise3> {
  final List<Map<String, Object>> _questions = [
    {
      'question': '1. If f(x) = x + 10, what is f(5)?',
      'options': ['10', '12', '14', '15'],
      'answer': '15',
    },
    {
      'question': '2. If f(x) = 2x², what is f(3)?',
      'options': ['9', '12', '15', '18'],
      'answer': '18',
    },
    {
      'question': '3. If f(x) = 6x - 2, what is f(4)?',
      'options': ['20', '22', '24', '26'],
      'answer': '22',
    },
    {
      'question': '4. If f(x) = x / 5, what is f(25)?',
      'options': ['3', '4', '5', '6'],
      'answer': '5',
    },
    {
      'question': '5. If f(x) = 7x + 1, what is f(0)?',
      'options': ['0', '1', '7', '-1'],
      'answer': '1',
    },
    {
      'question': '6. If f(x) = x² + x, what is f(4)?',
      'options': ['12', '16', '20', '24'],
      'answer': '20',
    },
    {
      'question': '7. If f(x) = 9 - x, find f(5).',
      'options': ['3', '4', '5', '6'],
      'answer': '4',
    },
    {
      'question': '8. If f(x) = 2x + 8, what is f(6)?',
      'options': ['18', '20', '22', '24'],
      'answer': '20',
    },
    {
      'question': '9. If f(x) = x³, find f(2).',
      'options': ['4', '6', '8', '10'],
      'answer': '8',
    },
    {
      'question': '10. If f(x) = x² - 3x, what is f(5)?',
      'options': ['10', '15', '20', '25'],
      'answer': '10',
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
          'Functions - Easy Practise 3',
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
