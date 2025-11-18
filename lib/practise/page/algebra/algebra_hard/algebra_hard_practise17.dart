import 'package:flutter/material.dart';

class AlgebraHardPractise17 extends StatefulWidget {
  const AlgebraHardPractise17({super.key});

  @override
  State<AlgebraHardPractise17> createState() => _AlgebraHardPractise17State();
}

class _AlgebraHardPractise17State extends State<AlgebraHardPractise17> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. If (x-2) is a factor of x^3 - 4x^2 + ax + b, and the remainder is 0 when x=2, find a + b.',
      'options': ['2', '4', '6', '8'],
      'correctIndex': 1
    },
    {
      'question': '2. Factor completely: x^3 - 6x^2 + 11x - 6',
      'options': [
        '(x-1)(x-2)(x-3)',
        '(x-1)(x+2)(x-3)',
        '(x-1)(x-3)^2',
        '(x-2)(x-3)^2'
      ],
      'correctIndex': 0
    },
    {
      'question': '3. If x^3 + px^2 + qx + r has roots 1, 2, 3, find p + q + r.',
      'options': ['6', '-6', '0', '3'],
      'correctIndex': 2
    },
    {
      'question': '4. Determine k such that x^3 - 3x^2 + kx + 6 is divisible by (x-1).',
      'options': ['0', '1', '-1', '2'],
      'correctIndex': 3
    },
    {
      'question': '5. Factor: x^4 - 5x^2 + 4',
      'options': [
        '(x^2-1)(x^2-4)',
        '(x^2+1)(x^2-4)',
        '(x^2-2)(x^2-2)',
        '(x^2+2)(x^2-2)'
      ],
      'correctIndex': 0
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
        title: const Text('Algebra Hard - Practise 17'),
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
              'Topic: Polynomials & Factor Theorems',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600, color: Colors.orange),
            ),
            const SizedBox(height: 8),
            const Text(
              'Apply factor and remainder theorems to find unknowns and factor polynomials completely.',
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
