import 'package:flutter/material.dart';

class Test1model2Page extends StatefulWidget {
  const Test1model2Page({super.key});

  @override
  State<Test1model2Page> createState() => _Test1model2PageState();
}

class _Test1model2PageState extends State<Test1model2Page> {
  // List of 27 SAT Math questions with options for Model 2
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the value of x in the equation: 5x - 3 = 22?',
      'options': ['x = 5', 'x = 6', 'x = 4', 'x = 7'],
      'answer': ''
    },
    {
      'question': 'What is the area of a right triangle with legs 3 and 4?',
      'options': ['12', '6', '9', '5'],
      'answer': ''
    },
    {
      'question': 'If a rectangle has a perimeter of 30 and a length of 10, what is its width?',
      'options': ['5', '7', '3', '6'],
      'answer': ''
    },
    {
      'question': 'What is the value of cos(45°)?',
      'options': ['√2/2', '1', '1/2', '√3/2'],
      'answer': ''
    },
    {
      'question': 'Which of the following represents the solution to the equation: 2x + 5 = 15?',
      'options': ['x = 5', 'x = 10', 'x = 2', 'x = 6'],
      'answer': ''
    },
    {
      'question': 'What is the slope of the line passing through the points (1, 1) and (4, 3)?',
      'options': ['2/3', '1/2', '3/4', '1/3'],
      'answer': ''
    },
    {
      'question': 'What is the value of x in the equation: x² - 9 = 0?',
      'options': ['x = 3 or x = -3', 'x = 9', 'x = 0', 'x = 6'],
      'answer': ''
    },
    {
      'question': 'What is the volume of a cylinder with a radius of 2 and height 10?',
      'options': ['40π', '10π', '20π', '50π'],
      'answer': ''
    },
    {
      'question': 'What is the solution to the inequality: 4x - 5 > 7?',
      'options': ['x > 3', 'x > 4', 'x < 4', 'x < 3'],
      'answer': ''
    },
    {
      'question': 'Which of the following represents the sum of the interior angles of a hexagon?',
      'options': ['720°', '540°', '360°', '180°'],
      'answer': ''
    },
    {
      'question': 'What is the value of tan(60°)?',
      'options': ['√3', '1', '1/2', '√2'],
      'answer': ''
    },
    {
      'question': 'What is the solution to the equation: x + 3 = 8?',
      'options': ['x = 5', 'x = 8', 'x = 3', 'x = 2'],
      'answer': ''
    },
    {
      'question': 'What is the area of a circle with a radius of 4?',
      'options': ['16π', '12π', '8π', '4π'],
      'answer': ''
    },
    {
      'question': 'What is the value of x in the equation: 3x - 4 = 8?',
      'options': ['x = 4', 'x = 3', 'x = 5', 'x = 6'],
      'answer': ''
    },
    {
      'question': 'Which of the following represents the quadratic formula?',
      'options': [
        'x = (-b ± √(b² - 4ac)) / 2a',
        'x = (-b ± √(a² - 4bc)) / 2a',
        'x = (-b ± √(b² + 4ac)) / 2a',
        'x = (b ± √(b² - 4ac)) / 2a'
      ],
      'answer': ''
    },
    {
      'question': 'What is the value of log(10)?',
      'options': ['1', '0', '2', '10'],
      'answer': ''
    },
    {
      'question': 'What is the perimeter of a square with a side length of 6?',
      'options': ['24', '12', '18', '30'],
      'answer': ''
    },
    {
      'question': 'What is the solution to the system of equations: x + y = 10 and x - y = 2?',
      'options': ['x = 6, y = 4', 'x = 8, y = 2', 'x = 5, y = 5', 'x = 7, y = 3'],
      'answer': ''
    },
    {
      'question': 'What is the sum of the angles in a quadrilateral?',
      'options': ['360°', '180°', '270°', '90°'],
      'answer': ''
    },
    {
      'question': 'What is the value of √64?',
      'options': ['8', '16', '4', '10'],
      'answer': ''
    },
    {
      'question': 'What is the value of x in the equation: x² + 4x = 21?',
      'options': ['x = 3', 'x = -3', 'x = 7', 'x = -7'],
      'answer': ''
    },
    {
      'question': 'What is the distance between the points (2, 3) and (5, 7)?',
      'options': ['5', '4', '6', '7'],
      'answer': ''
    },
    {
      'question': 'Which of the following is an example of a rational number?',
      'options': ['2/3', '√2', 'π', '√3'],
      'answer': ''
    },
    {
      'question': 'What is the value of x in the equation: 2x + 6 = 14?',
      'options': ['x = 4', 'x = 3', 'x = 7', 'x = 5'],
      'answer': ''
    },
    {
      'question': 'What is the solution to the inequality: 2x + 3 < 9?',
      'options': ['x < 3', 'x > 3', 'x < 2', 'x > 2'],
      'answer': ''
    },
    {
      'question': 'What is the value of x in the equation: x/2 = 7?',
      'options': ['x = 14', 'x = 7', 'x = 21', 'x = 28'],
      'answer': ''
    },
    {
      'question': 'What is the volume of a sphere with radius 3?',
      'options': ['36π', '18π', '12π', '9π'],
      'answer': ''
    },
    {
      'question': 'What is the value of 2³?',
      'options': ['8', '4', '16', '6'],
      'answer': ''
    },
  ];

  void _onAnswerChanged(int questionIndex, String answer) {
    setState(() {
      questions[questionIndex]['answer'] = answer;
    });
  }

  int _calculateScore() {
    int score = 0;
    for (var question in questions) {
      // Example: Let's assume option 0 (first) is always correct
      if (question['answer'] == question['options'][0]) {
        score++;
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test 1 - Model 2"),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SAT Math Practice Test Model 2",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Q${index + 1}: ${question['question']}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    ...List.generate(
                      question['options'].length,
                      (i) => RadioListTile<String>(
                        value: question['options'][i],
                        groupValue: question['answer'],
                        title: Text(question['options'][i]),
                        onChanged: (value) {
                          _onAnswerChanged(index, value!);
                        },
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  int score = _calculateScore();
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Your Score"),
                      content: Text("You scored $score out of ${questions.length}"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
