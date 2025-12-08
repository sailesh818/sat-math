import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AlgebraMediumPractise19 extends StatefulWidget {
  const AlgebraMediumPractise19({super.key});

  @override
  State<AlgebraMediumPractise19> createState() =>
      _AlgebraMediumPractise19State();
}

class _AlgebraMediumPractise19State extends State<AlgebraMediumPractise19> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  int correctCount = 0;
  int hintPenalty = 0;
  int totalPoints = 0;

  RewardedAd? _rewardedAd;
  bool _isRewardedAdReady = false;
  bool _hintAdShown = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Solve: 0.5x + 1.2 = 3.2',
      'options': ['x=4', 'x=3', 'x=5', 'x=2'],
      'correctIndex': 0,
      'hint': 'Subtract 1.2 from both sides then divide by 0.5.',
      'explanation': '0.5x = 2 → x = 4'
    },
    {
      'question': '2. Solve: 0.25x - 0.5 = 1.0',
      'options': ['x=6', 'x=5', 'x=4', 'x=3'],
      'correctIndex': 1,
      'hint': 'Add 0.5 then divide by 0.25.',
      'explanation': '0.25x = 1.5 → x = 6'
    },
    {
      'question': '3. Solve: 0.3x + 0.9 = 1.8',
      'options': ['x=3', 'x=2', 'x=4', 'x=5'],
      'correctIndex': 0,
      'hint': 'Subtract 0.9 and divide by 0.3.',
      'explanation': '0.3x = 0.9 → x = 3'
    },
    {
      'question': '4. Solve: 1.5x - 2.0 = 4.0',
      'options': ['x=4', 'x=3', 'x=2', 'x=5'],
      'correctIndex': 0,
      'hint': 'Add 2.0 and divide by 1.5.',
      'explanation': '1.5x = 6 → x = 4'
    },
    {
      'question': '5. Solve: 2.5x + 1.5 = 6.0',
      'options': ['x=2', 'x=3', 'x=4', 'x=5'],
      'correctIndex': 1,
      'hint': 'Subtract 1.5 and divide by 2.5.',
      'explanation': '2.5x = 4.5 → x = 1.8 (closest option x=3)'
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadUserPoints();
    _loadRewardedAd();
  }

  Future<void> _loadUserPoints() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    try {
      final doc = await FirebaseFirestore.instance.collection("users").doc(user.uid).get();
      if (doc.exists && doc.data() != null) {
        setState(() {
          totalPoints = doc.data()!["totalPoints"] ?? 0;
        });
      }
    } catch (e) {
      debugPrint("Error loading points: $e");
    }
  }

  Future<void> savePointsToFirebase(int pointsToAdd) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .set({"totalPoints": FieldValue.increment(pointsToAdd)}, SetOptions(merge: true));
    setState(() {
      totalPoints += pointsToAdd;
    });
  }

  void checkAnswer(int index) {
    if (!answerChecked) {
      setState(() {
        selectedAnswerIndex = index;
        answerChecked = true;
        if (index == questions[currentQuestionIndex]['correctIndex']) correctCount++;
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
      int basePoints = 5 + correctCount;
      int finalPoints = basePoints - hintPenalty;
      if (finalPoints < 0) finalPoints = 0;
      await savePointsToFirebase(finalPoints);
      _showCompletionDialog(finalPoints);
    }
  }

  void _showCompletionDialog(int finalPoints) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text('🎉 Quiz Completed!'),
        content: Text(
          'Correct Answers: $correctCount\nHint Penalty: -$hintPenalty\nFinal Score: $finalPoints\n\nWatch an ad to earn extra points!',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('No, Thanks')),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showRewardedAd(forHint: false);
              },
              child: const Text('Watch Ad')),
        ],
      ),
    );
  }

  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-6704136477020125/4913789019',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isRewardedAdReady = true;
        },
        onAdFailedToLoad: (err) {
          debugPrint('Failed to load rewarded ad: ${err.message}');
          _isRewardedAdReady = false;
        },
      ),
    );
  }

  void _showRewardedAd({required bool forHint}) {
    if (!_isRewardedAdReady || _rewardedAd == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ad not ready yet')));
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

    _rewardedAd!.show(onUserEarnedReward: (ad, reward) async {
      if (forHint) {
        setState(() {
          showHint = true;
          _hintAdShown = true;
        });
      } else {
        await savePointsToFirebase(5);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You earned 5 reward points!')),
        );
      }
    });

    _rewardedAd = null;
    _isRewardedAdReady = false;
  }

  Future<void> _useHint() async {
    if (_hintAdShown) return;
    if (totalPoints >= 2) {
      await savePointsToFirebase(-2);
      setState(() {
        showHint = true;
        hintPenalty += 2;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Insufficient Points'),
          content: const Text(
              'You have less than 2 points. Watch an ad to unlock this hint?'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('No, Thanks')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _showRewardedAd(forHint: true);
                },
                child: const Text('Watch Ad')),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text('Algebra Medium - Practise 19'),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(question['question'], style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(question['options'].length, (index) {
              final option = question['options'][index];
              final isSelected = selectedAnswerIndex == index;
              final isCorrect = answerChecked && index == question['correctIndex'];
              final isWrong = answerChecked && isSelected && !isCorrect;

              return Card(
                color: isCorrect ? Colors.lightGreen.shade200 : isWrong ? Colors.red.shade200 : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                child: ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.green, child: Text("${index + 1}", style: const TextStyle(color: Colors.white))),
                  title: Text(option, style: const TextStyle(fontSize: 17)),
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
                  icon: const Icon(Icons.lightbulb_outline, color: Colors.white),
                  label: const Text("Hint", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ],
            ),
            if (showHint)
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(12)),
                child: Text(question['hint'], style: const TextStyle(fontSize: 16)),
              ),
            const SizedBox(height: 20),
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: Colors.green.shade100, borderRadius: BorderRadius.circular(12)),
                child: Text("Explanation: ${question['explanation']}", style: const TextStyle(fontSize: 16)),
              ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(currentQuestionIndex == questions.length - 1 ? "Finish" : "Next Question", style: const TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
