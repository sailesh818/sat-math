import 'package:flutter/material.dart';

class TrigonometryHardPractise3 extends StatefulWidget {
  const TrigonometryHardPractise3({super.key});

  @override
  State<TrigonometryHardPractise3> createState() => _TrigonometryHardPractise3State();
}

class _TrigonometryHardPractise3State extends State<TrigonometryHardPractise3> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. If sin θ = 7/25, find the value of cos θ.',
      'options': ['24/25', '7/25', '1/7', '7/24'],
      'correctIndex': 0,
    },
    {
      'question': '2. Find the value of sin(π/6).',
      'options': ['1/2', '√3/2', '√2/2', '0'],
      'correctIndex': 0,
    },
    {
      'question': '3. If tan θ = 3/4, what is the value of sin θ?',
      'options': ['3/5', '4/5', '5/3', '1/5'],
      'correctIndex': 0,
    },
    {
      'question': '4. Solve for θ: cos θ = √3/2. What is θ?',
      'options': ['π/6', 'π/3', 'π/2', 'π/4'],
      'correctIndex': 0,
    },
    {
      'question': '5. What is the value of sec(π/3)?',
      'options': ['2', '√3', '1/2', '√2'],
      'correctIndex': 0,
    },
    {
      'question': '6. If cos θ = 1/3, find the length of the opposite side in a right triangle with a hypotenuse of 5.',
      'options': ['√16', '4', '3', '2'],
      'correctIndex': 0,
    },
    {
      'question': '7. Find the value of sin(5π/6).',
      'options': ['1/2', '√3/2', '√2/2', '0'],
      'correctIndex': 0,
    },
    {
      'question': '8. What is the period of y = cos(3x)?',
      'options': ['2π/3', '2π', 'π', '3π'],
      'correctIndex': 0,
    },
    {
      'question': '9. Solve for θ: tan(θ) = 1/√3. What is θ?',
      'options': ['π/6', 'π/3', 'π/4', 'π/2'],
      'correctIndex': 0,
    },
    {
      'question': '10. If cot θ = 2/3, find sin θ.',
      'options': ['3/√13', '2/√13', '1/√13', '3/2'],
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
          'Trigonometry Hard - Practise 3',
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
              'Topic: SAT Math – Advanced Trigonometric Functions, Ratios, and Equations',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal),
            ),
            const SizedBox(height: 8),
            const Text(
              'Practice the hardest-level problems on trigonometric ratios, advanced identities, and equations.',
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
