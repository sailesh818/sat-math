import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AlgebraEasyPractise13 extends StatefulWidget {
  const AlgebraEasyPractise13({super.key});

  @override
  State<AlgebraEasyPractise13> createState() => _AlgebraEasyPractise13State();
}

class _AlgebraEasyPractise13State extends State<AlgebraEasyPractise13> {
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
      'question': '1. Simplify: 6x/9',
      'options': ['2x/3', '3x/6', 'x/2', '3/2x'],
      'correctIndex': 0,
      'hint': 'Divide numerator and denominator by their GCD (3).',
      'explanation': '6x ÷ 3 / 9 ÷ 3 = 2x/3'
    },
    {
      'question': '2. Simplify: 8y/12',
      'options': ['2y/3', '3y/2', '4y/6', 'y/3'],
      'correctIndex': 0,
      'hint': 'Divide numerator and denominator by 4.',
      'explanation': '8y ÷ 4 / 12 ÷ 4 = 2y/3'
    },
    {
      'question': '3. Simplify: 15a/25',
      'options': ['3a/5', '5a/3', '3/5a', 'a/5'],
      'correctIndex': 0,
      'hint': 'Divide numerator and denominator by 5.',
      'explanation': '15a ÷ 5 / 25 ÷ 5 = 3a/5'
    },
    {
      'question': '4. Simplify: 14b/21',
      'options': ['2b/3', 'b/2', '7b/3', 'b/3'],
      'correctIndex': 0,
      'hint': 'Divide numerator and denominator by 7.',
      'explanation': '14b ÷ 7 / 21 ÷ 7 = 2b/3'
    },
    {
      'question': '5. Simplify: 9x/12x',
      'options': ['3/4', '4/3', 'x/3', '3x/4'],
      'correctIndex': 0,
      'hint': 'Divide numerator and denominator by 3x.',
      'explanation': '9x ÷ 3x / 12x ÷ 3x = 3/4'
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
      final doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();

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
        .set({
      "totalPoints": FieldValue.increment(pointsToAdd),
    }, SetOptions(merge: true));

    setState(() {
      totalPoints += pointsToAdd;
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
      int basePoints = 4 + correctCount;
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
          'Correct Answers: $correctCount\n'
          'Hint Penalty: -$hintPenalty\n'
          'Final Score: $finalPoints\n\n'
          'Watch an ad to earn extra reward points!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No, Thanks'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showRewardedAd(forHint: false);
            },
            child: const Text('Watch Ad'),
          ),
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ad not ready yet')),
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
              'You have less than 2 reward points. Watch an ad to unlock this hint?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('No, Thanks'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showRewardedAd(forHint: true);
              },
              child: const Text('Watch Ad'),
            ),
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
        title: const Text(
          'Algebra Easy - Practise 13',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(question['options'].length, (index) {
              final option = question['options'][index];
              final isSelected = selectedAnswerIndex == index;
              final isCorrect =
                  answerChecked && index == question['correctIndex'];
              final isWrong = answerChecked && isSelected && !isCorrect;

              return Card(
                color: isCorrect
                    ? Colors.lightGreen.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
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
                  label: const Text(
                    "Hint",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
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
                child: Text(
                  question['hint'],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            const SizedBox(height: 20),
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
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
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1
                      ? "Finish"
                      : "Next Question",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
