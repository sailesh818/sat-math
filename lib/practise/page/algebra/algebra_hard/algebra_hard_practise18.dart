import 'package:flutter/material.dart';

class AlgebraHardPractise18 extends StatefulWidget {
  const AlgebraHardPractise18({super.key});

  @override
  State<AlgebraHardPractise18> createState() => _AlgebraHardPractise18State();
}

class _AlgebraHardPractise18State extends State<AlgebraHardPractise18> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. Identify the vertical asymptote of f(x) = (x+2)/(x^2 - 4)',
      'options': [
        'x = 2 and x = -2',
        'x = -2 only',
        'x = 2 only',
        'x = 0'
      ],
      'correctIndex': 0
    },
    {
      'question': '2. Find the horizontal asymptote of f(x) = (3x^2 - 2)/(x^2 + 5)',
      'options': ['y = 3', 'y = 0', 'y = -2', 'y = 1'],
      'correctIndex': 0
    },
    {
      'question': '3. Determine vertical asymptotes of f(x) = 1/(x^2 - x - 6)',
      'options': ['x = 3 and x = -2', 'x = 2 and x = -3', 'x = 1 and x = -6', 'x = 0 and x = 6'],
      'correctIndex': 1
    },
    {
      'question': '4. For f(x) = (2x+1)/(x-4), find the horizontal asymptote.',
      'options': ['y = 2', 'y = 0', 'y = 1', 'y = -1/4'],
      'correctIndex': 0
    },
    {
      'question': '5. Identify the vertical asymptotes of f(x) = (x^2 - 1)/(x^2 - x - 2)',
      'options': ['x = 2 and x = -1', 'x = 1 and x = -2', 'x = -1 only', 'x = 2 only'],
      'correctIndex': 1
    },
  ];

  final Map<int,int> _selectedAnswers = {};

  void _selectAnswer(int qIndex, int selIndex) {
    setState(() {
      _selectedAnswers[qIndex] = selIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text('Algebra Hard - Practise 18'),
        backgroundColor: Colors.orange.shade700,
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Topic: Rational Functions & Asymptotes',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600, color: Colors.orange),
            ),
            const SizedBox(height: 8),
            const Text(
              'Analyze rational functions to determine vertical and horizontal asymptotes.',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20),
            ...List.generate(_questions.length, (index) {
              final q = _questions[index];
              final sel = _selectedAnswers[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        q['question'],
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 12),
                      ...List.generate(q['options'].length, (optIndex) {
                        final isSelected = sel == optIndex;
                        return GestureDetector(
                          onTap: () => _selectAnswer(index, optIndex),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.orange.shade100
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: isSelected
                                      ? Colors.orange
                                      : Colors.grey.shade300,
                                  width: 1.5),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  isSelected
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_off,
                                  color:
                                      isSelected ? Colors.orange : Colors.grey,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    q['options'][optIndex],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  int score = 0;
                  for (int i = 0; i < _questions.length; i++) {
                    if (_selectedAnswers[i] == _questions[i]['correctIndex'])
                      score++;
                  }
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Your Score'),
                      content: Text(
                          'You got $score out of ${_questions.length} correct!'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Check Answers'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade700,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
