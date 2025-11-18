import 'package:flutter/material.dart';

class TrigonometryHardPractise2 extends StatefulWidget {
  const TrigonometryHardPractise2({super.key});

  @override
  State<TrigonometryHardPractise2> createState() => _TrigonometryHardPractise2State();
}

class _TrigonometryHardPractise2State extends State<TrigonometryHardPractise2> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. If sin θ = 4/5, find cos θ for the right triangle.',
      'options': ['3/5', '4/5', '5/4', '2/5'],
      'correctIndex': 0,
    },
    {
      'question': '2. What is the value of tan(π/3)?',
      'options': ['√3', '1', '0', '1/√3'],
      'correctIndex': 0,
    },
    {
      'question': '3. If cos θ = 1/2, find the value of sin θ in the right triangle.',
      'options': ['√3/2', '1/2', '√2/2', '1/√3'],
      'correctIndex': 0,
    },
    {
      'question': '4. Solve for θ: cos(2θ) = 1/2. What is θ?',
      'options': ['π/3', 'π/6', 'π/4', 'π/2'],
      'correctIndex': 1,
    },
    {
      'question': '5. A triangle has sides 7, 24, and 25. What is tan θ for the angle opposite the side of length 7?',
      'options': ['7/24', '24/7', '7/25', '25/7'],
      'correctIndex': 0,
    },
    {
      'question': '6. If tan θ = √3, what is the value of sin θ?',
      'options': ['√3/2', '1/2', '1/√3', '2/√3'],
      'correctIndex': 3,
    },
    {
      'question': '7. Find the exact value of sin(2π/3).',
      'options': ['√3/2', '1/2', '0', '√2/2'],
      'correctIndex': 0,
    },
    {
      'question': '8. If sec θ = 2, find cos θ.',
      'options': ['1/2', '2', '1', '1/√2'],
      'correctIndex': 0,
    },
    {
      'question': '9. If sin θ = 3/5, find the length of the adjacent side in a right triangle.',
      'options': ['4', '5', '3', '2'],
      'correctIndex': 0,
    },
    {
      'question': '10. Solve for θ: tan θ = 1. What is θ in radians?',
      'options': ['π/4', 'π/3', 'π/2', 'π/6'],
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
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry Hard - Practise 2',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Topic: SAT Math – Advanced Trigonometric Functions and Equations',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple),
            ),
            const SizedBox(height: 8),
            const Text(
              'Practice hard-level problems on trigonometric functions, equations, and identities.',
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
                          if (isSelected && isCorrect) tileColor = Colors.deepPurple.shade100;
                          else if (isSelected && !isCorrect) tileColor = Colors.red.shade100;
                          else if (isCorrect) tileColor = Colors.deepPurple.shade50;
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
                                color: isSelected ? Colors.deepPurple : Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                                  color: isSelected ? Colors.deepPurple : Colors.grey,
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
                  backgroundColor: Colors.deepPurple,
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
