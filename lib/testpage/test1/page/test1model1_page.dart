import 'dart:async';
import 'package:flutter/material.dart';

class Test1model1Page extends StatefulWidget {
  const Test1model1Page({super.key});

  @override
  State<Test1model1Page> createState() => _Test1model1PageState();
}

class _Test1model1PageState extends State<Test1model1Page> {
  int currentQuestionIndex = 0;
  Map<int, int?> selectedAnswers = {}; // questionIndex -> selected option index
  Set<int> markedForReview = {};
  Map<int, bool> answerChecked = {}; // whether user has checked/answered that question
  bool showHint = false;

  // Timer: 30 minutes chosen (option B)
  static const int initialMinutes = 30;
  late int remainingSeconds;
  Timer? quizTimer;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. What is the value of x in the equation: 3x + 5 = 20?',
      'options': ['x = 5', 'x = 10', 'x = 3', 'x = 15'],
      'correctIndex': 0,
      'hint': 'Subtract 5, then divide by 3.',
      'explanation': '3x = 15, so x = 5.'
    },
    {
      'question': '2. What is the area of a triangle with a base of 6 and height 8?',
      'options': ['24', '48', '36', '12'],
      'correctIndex': 0,
      'hint': 'Area = 1/2 × base × height.',
      'explanation': 'Area = 1/2 × 6 × 8 = 24.'
    },
    {
      'question': '3. If a circle has radius 7, what is its circumference?',
      'options': ['14π', '21π', '7π', '22π'],
      'correctIndex': 0,
      'hint': 'Use C = 2πr.',
      'explanation': 'C = 2π × 7 = 14π.'
    },
    {
      'question': '4. What is the value of sin(30°)?',
      'options': ['1/2', '√2/2', '√3/2', '1'],
      'correctIndex': 0,
      'hint': 'Memorize special angles.',
      'explanation': 'sin(30°) = 1/2.'
    },
    {
      'question': '5. What is the slope from (2,3) to (4,7)?',
      'options': ['2', '1', '3/2', '4'],
      'correctIndex': 0,
      'hint': 'Slope = (y2 - y1) ÷ (x2 - x1).',
      'explanation': '(7 - 3)/(4 - 2) = 4/2 = 2.'
    },
    {
      'question': '6. Solution to system: 2x + y = 10 and x - y = 2?',
      'options': ['x = 4, y = 2', 'x = 5, y = 0', 'x = 3, y = 4', 'x = 2, y = 6'],
      'correctIndex': 0,
      'hint': 'Add equations to eliminate y.',
      'explanation': 'Adding → 3x = 12 → x = 4 → y = 2.'
    },
    {
      'question': '7. Which is the quadratic formula?',
      'options': [
        'x = (-b ± √(b² - 4ac)) / 2a',
        'x = (-b ± √(a² - 4bc)) / 2a',
        'x = (-b ± √(b² + 4ac)) / 2a',
        'x = (b ± √(b² - 4ac)) / 2a'
      ],
      'correctIndex': 0,
      'hint': 'Most common formula in algebra.',
      'explanation': 'Correct formula = (-b ± √(b² - 4ac)) / 2a.'
    },
    {
      'question': '8. What is the value of 5³?',
      'options': ['125', '15', '25', '105'],
      'correctIndex': 0,
      'hint': 'Cube = multiply three times.',
      'explanation': '5 × 5 × 5 = 125.'
    },
    {
      'question': '9. Area of rectangle with length 10 and width 5?',
      'options': ['50', '15', '25', '30'],
      'correctIndex': 0,
      'hint': 'Area = length × width.',
      'explanation': '10 × 5 = 50.'
    },
    {
      'question': '10. Solve inequality: 3x - 5 > 7.',
      'options': ['x > 4', 'x > 2', 'x < 4', 'x < 2'],
      'correctIndex': 0,
      'hint': 'Add 5 then divide by 3.',
      'explanation': '3x > 12 → x > 4.'
    },
    {
      'question': '11. Which graph is y = x²?',
      'options': [
        'Parabola opening upwards',
        'Straight line',
        'Circle',
        'Parabola opening downwards'
      ],
      'correctIndex': 0,
      'hint': 'Quadratic graphs curve upward.',
      'explanation': 'y = x² → upward parabola.'
    },
    {
      'question': '12. Probability of drawing an ace from 52-card deck?',
      'options': ['1/13', '1/52', '1/26', '1/4'],
      'correctIndex': 0,
      'hint': '4 aces out of 52 cards.',
      'explanation': '4 ÷ 52 = 1/13.'
    },
    {
      'question': '13. Discriminant of x² - 4x + 4?',
      'options': ['16', '0', '4', '1'],
      'correctIndex': 1,
      'hint': 'Use b² - 4ac.',
      'explanation': '(-4)² - 4(1)(4) = 16 - 16 = 0.'
    },
    {
      'question': '14. What is tan(45°)?',
      'options': ['1', '0', '√3', '√2'],
      'correctIndex': 0,
      'hint': 'Special angle triangle.',
      'explanation': 'tan(45°) = 1.'
    },
    {
      'question': '15. Standard linear equation form?',
      'options': ['Ax + By = C', 'y = mx + b', 'x² + y² = r²', 'y = a(x - h)² + k'],
      'correctIndex': 0,
      'hint': 'Standard = Ax + By = C.',
      'explanation': 'That is standard form.'
    },
    {
      'question': '16. What is 4! (factorial)?',
      'options': ['24', '12', '16', '8'],
      'correctIndex': 0,
      'hint': 'Multiply all numbers down to 1.',
      'explanation': '4 × 3 × 2 × 1 = 24.'
    },
    {
      'question': '17. Solve 2x² - 8 = 0.',
      'options': ['2', '0', '4', '-4'],
      'correctIndex': 0,
      'hint': 'Add 8 then divide by 2.',
      'explanation': '2x² = 8 → x² = 4 → x = ±2. (Option 0 lists +2)'
    },
    {
      'question': '18. Two angles sum to 180° — called?',
      'options': ['Complementary', 'Supplementary', 'Vertical', 'Adjacent'],
      'correctIndex': 1,
      'hint': 'Complementary = 90°.',
      'explanation': 'Supplementary = 180°.'
    },
    {
      'question': '19. Slope of a line is?',
      'options': ['Rise over run', 'Run over rise', 'y-intercept', 'x-intercept'],
      'correctIndex': 0,
      'hint': 'Slope = vertical/horizontal.',
      'explanation': 'm = rise/run.'
    },
    {
      'question': '20. What is cos(60°)?',
      'options': ['1/2', '√2/2', '1', '√3/2'],
      'correctIndex': 0,
      'hint': 'Special triangles.',
      'explanation': 'cos(60°) = 1/2.'
    },
    {
      'question': '21. Solve: 3(x - 2) = 9.',
      'options': ['x = 5', 'x = 4', 'x = 3', 'x = 6'],
      'correctIndex': 0,
      'hint': 'Divide both sides by 3 then add 2.',
      'explanation': '3(x - 2) = 9 → x - 2 = 3 → x = 5.'
    },
    {
      'question': '22. Distance between (1,2) and (4,6)?',
      'options': ['5', '6', '4', '3'],
      'correctIndex': 0,
      'hint': 'Use distance formula.',
      'explanation': '√[(4-1)² + (6-2)²] = √(9 + 16) = 5.'
    },
    {
      'question': '23. Solve x² = 16.',
      'options': ['x = 4 or x = -4', 'x = 16', 'x = 4', 'x = -4'],
      'correctIndex': 0,
      'hint': 'Square root gives ±.',
      'explanation': 'x = ±4.'
    },
    {
      'question': '24. Area of a circle with radius 3?',
      'options': ['9π', '3π', '6π', '18π'],
      'correctIndex': 0,
      'hint': 'Area = πr².',
      'explanation': 'π × 3² = 9π.'
    },
    {
      'question': '25. Which is an irrational number?',
      'options': ['√2', 'π', '√3', 'All of the above'],
      'correctIndex': 3,
      'hint': 'Irrational = cannot be expressed as fraction.',
      'explanation': '√2, π, √3 are all irrational.'
    },
    {
      'question': '26. Perimeter of square with side 4?',
      'options': ['16', '12', '8', '24'],
      'correctIndex': 0,
      'hint': 'P = 4 × side.',
      'explanation': '4 × 4 = 16.'
    },
    {
      'question': '27. Interior angle sum of a triangle?',
      'options': ['180°', '360°', '90°', '270°'],
      'correctIndex': 0,
      'hint': 'Basic geometry fact.',
      'explanation': 'Sum = 180°.'
    },
    {
      'question': '28. Value of log(100)?',
      'options': ['2', '1', '3', '10'],
      'correctIndex': 0,
      'hint': 'log means base 10.',
      'explanation': '10² = 100 → log(100) = 2.'
    },
    {
      'question': '29. Probability of NOT happening if P(happens) = 1/4?',
      'options': ['3/4', '1/3', '1/2', '4/3'],
      'correctIndex': 0,
      'hint': 'Add up to 1.',
      'explanation': '1 - 1/4 = 3/4.'
    },
    {
      'question': '30. 5x = 25 → x?',
      'options': ['x = 5', 'x = 4', 'x = 25', 'x = 1'],
      'correctIndex': 0,
      'hint': 'Divide both sides by 5.',
      'explanation': 'x = 25/5 = 5.'
    },
    {
      'question': '31. Volume of cube with side 3?',
      'options': ['27', '9', '12', '18'],
      'correctIndex': 0,
      'hint': 'Volume = side³.',
      'explanation': '3³ = 27.'
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
    if (answerChecked[questionIndex] == true) {
      // already checked — do not change selection for locked-in answers
      return;
    }
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
        content: Text('You scored $score out of $total.\n'
            'Percentage: ${(score / total * 100).toStringAsFixed(1)}%'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close dialog
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
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: Text(
          'SAT Practice — Test 1 (Q ${currentQuestionIndex + 1}/${questions.length})',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          // Timer display
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
                        decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(12)),
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
                    backgroundColor: Colors.green,
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
                decoration: BoxDecoration(color: Colors.green.shade100, borderRadius: BorderRadius.circular(12)),
                child: Text("Explanation: ${question['explanation']}", style: const TextStyle(fontSize: 16)),
              ),

            const SizedBox(height: 20),

            // Controls
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Jump to previous
                      if (currentQuestionIndex > 0) {
                        setState(() {
                          currentQuestionIndex--;
                          showHint = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text('Previous', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
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

            // Quick controls: Jump to review mode or submit
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Open review screen of current progress (without finishing)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ReviewPage(
                            questions: questions,
                            selectedAnswers: selectedAnswers,
                            markedForReview: markedForReview,
                            onJumpToQuestion: (idx) {
                              Navigator.pop(context); // close review
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
                    onPressed: () {
                      // Submit now
                      _submitQuiz();
                    },
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

/// Result page showing score and options to review or retake
class ResultPage extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final Map<int, int?> selectedAnswers;
  final Set<int> markedForReview;
  final int score;

  const ResultPage({
    super.key,
    required this.questions,
    required this.selectedAnswers,
    required this.markedForReview,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final total = questions.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Text('Score: $score / $total', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Percentage: ${(score / total * 100).toStringAsFixed(1)}%', style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text('Marked for review: ${markedForReview.length}', style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () {
                // Open full review
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ReviewPage(
                      questions: questions,
                      selectedAnswers: selectedAnswers,
                      markedForReview: markedForReview,
                      onJumpToQuestion: (idx) {
                        // do nothing here
                      },
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Open Review', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {
                // Retake: pop back to start (simple approach: pop twice or pop to root)
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Retake Test'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Review page lists questions with user answers, correct answers and explanations.
/// onJumpToQuestion allows jumping back to a specific question in the active test when requested.
class ReviewPage extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final Map<int, int?> selectedAnswers;
  final Set<int> markedForReview;
  final void Function(int idx) onJumpToQuestion;

  const ReviewPage({
    super.key,
    required this.questions,
    required this.selectedAnswers,
    required this.markedForReview,
    required this.onJumpToQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Mode'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: questions.length,
        itemBuilder: (_, index) {
          final q = questions[index];
          final options = (q['options'] as List).cast<String>();
          final correctIndex = q['correctIndex'] as int;
          final userSel = selectedAnswers[index];
          final isMarked = markedForReview.contains(index);
          final isCorrect = userSel != null && userSel == correctIndex;

          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              title: Text(q['question'], style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text('Your answer: ${userSel != null ? options[userSel] : "Not answered"}'),
                  Text('Correct answer: ${options[correctIndex]}'),
                  const SizedBox(height: 6),
                  Text('Explanation: ${q['explanation']}'),
                ],
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isMarked) const Icon(Icons.star, color: Colors.yellow),
                  const SizedBox(height: 6),
                  Icon(isCorrect ? Icons.check_circle : Icons.cancel, color: isCorrect ? Colors.green : Colors.red),
                ],
              ),
              onTap: () {
                // jump back to this question in the active test (if desired)
                onJumpToQuestion(index);
              },
            ),
          );
        },
      ),
    );
  }
}
