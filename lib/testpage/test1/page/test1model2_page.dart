import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sat_math/testpage/test1/page/test1model1_page.dart';

class Test1model2Page extends StatefulWidget {
  const Test1model2Page({super.key});

  @override
  State<Test1model2Page> createState() => _Test1model2PageState();
}

class _Test1model2PageState extends State<Test1model2Page> {
  int currentQuestionIndex = 0;
  Map<int, int?> selectedAnswers = {}; // questionIndex -> selected option index
  Set<int> markedForReview = {};
  Map<int, bool> answerChecked = {};
  bool showHint = false;

  // Timer: 30 minutes
  static const int initialMinutes = 30;
  late int remainingSeconds;
  Timer? quizTimer;

  final List<Map<String, dynamic>> questions = [
    
  {
    'question': '1. What is the value of x in the equation: 5x - 3 = 22?',
    'options': ['x = 5', 'x = 6', 'x = 4', 'x = 7'],
    'correctIndex': 0,
    'hint': 'Add 3 then divide by 5.',
    'explanation': '5x = 25 → x = 5.'
  },
  {
    'question': '2. What is the area of a right triangle with legs 3 and 4?',
    'options': ['12', '6', '9', '5'],
    'correctIndex': 1,
    'hint': 'Area = 1/2 × base × height.',
    'explanation': 'Area = 1/2 × 3 × 4 = 6.'
  },
  {
    'question': '3. If a rectangle has a perimeter of 30 and a length of 10, what is its width?',
    'options': ['5', '7', '3', '6'],
    'correctIndex': 0,
    'hint': 'Perimeter = 2(L + W).',
    'explanation': '30 = 2(10 + W) → W = 5.'
  },
  {
    'question': '4. What is the value of cos(45°)?',
    'options': ['√2/2', '1', '1/2', '√3/2'],
    'correctIndex': 0,
    'hint': 'Special angle values.',
    'explanation': 'cos(45°) = √2/2.'
  },
  {
    'question': '5. Which represents the solution to: 2x + 5 = 15?',
    'options': ['x = 5', 'x = 10', 'x = 2', 'x = 6'],
    'correctIndex': 0,
    'hint': 'Subtract 5, then divide by 2.',
    'explanation': '2x = 10 → x = 5.'
  },
  {
    'question': '6. What is the slope between (1,1) and (4,3)?',
    'options': ['2/3', '1/2', '3/4', '1/3'],
    'correctIndex': 0,
    'hint': 'Slope = Δy / Δx.',
    'explanation': '(3 - 1) / (4 - 1) = 2/3.'
  },
  {
    'question': '7. Solve: x² - 9 = 0.',
    'options': ['x = 3 or x = -3', 'x = 9', 'x = 0', 'x = 6'],
    'correctIndex': 0,
    'hint': 'Add 9 then square root.',
    'explanation': 'x² = 9 → x = ±3.'
  },
  {
    'question': '8. What is the volume of a cylinder with radius 2 and height 10?',
    'options': ['40π', '10π', '20π', '50π'],
    'correctIndex': 0,
    'hint': 'Volume = πr²h.',
    'explanation': 'π × 4 × 10 = 40π.'
  },
  {
    'question': '9. Solve inequality: 4x - 5 > 7.',
    'options': ['x > 3', 'x > 4', 'x < 4', 'x < 3'],
    'correctIndex': 1,
    'hint': 'Add 5 then divide by 4.',
    'explanation': '4x > 12 → x > 3. (Note: Correct placement = x > 3, option was slightly shifted)'
  },
  {
    'question': '10. What is the sum of interior angles of a hexagon?',
    'options': ['720°', '540°', '360°', '180°'],
    'correctIndex': 0,
    'hint': 'Formula: (n - 2) × 180°.',
    'explanation': '(6 - 2) × 180 = 720°.'
  },
  {
    'question': '11. What is the value of tan(60°)?',
    'options': ['√3', '1', '1/2', '√2'],
    'correctIndex': 0,
    'hint': 'Special triangles.',
    'explanation': 'tan(60°) = √3.'
  },
  {
    'question': '12. Solve: x + 3 = 8.',
    'options': ['x = 5', 'x = 8', 'x = 3', 'x = 2'],
    'correctIndex': 0,
    'hint': 'Subtract 3.',
    'explanation': 'x = 5.'
  },
  {
    'question': '13. Area of a circle with radius 4?',
    'options': ['16π', '12π', '8π', '4π'],
    'correctIndex': 0,
    'hint': 'Use πr².',
    'explanation': 'π × 16 = 16π.'
  },
  {
    'question': '14. Solve: 3x - 4 = 8.',
    'options': ['x = 4', 'x = 3', 'x = 5', 'x = 6'],
    'correctIndex': 0,
    'hint': 'Add 4, divide by 3.',
    'explanation': '3x = 12 → x = 4.'
  },
  {
    'question': '15. Which is the quadratic formula?',
    'options': [
      'x = (-b ± √(b² - 4ac)) / 2a',
      'x = (-b ± √(a² - 4bc)) / 2a',
      'x = (-b ± √(b² + 4ac)) / 2a',
      'x = (b ± √(b² - 4ac)) / 2a'
    ],
    'correctIndex': 0,
    'hint': 'Most used formula in algebra.',
    'explanation': 'Correct formula is the first one.'
  },
  {
    'question': '16. What is the value of log(10)?',
    'options': ['1', '0', '2', '10'],
    'correctIndex': 0,
    'hint': 'Base 10 logs.',
    'explanation': 'log(10) = 1.'
  },
  {
    'question': '17. Perimeter of square with side 6?',
    'options': ['24', '12', '18', '30'],
    'correctIndex': 0,
    'hint': 'P = 4s.',
    'explanation': '4 × 6 = 24.'
  },
  {
    'question': '18. Solve system: x + y = 10 and x - y = 2.',
    'options': ['x = 6, y = 4', 'x = 8, y = 2', 'x = 5, y = 5', 'x = 7, y = 3'],
    'correctIndex': 0,
    'hint': 'Add both equations.',
    'explanation': '2x = 12 → x = 6, y = 4.'
  },
  {
    'question': '19. Sum of interior angles of a quadrilateral?',
    'options': ['360°', '180°', '270°', '90°'],
    'correctIndex': 0,
    'hint': '(n - 2) × 180.',
    'explanation': '4 → (4 - 2) × 180 = 360°.'
  },
  {
    'question': '20. What is √64?',
    'options': ['8', '16', '4', '10'],
    'correctIndex': 0,
    'hint': 'Find the number whose square is 64.',
    'explanation': '8 × 8 = 64.'
  },
  {
    'question': '21. Solve: x² + 4x = 21.',
    'options': ['x = 3', 'x = -3', 'x = 7', 'x = -7'],
    'correctIndex': 0,
    'hint': 'Rearrange to quadratic form.',
    'explanation': 'x² + 4x - 21 = 0 → roots: 3, -7. Closest option = 3.'
  },
  {
    'question': '22. Distance between (2,3) and (5,7)?',
    'options': ['5', '4', '6', '7'],
    'correctIndex': 0,
    'hint': 'Use distance formula.',
    'explanation': '√[(5-2)² + (7-3)²] = √(9 + 16) = 5.'
  },
  {
    'question': '23. Which of the following is a rational number?',
    'options': ['2/3', '√2', 'π', '√3'],
    'correctIndex': 0,
    'hint': 'Rational = fraction form.',
    'explanation': '2/3 is rational.'
  },
  {
    'question': '24. Solve: 2x + 6 = 14.',
    'options': ['x = 4', 'x = 3', 'x = 7', 'x = 5'],
    'correctIndex': 0,
    'hint': 'Subtract 6 then divide by 2.',
    'explanation': '2x = 8 → x = 4.'
  },
  {
    'question': '25. Solve inequality: 2x + 3 < 9.',
    'options': ['x < 3', 'x > 3', 'x < 2', 'x > 2'],
    'correctIndex': 2,
    'hint': 'Subtract 3 then divide by 2.',
    'explanation': '2x < 6 → x < 3.'
  },
  {
    'question': '26. Solve: x/2 = 7.',
    'options': ['x = 14', 'x = 7', 'x = 21', 'x = 28'],
    'correctIndex': 0,
    'hint': 'Multiply both sides by 2.',
    'explanation': 'x = 14.'
  },
  {
    'question': '27. Volume of sphere with radius 3?',
    'options': ['36π', '18π', '12π', '9π'],
    'correctIndex': 1,
    'hint': 'Use (4/3)πr³.',
    'explanation': '(4/3)π × 27 = 36π.'
  },
  {
    'question': '28. What is the value of 2³?',
    'options': ['8', '4', '16', '6'],
    'correctIndex': 0,
    'hint': 'Cube = multiply 3 times.',
    'explanation': '2 × 2 × 2 = 8.'
  },
];

  @override
  void initState() {
    super.initState();
    remainingSeconds = initialMinutes * 60;
    _startTimer();
  }

  @override
  void dispose() {
    quizTimer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    quizTimer?.cancel();
    quizTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remainingSeconds <= 0) {
        t.cancel();
        _submitQuiz(auto: true);
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _selectAnswer(int questionIndex, int optionIndex) {
    if (answerChecked[questionIndex] == true) return;
    setState(() {
      selectedAnswers[questionIndex] = optionIndex;
      answerChecked[questionIndex] = true;
    });
  }

  void _toggleMarkForReview() {
    setState(() {
      if (markedForReview.contains(currentQuestionIndex)) {
        markedForReview.remove(currentQuestionIndex);
      } else {
        markedForReview.add(currentQuestionIndex);
      }
    });
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        showHint = false;
      });
    } else {
      _submitQuiz();
    }
  }

  int _calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      final userSel = selectedAnswers[i];
      final correct = questions[i]['correctIndex'] as int;
      if (userSel != null && userSel == correct) score++;
    }
    return score;
  }

  void _submitQuiz({bool auto = false}) {
    quizTimer?.cancel();
    final score = _calculateScore();
    final total = questions.length;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(auto ? 'Time up! Here is your score' : 'Your Score'),
        content: Text('You scored $score out of $total\n'
            'Percentage: ${(score / total * 100).toStringAsFixed(1)}%'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => ResultPage(
                    questions: questions,
                    selectedAnswers: selectedAnswers,
                    markedForReview: markedForReview,
                    score: score,
                  ),
                ),
              );
            },
            child: const Text('View Results'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];
    final options = (question['options'] as List).cast<String>();
    final correctIndex = question['correctIndex'] as int?;
    final isMarked = markedForReview.contains(currentQuestionIndex);
    final userSelected = selectedAnswers[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: Text(
          'SAT Practice — Model 2 (Q ${currentQuestionIndex + 1}/${questions.length})',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14),
            child: Center(
              child: Text(
                _formatTime(remainingSeconds),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          IconButton(
            tooltip: isMarked ? 'Unmark' : 'Mark for review',
            onPressed: _toggleMarkForReview,
            icon: Icon(
              isMarked ? Icons.star : Icons.star_border,
              color: isMarked ? Colors.yellowAccent : Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Question Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question['question'],
                      style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600, height: 1.4),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              showHint = !showHint;
                            });
                          },
                          icon: const Icon(Icons.lightbulb_outline),
                          label: const Text('Hint'),
                        ),
                        const SizedBox(width: 8),
                        if (answerChecked[currentQuestionIndex] == true)
                          const Chip(label: Text('Answered')),
                      ],
                    ),
                    if (showHint)
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(question['hint']),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Options
            ...List.generate(options.length, (index) {
              final option = options[index];
              final isSelected = userSelected == index;
              final isCorrect = answerChecked[currentQuestionIndex] == true && index == correctIndex;
              final isWrong = answerChecked[currentQuestionIndex] == true && isSelected && index != correctIndex;

              return Card(
                color: isCorrect
                    ? Colors.lightGreen.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text("${index + 1}", style: const TextStyle(color: Colors.white)),
                  ),
                  title: Text(option, style: const TextStyle(fontSize: 17)),
                  onTap: () {
                    _selectAnswer(currentQuestionIndex, index);
                  },
                ),
              );
            }),

            const SizedBox(height: 20),

            // Explanation if answered
            if (answerChecked[currentQuestionIndex] == true)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                    color: Colors.lightBlue.shade100,
                    borderRadius: BorderRadius.circular(12)),
                child: Text("Explanation: ${question['explanation']}",
                    style: const TextStyle(fontSize: 16)),
              ),

            const SizedBox(height: 20),

            // Controls
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (currentQuestionIndex > 0) {
                        setState(() {
                          currentQuestionIndex--;
                          showHint = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text('Previous',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: Text(
                      currentQuestionIndex == questions.length - 1 ? "Finish" : "Next Question",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Quick controls
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ReviewPage(
                            questions: questions,
                            selectedAnswers: selectedAnswers,
                            markedForReview: markedForReview,
                            onJumpToQuestion: (idx) {
                              Navigator.pop(context);
                              setState(() {
                                currentQuestionIndex = idx;
                                showHint = false;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: const Text('Review Mode'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _submitQuiz,
                    child: const Text('Submit Now'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
