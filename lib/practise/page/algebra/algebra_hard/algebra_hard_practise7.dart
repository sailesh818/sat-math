import 'package:flutter/material.dart';

class AlgebraHardPractise7 extends StatefulWidget {
  const AlgebraHardPractise7({super.key});

  @override
  State<AlgebraHardPractise7> createState() => _AlgebraHardPractise7State();
}

class _AlgebraHardPractise7State extends State<AlgebraHardPractise7> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. Solve the system: \n x + y + z = 6\n 2x - y + z = 3\n x + 2y - z = 4',
      'options': ['x=1,y=2,z=3', 'x=2,y=1,z=3', 'x=3,y=2,z=1', 'x=1,y=3,z=2'],
      'correctIndex': 0
    },
    {
      'question': '2. Solve: \n x + y + z = 9\n 2x - y + 3z = 16\n 3x + 2y - z = 5',
      'options': ['x=3,y=2,z=4', 'x=2,y=3,z=4', 'x=4,y=2,z=3', 'x=3,y=4,z=2'],
      'correctIndex': 1
    },
    {
      'question': '3. Solve: \n x + 2y + z = 7\n 2x + y + 3z = 14\n 3x - y + z = 8',
      'options': ['x=2,y=1,z=2', 'x=1,y=2,z=2', 'x=2,y=2,z=1', 'x=1,y=1,z=3'],
      'correctIndex': 2
    },
    {
      'question': '4. Solve: \n x + y - z = 2\n 2x - y + z = 3\n x - 2y + 3z = 5',
      'options': ['x=2,y=1,z=1', 'x=1,y=2,z=1', 'x=1,y=1,z=2', 'x=2,y=2,z=0'],
      'correctIndex': 1
    },
    {
      'question': '5. Solve: \n 3x + y - z = 4\n x - y + 2z = 3\n 2x + 2y + z = 7',
      'options': ['x=1,y=2,z=1', 'x=2,y=1,z=1', 'x=1,y=1,z=2', 'x=2,y=2,z=1'],
      'correctIndex': 0
    },
  ];

  final Map<int,int> _selectedAnswers = {};

  void _selectAnswer(int qIndex, int selIndex) {
    setState(() {
      _selectedAnswers[qIndex] = selIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text('Algebra Hard - Practise 7'),
        backgroundColor: Colors.orange.shade700,
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Topic: Systems of Linear Equations in 3 Variables',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600, color: Colors.orange),
            ),
            const SizedBox(height: 8),
            const Text(
              'Solve systems of three linear equations with three variables (x, y, z).',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20),
            ...List.generate(_questions.length, (index) {
              final q = _questions[index];
              final sel = _selectedAnswers[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        q['question'],
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 12),
                      ...List.generate(q['options'].length, (optIndex) {
                        final isSelected = sel == optIndex;
                        return GestureDetector(
                          onTap: () => _selectAnswer(index, optIndex),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.orange.shade100
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: isSelected
                                      ? Colors.orange
                                      : Colors.grey.shade300,
                                  width: 1.5),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  isSelected
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_off,
                                  color:
                                      isSelected ? Colors.orange : Colors.grey,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    q['options'][optIndex],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  int score = 0;
                  for (int i = 0; i < _questions.length; i++) {
                    if (_selectedAnswers[i] == _questions[i]['correctIndex'])
                      score++;
                  }
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Your Score'),
                      content: Text(
                          'You got $score out of ${_questions.length} correct!'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Check Answers'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade700,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
