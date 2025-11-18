import 'package:flutter/material.dart';

class AlgebraHardPractise8 extends StatefulWidget {
  const AlgebraHardPractise8({super.key});

  @override
  State<AlgebraHardPractise8> createState() => _AlgebraHardPractise8State();
}

class _AlgebraHardPractise8State extends State<AlgebraHardPractise8> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. A notebook costs x and a pen costs y. If 3 notebooks and 2 pens cost 20 and 2 notebooks and 3 pens cost 18, find x and y.',
      'options': ['x=4, y=3', 'x=3, y=4', 'x=5, y=2', 'x=2, y=5'],
      'correctIndex': 0
    },
    {
      'question': '2. Two numbers differ by 5. Twice the smaller plus thrice the larger is 47. Find the numbers.',
      'options': ['12 and 7', '10 and 15', '9 and 4', '11 and 6'],
      'correctIndex': 3
    },
    {
      'question': '3. A father is 3 times as old as his son. After 5 years, the sum of their ages will be 70. Find their present ages.',
      'options': ['Father=45, Son=15', 'Father=40, Son=13', 'Father=42, Son=14', 'Father=48, Son=16'],
      'correctIndex': 2
    },
    {
      'question': '4. A car travels from A to B at 60 km/h and returns at 40 km/h. If the total time is 5 hours, find the distance between A and B.',
      'options': ['100 km', '120 km', '150 km', '80 km'],
      'correctIndex': 0
    },
    {
      'question': '5. The sum of two numbers is 25. If one number is 3 more than twice the other, find the numbers.',
      'options': ['x=7, y=18', 'x=8, y=17', 'x=9, y=16', 'x=6, y=19'],
      'correctIndex': 2
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
        title: const Text('Algebra Hard - Practise 8'),
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
              'Topic: Word Problems with Simultaneous Equations',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600, color: Colors.orange),
            ),
            const SizedBox(height: 8),
            const Text(
              'Translate word problems into simultaneous equations and solve for unknowns.',
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
