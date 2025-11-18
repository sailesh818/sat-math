import 'package:flutter/material.dart';

class TrigonometryHardPractise7 extends StatefulWidget {
  const TrigonometryHardPractise7({super.key});

  @override
  State<TrigonometryHardPractise7> createState() => _TrigonometryHardPractise7State();
}

class _TrigonometryHardPractise7State extends State<TrigonometryHardPractise7> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. If sin θ = -7/25, find cos θ.',
      'options': ['24/25', '-24/25', '7/25', '-7/25'],
      'correctIndex': 0,
    },
    {
      'question': '2. Solve for θ: cos θ = -1/2.',
      'options': ['2π/3', 'π/3', '5π/6', 'π/6'],
      'correctIndex': 0,
    },
    {
      'question': '3. Find the value of sec(5π/4).',
      'options': ['-√2', '√2', '1/√2', '-1/√2'],
      'correctIndex': 0,
    },
    {
      'question': '4. What is the amplitude of the function y = -3cos(x)?',
      'options': ['3', '1', '2', '-3'],
      'correctIndex': 0,
    },
    {
      'question': '5. If tan θ = 5/12, find sin θ.',
      'options': ['5/13', '12/13', '5/12', '12/5'],
      'correctIndex': 0,
    },
    {
      'question': '6. What is the period of y = sin(2x)?',
      'options': ['π', '2π', 'π/2', '2π/3'],
      'correctIndex': 0,
    },
    {
      'question': '7. Solve for θ: tan θ = 1.',
      'options': ['π/4', 'π/3', 'π/6', 'π/2'],
      'correctIndex': 0,
    },
    {
      'question': '8. If sin θ = 3/5, find cos θ.',
      'options': ['4/5', '-4/5', '5/3', '-5/3'],
      'correctIndex': 0,
    },
    {
      'question': '9. What is the value of sin(π/3)?',
      'options': ['√3/2', '1/2', '√2/2', '1'],
      'correctIndex': 0,
    },
    {
      'question': '10. If cot θ = 2, find tan θ.',
      'options': ['1/2', '2', '1', '1/√2'],
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
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 7',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Topic: SAT Math – Complex Trigonometric Functions and Real-World Problems',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal),
            ),
            const SizedBox(height: 8),
            const Text(
              'Practice challenging problems involving complex trigonometric identities, functions, and their applications.',
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
                          if (isSelected && isCorrect) tileColor = Colors.teal.shade100;
                          else if (isSelected && !isCorrect) tileColor = Colors.red.shade100;
                          else if (isCorrect) tileColor = Colors.teal.shade50;
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
                                color: isSelected ? Colors.teal : Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                                  color: isSelected ? Colors.teal : Colors.grey,
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
                  backgroundColor: Colors.teal,
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
