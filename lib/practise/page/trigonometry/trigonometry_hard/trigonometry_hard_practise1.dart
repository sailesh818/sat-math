import 'package:flutter/material.dart';

class TrigonometryHardPractise1 extends StatefulWidget {
  const TrigonometryHardPractise1({super.key});

  @override
  State<TrigonometryHardPractise1> createState() => _TrigonometryHardPractise1State();
}

class _TrigonometryHardPractise1State extends State<TrigonometryHardPractise1> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. If sin θ = 3/5 and cos θ = 4/5, find tan θ.',
      'options': ['3/4', '4/3', '5/4', '5/3'],
      'correctIndex': 0,
    },
    {
      'question': '2. What is the value of sin 90° × cos 90°?',
      'options': ['0', '1', 'sin 0°', 'cos 0°'],
      'correctIndex': 0,
    },
    {
      'question': '3. A triangle has sides 7, 24, and 25. What is the value of cos θ?',
      'options': ['7/25', '24/25', '25/7', '7/24'],
      'correctIndex': 1,
    },
    {
      'question': '4. If tan θ = 1/√3, what is sin θ?',
      'options': ['1/2', '√3/2', '1/√3', '√2/2'],
      'correctIndex': 0,
    },
    {
      'question': '5. Solve for θ: cos θ = 1/2. What is θ in radians?',
      'options': ['π/3', 'π/6', 'π/4', 'π/2'],
      'correctIndex': 0,
    },
    {
      'question': '6. Find the exact value of tan(π/4).',
      'options': ['1', '√2', '0', '√3'],
      'correctIndex': 0,
    },
    {
      'question': '7. If sin θ = 5/13, find the length of the adjacent side in a right triangle.',
      'options': ['12', '13', '5', '7'],
      'correctIndex': 0,
    },
    {
      'question': '8. What is the period of the function y = sin(2x)?',
      'options': ['π', '2π', 'π/2', 'π/4'],
      'correctIndex': 2,
    },
    {
      'question': '9. Find the value of sec θ if cos θ = 4/5.',
      'options': ['5/4', '4/5', '25/16', '1/5'],
      'correctIndex': 0,
    },
    {
      'question': '10. If tan θ = 1, find the value of sin θ.',
      'options': ['1/√2', '√2/2', '1/2', '0'],
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
          'Trigonometry Hard - Practise 1',
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
              'Topic: SAT Math – Advanced Trigonometric Functions and Applications',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo),
            ),
            const SizedBox(height: 8),
            const Text(
              'Practice advanced-level problems on trigonometric ratios, functions, and applications.',
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
