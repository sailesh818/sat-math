import 'package:flutter/material.dart';

class TrigonometryHardPractise19 extends StatefulWidget {
  const TrigonometryHardPractise19({super.key});

  @override
  State<TrigonometryHardPractise19> createState() => _TrigonometryHardPractise19State();
}

class _TrigonometryHardPractise19State extends State<TrigonometryHardPractise19> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. If sin θ = 7/25, find cos θ.',
      'options': ['24/25', '-24/25', '7/25', '-7/25'],
      'correctIndex': 0,
    },
    {
      'question': '2. Solve for θ: tan θ = 2√3.',
      'options': ['arctan(2√3)', 'arctan(√3/2)', 'π/3', 'π/6'],
      'correctIndex': 0,
    },
    {
      'question': '3. If cos θ = -5/13, find sin θ.',
      'options': ['12/13', '-12/13', '5/13', '-5/13'],
      'correctIndex': 0,
    },
    {
      'question': '4. Find the value of sin(11π/6).',
      'options': ['-1/2', '1/2', '-√3/2', '√3/2'],
      'correctIndex': 0,
    },
    {
      'question': '5. Find the amplitude of y = -4sin(8x).',
      'options': ['4', '-4', '8', '1'],
      'correctIndex': 0,
    },
    {
      'question': '6. Solve for θ: cot θ = 1/2.',
      'options': ['arccot(1/2)', 'arctan(1/2)', 'arctan(2)', 'arccot(2)'],
      'correctIndex': 0,
    },
    {
      'question': '7. What is the period of y = cos(6x)?',
      'options': ['π/3', 'π/6', '2π', 'π'],
      'correctIndex': 0,
    },
    {
      'question': '8. If sec θ = -25/24, find cos θ.',
      'options': ['-24/25', '24/25', '-25/24', '25/24'],
      'correctIndex': 0,
    },
    {
      'question': '9. Find the value of tan(3π/4).',
      'options': ['1', '-1', '√3', '-√3'],
      'correctIndex': 1,
    },
    {
      'question': '10. If sin θ = -7/25, find cos θ.',
      'options': ['24/25', '-24/25', '7/25', '-7/25'],
      'correctIndex': 1,
    },
  ];

  final Map<int, int> _selectedAnswers = {};

  void _selectAnswer(int questionIndex, int selectedIndex) {
    setState(() {
      _selectedAnswers[questionIndex] = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 19',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Topic: SAT Math – Challenging Trigonometric Functions, Identities, and Inverse Functions',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple),
            ),
            const SizedBox(height: 8),
            const Text(
              'Practice hard SAT-level problems involving trigonometric equations, periodicity, and inverse functions.',
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
            const SizedBox(height: 20),

            ...List.generate(_questions.length, (index) {
              final question = _questions[index];
              final selectedIndex = _selectedAnswers[index];
              final correctIndex = question['correctIndex'];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question['question'],
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),

                      ...List.generate(question['options'].length, (optIndex) {
                        final isSelected = selectedIndex == optIndex;
                        final isCorrect = correctIndex == optIndex;
                        final hasAnswered = selectedIndex != null;

                        Color? tileColor;
                        if (hasAnswered) {
                          if (isSelected && isCorrect) tileColor = Colors.purple.shade100;
                          else if (isSelected && !isCorrect) tileColor = Colors.red.shade100;
                          else if (isCorrect) tileColor = Colors.purple.shade50;
                        }

                        return GestureDetector(
                          onTap: () => _selectAnswer(index, optIndex),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: tileColor ?? Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected ? Colors.purple : Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                                  color: isSelected ? Colors.purple : Colors.grey,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    question['options'][optIndex],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),

                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                icon: const Icon(Icons.check_circle_outline, color: Colors.white),
                label: const Text(
                  'Check Answers',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  int score = 0;
                  for (var i = 0; i < _questions.length; i++) {
                    if (_selectedAnswers[i] == _questions[i]['correctIndex']) {
                      score++;
                    }
                  }

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Your Score'),
                      content: Text('You got $score out of ${_questions.length} correct!'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
