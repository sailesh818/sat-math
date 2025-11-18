import 'package:flutter/material.dart';

class FunctionsEasyPractise7 extends StatefulWidget {
  const FunctionsEasyPractise7({super.key});

  @override
  State<FunctionsEasyPractise7> createState() => _FunctionsEasyPractise7State();
}

class _FunctionsEasyPractise7State extends State<FunctionsEasyPractise7> {
  // 🔹 Topic: Understanding Function Graphs and Tables (Easy)
  final List<Map<String, dynamic>> _questions = [
    {
      'question':
          '1. The table shows values of f(x):\n\nx: 1, 2, 3, 4\nf(x): 2, 4, 6, 8\n\nWhich of the following defines f(x)?',
      'options': ['f(x) = x + 2', 'f(x) = 2x', 'f(x) = x²', 'f(x) = x - 2'],
      'correctIndex': 1,
    },
    {
      'question':
          '2. A graph of a function passes through (0, 2). What is f(0)?',
      'options': ['0', '1', '2', '3'],
      'correctIndex': 2,
    },
    {
      'question':
          '3. The table shows:\n\nx: -1, 0, 1\nf(x): 1, 0, 1\n\nWhich equation could represent f(x)?',
      'options': [
        'f(x) = x²',
        'f(x) = x',
        'f(x) = |x|',
        'f(x) = x + 1'
      ],
      'correctIndex': 2,
    },
    {
      'question':
          '4. If the graph of a function is a straight line passing through the origin (0,0), what type of function is it?',
      'options': [
        'Constant function',
        'Linear function',
        'Quadratic function',
        'Exponential function'
      ],
      'correctIndex': 1,
    },
    {
      'question':
          '5. The function f(x) = 3x is shown on a graph. What is the slope of the line?',
      'options': ['1', '2', '3', '0'],
      'correctIndex': 2,
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
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text(
          'Functions Easy - Practise 7',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Topic: Understanding Function Graphs and Tables',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Practise identifying patterns, interpreting graphs, and understanding relationships between x and f(x).',
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
            const SizedBox(height: 20),

            // 🔹 Question List
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
                          if (isSelected && isCorrect) {
                            tileColor = Colors.green.shade100;
                          } else if (isSelected && !isCorrect) {
                            tileColor = Colors.red.shade100;
                          } else if (isCorrect) {
                            tileColor = Colors.green.shade50;
                          }
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
                                color: isSelected
                                    ? Colors.green
                                    : Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  isSelected
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_off,
                                  color:
                                      isSelected ? Colors.green : Colors.grey,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    question['options'][optIndex],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.normal,
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

            // 🔹 Check Answers Button
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                icon:
                    const Icon(Icons.check_circle_outline, color: Colors.white),
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
                      content: Text(
                        'You got $score out of ${_questions.length} correct!',
                      ),
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
