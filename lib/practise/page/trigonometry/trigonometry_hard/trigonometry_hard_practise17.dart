import 'package:flutter/material.dart';

class TrigonometryHardPractise17 extends StatefulWidget {
  const TrigonometryHardPractise17({super.key});

  @override
  State<TrigonometryHardPractise17> createState() => _TrigonometryHardPractise17State();
}

class _TrigonometryHardPractise17State extends State<TrigonometryHardPractise17> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. If sin θ = 8/17, find cos θ.',
      'options': ['15/17', '-15/17', '8/17', '-8/17'],
      'correctIndex': 0,
    },
    {
      'question': '2. Solve for θ: tan θ = √3/3.',
      'options': ['π/6', 'π/3', 'π/4', 'π/2'],
      'correctIndex': 0,
    },
    {
      'question': '3. If cos θ = -9/41, find sin θ.',
      'options': ['40/41', '-40/41', '9/41', '-9/41'],
      'correctIndex': 0,
    },
    {
      'question': '4. Find the value of sin(4π/3).',
      'options': ['-√3/2', '√3/2', '-1/2', '1/2'],
      'correctIndex': 0,
    },
    {
      'question': '5. Find the amplitude of y = 3sin(7x).',
      'options': ['3', '-3', '7', '1'],
      'correctIndex': 0,
    },
    {
      'question': '6. Solve for θ: cot θ = 7/24.',
      'options': ['arccot(7/24)', 'arctan(7/24)', 'arctan(24/7)', 'arccot(24/7)'],
      'correctIndex': 0,
    },
    {
      'question': '7. What is the period of y = cos(10x)?',
      'options': ['π/5', 'π/10', '2π', 'π'],
      'correctIndex': 0,
    },
    {
      'question': '8. If sec θ = -41/9, find cos θ.',
      'options': ['-9/41', '9/41', '-41/9', '41/9'],
      'correctIndex': 0,
    },
    {
      'question': '9. Find the value of tan(5π/4).',
      'options': ['1', '-1', '√3', '-√3'],
      'correctIndex': 1,
    },
    {
      'question': '10. If sin θ = -8/17, find cos θ.',
      'options': ['15/17', '-15/17', '8/17', '-8/17'],
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
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 17',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
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
                  color: Colors.indigo),
            ),
            const SizedBox(height: 8),
            const Text(
              'Practice advanced SAT-level problems with trigonometric equations, periodicity, and inverse functions.',
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
                          if (isSelected && isCorrect) tileColor = Colors.indigo.shade100;
                          else if (isSelected && !isCorrect) tileColor = Colors.red.shade100;
                          else if (isCorrect) tileColor = Colors.indigo.shade50;
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
                                color: isSelected ? Colors.indigo : Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                                  color: isSelected ? Colors.indigo : Colors.grey,
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
                  backgroundColor: Colors.indigo,
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
