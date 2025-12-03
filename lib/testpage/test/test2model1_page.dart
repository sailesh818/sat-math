import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
// import your ResultPage; update the path as per your project structure
import 'package:sat_math/testpage/test1/page/test1model1_page.dart';

class Test2Model1Page extends StatefulWidget {
  const Test2Model1Page({super.key});

  @override
  State<Test2Model1Page> createState() => _Test2Model1PageState();
}

class _Test2Model1PageState extends State<Test2Model1Page> {
  int currentQuestionIndex = 0;
  List<Map<String, dynamic>> questions = [];

  Map<int, int?> selectedAnswers = {}; // questionIndex -> selected option index
  Set<int> markedForReview = {};
  Map<int, bool> answerChecked = {};
  bool showHint = false;

  static const int initialMinutes = 30;
  late int remainingSeconds;
  Timer? quizTimer;

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadQuestions().then((_) {
      setState(() {
        _loading = false;
        remainingSeconds = initialMinutes * 60;
        _startTimer();
      });
    });
  }

  Future<void> _loadQuestions() async {
    final String jsonString = await rootBundle.loadString('assets/test2/test2model1.json');
    final List<dynamic> data = json.decode(jsonString);
    questions = data.map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e)).toList();
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

  void _goPrevious() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        showHint = false;
      });
    }
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
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final question = questions[currentQuestionIndex];
    final options = (question['options'] as List).cast<String>();
    final correctIndex = question['correctIndex'] as int;
    final isMarked = markedForReview.contains(currentQuestionIndex);
    final userSelected = selectedAnswers[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: Text(
          'SAT Practice — Model 1 (Q ${currentQuestionIndex + 1}/${questions.length})',
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
                      question['question'] as String,
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
                        child: Text(question['hint'] as String),
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
              final answered = answerChecked[currentQuestionIndex] == true;
              final isCorrect = answered && index == correctIndex;
              final isWrong = answered && isSelected && index != correctIndex;

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
                child: Text("Explanation: ${question['explanation'] as String}",
                    style: const TextStyle(fontSize: 16)),
              ),

            const SizedBox(height: 20),

            // Navigation Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _goPrevious,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
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

            // Review / Submit Buttons
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
