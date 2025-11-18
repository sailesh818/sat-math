import 'package:flutter/material.dart';

class Test1model1Page extends StatefulWidget {
  const Test1model1Page({super.key});

  @override
  State<Test1model1Page> createState() => _Test1model1PageState();
}

class _Test1model1PageState extends State<Test1model1Page> {
  // List of 27 SAT Math questions with options
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the value of x in the equation: 3x + 5 = 20?',
      'options': ['x = 5', 'x = 10', 'x = 3', 'x = 15'],
      'answer': ''
    },
    {
      'question': 'What is the area of a triangle with a base of 6 and height 8?',
      'options': ['24', '48', '36', '12'],
      'answer': ''
    },
    {
      'question': 'If a circle has a radius of 7, what is its circumference?',
      'options': ['14π', '21π', '7π', '22π'],
      'answer': ''
    },
    {
      'question': 'What is the value of sin(30°)?',
      'options': ['1/2', '√2/2', '√3/2', '1'],
      'answer': ''
    },
    {
      'question': 'What is the slope of the line passing through the points (2, 3) and (4, 7)?',
      'options': ['2', '1', '3/2', '4'],
      'answer': ''
    },
    {
      'question': 'What is the solution to the system of equations: 2x + y = 10 and x - y = 2?',
      'options': ['x = 4, y = 2', 'x = 5, y = 0', 'x = 3, y = 4', 'x = 2, y = 6'],
      'answer': ''
    },
    {
      'question': 'Which of the following is the quadratic formula?',
      'options': [
        'x = (-b ± √(b² - 4ac)) / 2a',
        'x = (-b ± √(a² - 4bc)) / 2a',
        'x = (-b ± √(b² + 4ac)) / 2a',
        'x = (b ± √(b² - 4ac)) / 2a'
      ],
      'answer': ''
    },
    {
      'question': 'What is the value of 5³?',
      'options': ['125', '15', '25', '105'],
      'answer': ''
    },
    {
      'question': 'If a rectangle has a length of 10 and width of 5, what is its area?',
      'options': ['50', '15', '25', '30'],
      'answer': ''
    },
    {
      'question': 'What is the solution to the inequality: 3x - 5 > 7?',
      'options': ['x > 4', 'x > 2', 'x < 4', 'x < 2'],
      'answer': ''
    },
    {
      'question': 'Which of the following is the graph of y = x²?',
      'options': ['Parabola opening upwards', 'Straight line', 'Circle', 'Parabola opening downwards'],
      'answer': ''
    },
    {
      'question': 'What is the probability of drawing an ace from a standard deck of cards?',
      'options': ['1/13', '1/52', '1/26', '1/4'],
      'answer': ''
    },
    {
      'question': 'What is the discriminant of the quadratic equation x² - 4x + 4 = 0?',
      'options': ['16', '0', '4', '1'],
      'answer': ''
    },
    {
      'question': 'What is the value of tan(45°)?',
      'options': ['1', '0', '√3', '√2'],
      'answer': ''
    },
    {
      'question': 'Which of the following represents the standard form of a linear equation?',
      'options': ['Ax + By = C', 'y = mx + b', 'x² + y² = r²', 'y = a(x - h)² + k'],
      'answer': ''
    },
    {
      'question': 'What is the value of 4! (4 factorial)?',
      'options': ['24', '12', '16', '8'],
      'answer': ''
    },
    {
      'question': 'What is the value of x in the equation 2x² - 8 = 0?',
      'options': ['2', '0', '4', '-4'],
      'answer': ''
    },
    {
      'question': 'If the sum of two angles is 180°, what are they called?',
      'options': ['Complementary angles', 'Supplementary angles', 'Vertical angles', 'Adjacent angles'],
      'answer': ''
    },
    {
      'question': 'Which of the following represents the slope of a line?',
      'options': ['Rise over run', 'Run over rise', 'y-intercept', 'x-intercept'],
      'answer': ''
    },
    {
      'question': 'What is the value of cos(60°)?',
      'options': ['1/2', '√2/2', '1', '√3/2'],
      'answer': ''
    },
    {
      'question': 'What is the solution to the equation: 3(x - 2) = 9?',
      'options': ['x = 5', 'x = 4', 'x = 3', 'x = 6'],
      'answer': ''
    },
    {
      'question': 'What is the distance between the points (1, 2) and (4, 6)?',
      'options': ['5', '6', '4', '3'],
      'answer': ''
    },
    {
      'question': 'What is the solution to the equation: x² = 16?',
      'options': ['x = 4 or x = -4', 'x = 16', 'x = 4', 'x = -4'],
      'answer': ''
    },
    {
      'question': 'What is the area of a circle with a radius of 3?',
      'options': ['9π', '3π', '6π', '18π'],
      'answer': ''
    },
    {
      'question': 'Which of the following is an example of an irrational number?',
      'options': ['√2', 'π', '√3', 'All of the above'],
      'answer': ''
    },
    {
      'question': 'What is the perimeter of a square with a side length of 4?',
      'options': ['16', '12', '8', '24'],
      'answer': ''
    },
    {
      'question': 'What is the sum of the interior angles of a triangle?',
      'options': ['180°', '360°', '90°', '270°'],
      'answer': ''
    },
    {
      'question': 'What is the value of log(100)?',
      'options': ['2', '1', '3', '10'],
      'answer': ''
    },
    {
      'question': 'If the probability of an event happening is 1/4, what is the probability of it not happening?',
      'options': ['3/4', '1/3', '1/2', '4/3'],
      'answer': ''
    },
    {
      'question': 'What is the value of x in the equation: 5x = 25?',
      'options': ['x = 5', 'x = 4', 'x = 25', 'x = 1'],
      'answer': ''
    },
    {
      'question': 'What is the volume of a cube with a side length of 3?',
      'options': ['27', '9', '12', '18'],
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
        title: const Text("Test 1 - Model 1"),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SAT Math Practice Test",
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
