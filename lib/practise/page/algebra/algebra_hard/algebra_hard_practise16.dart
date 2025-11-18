import 'package:flutter/material.dart';

class AlgebraHardPractise16 extends StatefulWidget {
  const AlgebraHardPractise16({super.key});

  @override
  State<AlgebraHardPractise16> createState() => _AlgebraHardPractise16State();
}

class _AlgebraHardPractise16State extends State<AlgebraHardPractise16> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. Solve: x^2 - 5x + 6 > 0',
      'options': [
        'x < 2 or x > 3',
        '2 < x < 3',
        'x > 0',
        'x < 0'
      ],
      'correctIndex': 0
    },
    {
      'question': '2. Solve: x^2 + x - 6 < 0',
      'options': [
        'x < -3 or x > 2',
        '-3 < x < 2',
        'x > 0',
        'x < 0'
      ],
      'correctIndex': 1
    },
    {
      'question': '3. Solve: -x^2 + 4x - 3 ≥ 0',
      'options': [
        '1 ≤ x ≤ 3',
        'x ≤ 1 or x ≥ 3',
        'x ≥ 1',
        'x ≤ 3'
      ],
      'correctIndex': 0
    },
    {
      'question': '4. Solve: 2x^2 - 3x - 5 ≤ 0',
      'options': [
        '-1 ≤ x ≤ 2.5',
        'x < -1 or x > 2.5',
        'x > -1 and x < 2.5',
        'x < -1 and x > 2.5'
      ],
      'correctIndex': 0
    },
    {
      'question': '5. Solve: x^2 - 4 ≤ 0',
      'options': [
        '-2 ≤ x ≤ 2',
        'x < -2 or x > 2',
        'x > -2 and x < 2',
        'x < -2 and x > 2'
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
        title: const Text('Algebra Hard - Practise 16'),
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
              'Topic: Quadratic Inequalities',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600, color: Colors.orange),
            ),
            const SizedBox(height: 8),
            const Text(
              'Solve quadratic inequalities using factoring, graphing, or interval methods.',
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
