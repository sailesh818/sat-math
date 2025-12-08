import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FunctionsMediumPractisePage extends StatefulWidget {
  final String jsonFileName;
  final String title;

  const FunctionsMediumPractisePage({
    super.key,
    required this.jsonFileName,
    required this.title,
  });

  @override
  State<FunctionsMediumPractisePage> createState() =>
      _FunctionsMediumPractisePageState();
}

class _FunctionsMediumPractisePageState
    extends State<FunctionsMediumPractisePage> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;
  List<Map<String, dynamic>> questions = [];

  int correctCount = 0;
  int totalPoints = 0;
  int hintPenalty = 0;
  bool loadingPoints = true;

  RewardedAd? _rewardedAd;
  bool _isRewardedAdReady = false;
  bool _hintAdShown = false;

  @override
  void initState() {
    super.initState();
    loadQuestions();
    _loadUserPoints();
    _loadRewardedAd();
  }

  Future<void> loadQuestions() async {
    try {
      final String response = await rootBundle.loadString(
          'assets/functions/functionsmedium/${widget.jsonFileName}');
      final data = json.decode(response);

      setState(() {
        questions = List<Map<String, dynamic>>.from(data);
      });
    } catch (e) {
      debugPrint('Error loading JSON: $e');
    }
  }

  Future<void> _loadUserPoints() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    try {
      final doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();

      if (doc.exists && doc.data() != null) {
        totalPoints = doc.data()!["totalPoints"] ?? 0;
      }
    } catch (e) {
      debugPrint("Error loading points: $e");
    }

    setState(() => loadingPoints = false);
  }

  Future<void> savePointsToFirebase(int pts) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
      "totalPoints": FieldValue.increment(pts),
    }, SetOptions(merge: true));

    setState(() {
      totalPoints += pts;
    });
  }

  void checkAnswer(int index) {
    if (!answerChecked) {
      setState(() {
        selectedAnswerIndex = index;
        answerChecked = true;

        if (index == questions[currentQuestionIndex]['correctIndex']) {
          correctCount++;
        }
      });
    }
  }

  void nextQuestion() async {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        answerChecked = false;
        showHint = false;
        _hintAdShown = false;
      });
    } else {
      int base = 6 + correctCount;
      int finalScore = base - hintPenalty;
      if (finalScore < 0) finalScore = 0;

      await savePointsToFirebase(finalScore);

      _showCompletionDialog(finalScore);
    }
  }

  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-6704136477020125/4913789019', // TEST ID
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isRewardedAdReady = true;
        },
        onAdFailedToLoad: (err) {
          _isRewardedAdReady = false;
        },
      ),
    );
  }

  void _showRewardedAd({required bool forHint}) {
    if (!_isRewardedAdReady || _rewardedAd == null) return;

    _rewardedAd!.show(onUserEarnedReward: (ad, reward) async {
      if (forHint) {
        setState(() {
          showHint = true;
          _hintAdShown = true;
        });
      } else {
        await savePointsToFirebase(5); // Medium level bonus
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("You earned 5 bonus points!")),
        );
      }
    });

    _rewardedAd = null;
    _isRewardedAdReady = false;
    _loadRewardedAd();
  }

  Future<void> _useHint() async {
    if (_hintAdShown) return;

    if (totalPoints >= 3) {
      await savePointsToFirebase(-3);
      hintPenalty += 3;
      setState(() => showHint = true);
    } else {
      _showHintAdDialog();
    }
  }

  void _showHintAdDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Not Enough Points"),
        content: const Text("You need 3 points. Watch ad to unlock hint?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showRewardedAd(forHint: true);
            },
            child: const Text("Watch Ad"),
          ),
        ],
      ),
    );
  }

  void _showCompletionDialog(int finalScore) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text("🎉 Great Job!"),
        content: Text(
          "Correct Answers: $correctCount\n"
          "Hint Penalty: -$hintPenalty\n"
          "Final Score: $finalScore\n\n"
          "Watch an ad to earn extra reward points?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showRewardedAd(forHint: false);
            },
            child: const Text("Watch Ad"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty || loadingPoints) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final question = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              color: Colors.blue,
              backgroundColor: Colors.blue.shade100,
            ),
            const SizedBox(height: 20),

            Card(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// OPTIONS
            ...List.generate(question['options'].length, (index) {
              final isSelected = selectedAnswerIndex == index;
              final isCorrect =
                  answerChecked && index == question['correctIndex'];
              final isWrong = answerChecked && isSelected && !isCorrect;

              return Card(
                color: isCorrect
                    ? Colors.green.shade100
                    : isWrong
                        ? Colors.red.shade100
                        : Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  title: Text(question['options'][index]),
                  onTap: () => checkAnswer(index),
                ),
              );
            }),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: _useHint,
                  icon:
                      const Icon(Icons.lightbulb_outline, color: Colors.white),
                  label: const Text("Hint",
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                  ),
                ),
              ],
            ),

            if (showHint)
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  question['hint'],
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Explanation: ${question['explanation']}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1
                      ? "Finish"
                      : "Next Question",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
