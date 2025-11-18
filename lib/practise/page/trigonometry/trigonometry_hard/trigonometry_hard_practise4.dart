import 'package:flutter/material.dart';

class TrigonometryHardPractise4 extends StatefulWidget {
  const TrigonometryHardPractise4({super.key});

  @override
  State<TrigonometryHardPractise4> createState() => _TrigonometryHardPractise4State();
}

class _TrigonometryHardPractise4State extends State<TrigonometryHardPractise4> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. If cos θ = 5/13, find the value of tan θ.',
      'options': ['12/5', '5/12', '13/5', '12/13'],
      'correctIndex': 0,
    },
    {
      'question': '2. Solve for θ: sin θ = 1/√2. What is θ?',
      'options': ['π/4', 'π/3', 'π/2', 'π/6'],
      'correctIndex': 0,
    },
    {
      'question': '3. What is the value of cos(2π/3)?',
      'options': ['-1/2', '1/2', '√3/2', '0'],
      'correctIndex': 0,
    },
    {
      'question': '4. If tan θ = √3, what is the value of cos θ?',
      'options': ['1/2', '1/√2', '√3/2', '1/√3'],
      'correctIndex': 0,
    },
    {
      'question': '5. A triangle has sides 9, 12, and 15. What is the value of sin θ for the angle opposite the side of length 9?',
      'options': ['3/5', '9/15', '12/15', '9/12'],
      'correctIndex': 0,
    },
    {
      'question': '6. If cos θ = 3/5, find the value of sec θ.',
      'options': ['5/3', '3/5', '√2/5', '2/5'],
      'correctIndex': 0,
    },
    {
      'question': '7. Find the exact value of sin(3π/4).',
      'options': ['√2/2', '1/2', '√3/2', '√2/3'],
      'correctIndex': 0,
    },
    {
      'question': '8. If cot θ = 4/3, find sin θ.',
      'options': ['3/5', '4/5', '5/4', '3/4'],
      'correctIndex': 0,
    },
    {
      'question': '9. What is the amplitude of the function y = 3sin(x)?',
      'options': ['3', '1', '0', 'π'],
      'correctIndex': 0,
    },
    {
      'question': '10. If cos θ = 1/√2, find tan θ.',
      'options': ['1', '√2', '0', '√3'],
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
          'Trigonometry Hard - Practise 4',
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
              'Topic: SAT Math – Trigonometric Identities and Advanced Equations',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange),
            ),
            const SizedBox(height: 8),
            const Text(
              'Practice difficult-level problems on trigonometric identities, equations, and their applications.',
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
