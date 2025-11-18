import 'package:flutter/material.dart';

class TrigonometryHardPractise8 extends StatefulWidget {
  const TrigonometryHardPractise8({super.key});

  @override
  State<TrigonometryHardPractise8> createState() => _TrigonometryHardPractise8State();
}

class _TrigonometryHardPractise8State extends State<TrigonometryHardPractise8> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. If cos θ = -5/13, find sin θ.',
      'options': ['12/13', '-12/13', '5/13', '-5/13'],
      'correctIndex': 0,
    },
    {
      'question': '2. What is the value of cos(7π/6)?',
      'options': ['-√3/2', '√3/2', '1/2', '-1/2'],
      'correctIndex': 0,
    },
    {
      'question': '3. Find the value of sec(π/4).',
      'options': ['√2', '2', '1/√2', '1'],
      'correctIndex': 0,
    },
    {
      'question': '4. Solve for θ: tan θ = -1.',
      'options': ['5π/4', '7π/4', 'π/4', '3π/4'],
      'correctIndex': 0,
    },
    {
      'question': '5. Find the period of y = 3cos(5x).',
      'options': ['2π/5', 'π/5', '2π', 'π'],
      'correctIndex': 0,
    },
    {
      'question': '6. What is the amplitude of y = 4sin(x)?',
      'options': ['4', '1', '2', '3'],
      'correctIndex': 0,
    },
    {
      'question': '7. If cot θ = 3/4, find sin θ.',
      'options': ['3/5', '4/5', '5/4', '3/4'],
      'correctIndex': 0,
    },
    {
      'question': '8. What is the value of sin(π/6)?',
      'options': ['1/2', '√3/2', '1', '√2/2'],
      'correctIndex': 0,
    },
    {
      'question': '9. Solve for θ: cos θ = √3/2.',
      'options': ['π/6', 'π/4', 'π/3', 'π/2'],
      'correctIndex': 0,
    },
    {
      'question': '10. If sin θ = -4/5, find cos θ.',
      'options': ['3/5', '-3/5', '4/5', '-4/5'],
      'correctIndex': 0,
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
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 8',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Topic: SAT Math – Advanced Trigonometric Equations and Real-World Problems',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange),
            ),
            const SizedBox(height: 8),
            const Text(
              'Practice solving difficult problems involving advanced trigonometric identities, functions, and real-world applications.',
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
                          if (isSelected && isCorrect) tileColor = Colors.orange.shade100;
                          else if (isSelected && !isCorrect) tileColor = Colors.red.shade100;
                          else if (isCorrect) tileColor = Colors.orange.shade50;
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
                                color: isSelected ? Colors.orange : Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                                  color: isSelected ? Colors.orange : Colors.grey,
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
                  backgroundColor: Colors.orange,
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
