import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AlgebraMediumPractise21 extends StatefulWidget {
  const AlgebraMediumPractise21({super.key});

  @override
  State<AlgebraMediumPractise21> createState() =>
      _AlgebraMediumPractise21State();
}

class _AlgebraMediumPractise21State extends State<AlgebraMediumPractise21> {
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
      'question':
          '1. A recipe needs 3/4 cup of sugar. If you want to make 2 batches, how much sugar is needed?',
      'options': ['1 1/2 cups', '1 1/4 cups', '2 cups', '1 cup'],
      'correctIndex': 0,
      'hint': 'Multiply 3/4 by 2.',
      'explanation': '3/4 × 2 = 6/4 = 1 1/2 cups'
    },
    {
      'question':
          '2. A car traveled 2/3 of a mile in 1 minute. How far does it travel in 3 minutes?',
      'options': ['2 miles', '1 2/3 miles', '1 mile', '2 1/2 miles'],
      'correctIndex': 0,
      'hint': 'Multiply 2/3 by 3.',
      'explanation': '2/3 × 3 = 2 miles'
    },
    {
      'question':
          '3. John ate 1/5 of a pizza. Sarah ate 2/5. How much pizza was eaten in total?',
      'options': ['1/2', '3/5', '2/5', '4/5'],
      'correctIndex': 1,
      'hint': 'Add 1/5 + 2/5.',
      'explanation': '1/5 + 2/5 = 3/5 of pizza eaten'
    },
    {
      'question':
          '4. A piece of ribbon is 7/8 m long. If 3 pieces are used, what is the total length?',
      'options': ['2 5/8 m', '2 1/2 m', '3 m', '2 m'],
      'correctIndex': 0,
      'hint': 'Multiply 7/8 by 3.',
      'explanation': '7/8 × 3 = 21/8 = 2 5/8 m'
    },
    {
      'question':
          '5. A tank is filled with 1/6 liters per minute. How much is filled in 12 minutes?',
      'options': ['2 liters', '1 liter', '2 1/2 liters', '1 1/2 liters'],
      'correctIndex': 0,
      'hint': 'Multiply 1/6 × 12.',
      'explanation': '1/6 × 12 = 12/6 = 2 liters'
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
        title: const Text('Algebra Medium - Practise 21'),
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
