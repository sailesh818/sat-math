import 'package:flutter/material.dart';

class TrigonometryHardPractise18 extends StatefulWidget {
  const TrigonometryHardPractise18({super.key});

  @override
  State<TrigonometryHardPractise18> createState() => _TrigonometryHardPractise18State();
}

class _TrigonometryHardPractise18State extends State<TrigonometryHardPractise18> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. If sin θ = 9/41, find cos θ.',
      'options': ['40/41', '-40/41', '9/41', '-9/41'],
      'correctIndex': 0,
    },
    {
      'question': '2. Solve for θ: tan θ = 1/√3.',
      'options': ['π/6', 'π/3', 'π/4', 'π/2'],
      'correctIndex': 0,
    },
    {
      'question': '3. If cos θ = -12/13, find sin θ.',
      'options': ['5/13', '-5/13', '12/13', '-12/13'],
      'correctIndex': 0,
    },
    {
      'question': '4. Find the value of sin(5π/4).',
      'options': ['-√2/2', '√2/2', '-1/2', '1/2'],
      'correctIndex': 0,
    },
    {
      'question': '5. Find the amplitude of y = 6cos(5x).',
      'options': ['6', '-6', '5', '1'],
      'correctIndex': 0,
    },
    {
      'question': '6. Solve for θ: cot θ = 24/7.',
      'options': ['arccot(24/7)', 'arctan(24/7)', 'arctan(7/24)', 'arccot(7/24)'],
      'correctIndex': 0,
    },
    {
      'question': '7. What is the period of y = sin(11x)?',
      'options': ['2π/11', 'π/11', '2π', 'π'],
      'correctIndex': 0,
    },
    {
      'question': '8. If sec θ = -13/12, find cos θ.',
      'options': ['-12/13', '12/13', '-13/12', '13/12'],
      'correctIndex': 0,
    },
    {
      'question': '9. Find the value of tan(7π/6).',
      'options': ['1/√3', '-1/√3', '√3', '-√3'],
      'correctIndex': 3,
    },
    {
      'question': '10. If sin θ = -9/41, find cos θ.',
      'options': ['40/41', '-40/41', '9/41', '-9/41'],
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
      backgroundColor: Colors.deepOrange.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 18',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Topic: SAT Math – Challenging Trigonometric Identities, Functions, and Inverse Functions',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepOrange),
            ),
            const SizedBox(height: 8),
            const Text(
              'Practice hard SAT-level problems including trigonometric equations, inverse functions, and periodicity.',
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
                          if (isSelected && isCorrect) tileColor = Colors.deepOrange.shade100;
                          else if (isSelected && !isCorrect) tileColor = Colors.red.shade100;
                          else if (isCorrect) tileColor = Colors.deepOrange.shade50;
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
                                color: isSelected ? Colors.deepOrange : Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                                  color: isSelected ? Colors.deepOrange : Colors.grey,
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
                  backgroundColor: Colors.deepOrange,
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
