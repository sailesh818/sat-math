import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sat_math/rewarded/rewarded_page.dart';

class AiQuestionsShow extends StatefulWidget {
  final String category;
  final String difficulty;
  final String title;

  const AiQuestionsShow({
    super.key,
    required this.category,
    required this.difficulty,
    required this.title,
  });

  @override
  State<AiQuestionsShow> createState() => _AiQuestionsShowState();
}

class _AiQuestionsShowState extends State<AiQuestionsShow> {
  static const int kHintPenalty = 2;

  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  List<Map<String, dynamic>> questions = [];
  bool loadingQuestions = true;

  int hintsUsed = 0;
  int hintPenalty = 0;
  int correctAnswers = 0;

  RewardedAd? _rewardedAd;
  bool _isRewardedAdReady = false;
  bool _hintAdShown = false;
  bool _adLoading = false;

  @override
  void initState() {
    super.initState();
    _loadRandomQuestions();
    _loadRewardedAd();
  }

  /// ================= LOAD QUESTIONS =================
  Future<void> _loadRandomQuestions() async {
    setState(() => loadingQuestions = true);

    try {
      final snap = await FirebaseFirestore.instance
          .collection("sat_questions")
          .where("category", isEqualTo: widget.category)
          .where("difficulty", isEqualTo: widget.difficulty)
          .orderBy("createdAt", descending: true)
          .get();

      if (snap.docs.isEmpty) {
        setState(() {
          questions = [];
          loadingQuestions = false;
        });
        return;
      }

      final docs = snap.docs.toList()..shuffle();
      final selectedDocs = docs.take(min(5, docs.length)).toList();

      final loadedQuestions = selectedDocs.map((doc) {
        final data = doc.data();
        Map<String, dynamic> optionsMap = {};
        if (data['options'] != null && data['options'] is Map) {
          optionsMap = Map<String, dynamic>.from(data['options']);
        }
        final optionKeys = optionsMap.keys.toList();
        final optionValues = optionsMap.values.toList();
        int correctIndex = optionKeys.indexOf(data['correct_answer'] ?? '');
        if (correctIndex < 0) correctIndex = 0;

        return {
          "question": data['question'] ?? '',
          "options": optionValues,
          "correctIndex": correctIndex,
          "hint": data['hint'] ?? '',
          "explanation": data['final_explanation'] ?? '',
        };
      }).toList();

      setState(() {
        questions = loadedQuestions;
        currentQuestionIndex = 0;
        selectedAnswerIndex = null;
        answerChecked = false;
        showHint = false;
        hintsUsed = 0;
        hintPenalty = 0;
        correctAnswers = 0;
        loadingQuestions = false;
      });
    } catch (e) {
      debugPrint("Error loading questions: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to load questions.")),
      );
      setState(() {
        questions = [];
        loadingQuestions = false;
      });
    }
  }

  /// ================= CHECK ANSWER =================
  void checkAnswer(int index) {
    if (!answerChecked) {
      setState(() {
        selectedAnswerIndex = index;
        answerChecked = true;

        if (index == questions[currentQuestionIndex]['correctIndex']) {
          correctAnswers++;
        }

        if (showHint) {
          hintsUsed++;
          hintPenalty += kHintPenalty;
        }
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            selectedAnswerIndex == questions[currentQuestionIndex]['correctIndex']
                ? "Correct! 🎉"
                : "Wrong ❌",
          ),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  /// ================= NEXT QUESTION =================
  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        answerChecked = false;
        showHint = false;
        _hintAdShown = false;
      });
    } else {
      // Quiz finished → go to Reward Page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => RewardPage(
            totalQuestions: questions.length,
            correctAnswers: correctAnswers,
            hintsUsed: hintsUsed,
            hintPenalty: hintPenalty,
          ),
        ),
      );
    }
  }

  /// ================= LOAD REWARDED AD =================
  void _loadRewardedAd() {
    _adLoading = true;
    RewardedAd.load(
      adUnitId: 'ca-app-pub-6704136477020125/4036473926', // Test ID  ca-app-pub-6704136477020125/4036473926
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isRewardedAdReady = true;
          _adLoading = false;
        },
        onAdFailedToLoad: (err) {
          debugPrint('Failed to load rewarded ad: ${err.message}');
          _isRewardedAdReady = false;
          _adLoading = false;
        },
      ),
    );
  }

  /// ================= SHOW REWARDED AD =================
  void _showRewardedAd({required VoidCallback onReward}) {
    if (!_isRewardedAdReady || _rewardedAd == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ad not ready yet.")),
      );
      return;
    }

    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _loadRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (ad, err) {
        ad.dispose();
        _loadRewardedAd();
      },
    );

    _rewardedAd!.show(
      onUserEarnedReward: (ad, reward) {
        onReward(); // Execute the reward logic
      },
    );

    _rewardedAd = null;
    _isRewardedAdReady = false;
  }

  /// ================= USE HINT =================
  Future<void> _useHint() async {
    if (_hintAdShown || _adLoading) return;

    if (hintPenalty < 2) {
      // Not enough points → watch ad
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Hint Available"),
          content: const Text(
              "Watch an ad to unlock this hint?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("No, Thanks"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showRewardedAd(onReward: () {
                  setState(() {
                    showHint = true;
                    _hintAdShown = true;
                    hintsUsed++;
                    hintPenalty += kHintPenalty;
                  });
                });
              },
              child: const Text("Watch Ad"),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        showHint = true;
        hintsUsed++;
        hintPenalty += kHintPenalty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loadingQuestions) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (questions.isEmpty) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "No AI questions available",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Go Back & Generate Questions"),
              ),
            ],
          ),
        ),
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

            // QUESTION CARD
            Card(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // OPTIONS
            ...List.generate(question['options'].length, (index) {
              final option = question['options'][index];
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
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text(option),
                  enabled: !answerChecked,
                  onTap: () => checkAnswer(index),
                ),
              );
            }),

            const SizedBox(height: 10),

            // HINT BUTTON
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: _adLoading ? null : _useHint,
                  icon: const Icon(Icons.lightbulb_outline, color: Colors.white),
                  label: Text(
                    _adLoading ? "Loading Ad..." : "Hint (-2 pts)",
                    style: const TextStyle(color: Colors.white),
                  ),
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
                      ? "Finish Quiz"
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
