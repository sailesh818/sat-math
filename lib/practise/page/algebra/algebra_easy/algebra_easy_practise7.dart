import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AlgebraEasyPractise7 extends StatefulWidget {
  const AlgebraEasyPractise7({super.key});

  @override
  State<AlgebraEasyPractise7> createState() => _AlgebraEasyPractise7State();
}

class _AlgebraEasyPractise7State extends State<AlgebraEasyPractise7> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  int correctCount = 0;
  int hintPenalty = 0;
  int totalPoints = 0;
  bool loadingPoints = true;

  RewardedAd? _rewardedAd;
  bool _isRewardedAdReady = false;
  bool _hintAdShown = false;

  // 🔹 Topic: Solving One-Step Linear Equations
  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Solve for x: x + 5 = 12',
      'options': ['x = 7', 'x = 17', 'x = -7', 'x = 5'],
      'correctIndex': 0,
      'hint': 'Subtract 5 from both sides to isolate x.',
      'explanation': 'x + 5 = 12 → x = 12 - 5 → x = 7.'
    },
    {
      'question': '2. Solve for y: y - 8 = 4',
      'options': ['y = -4', 'y = 12', 'y = 4', 'y = 8'],
      'correctIndex': 1,
      'hint': 'Add 8 to both sides to isolate y.',
      'explanation': 'y - 8 = 4 → y = 4 + 8 → y = 12.'
    },
    {
      'question': '3. Solve for a: 3a = 15',
      'options': ['a = 5', 'a = 45', 'a = 18', 'a = 3'],
      'correctIndex': 0,
      'hint': 'Divide both sides by 3 to isolate a.',
      'explanation': '3a = 15 → a = 15 / 3 → a = 5.'
    },
    {
      'question': '4. Solve for n: n / 4 = 6',
      'options': ['n = 10', 'n = 24', 'n = 2', 'n = 12'],
      'correctIndex': 1,
      'hint': 'Multiply both sides by 4 to isolate n.',
      'explanation': 'n / 4 = 6 → n = 6 * 4 → n = 24.'
    },
    {
      'question': '5. Solve for p: p - 3 = 9',
      'options': ['p = 12', 'p = 6', 'p = -6', 'p = 3'],
      'correctIndex': 0,
      'hint': 'Add 3 to both sides to isolate p.',
      'explanation': 'p - 3 = 9 → p = 9 + 3 → p = 12.'
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
    if (user == null) {
      setState(() {
        totalPoints = 0;
        loadingPoints = false;
      });
      return;
    }

    setState(() {
      loadingPoints = true;
    });

    try {
      final doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();

      if (doc.exists && doc.data() != null) {
        final data = doc.data()!;
        setState(() {
          totalPoints = (data["totalPoints"] ?? 0) as int;
        });
      }
    } catch (e) {
      debugPrint("Error loading points: $e");
    }

    setState(() {
      loadingPoints = false;
    });
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
      adUnitId: 'ca-app-pub-6704136477020125/4913789019', // keep your ad unit id here
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
        hintPenalty += 2;
        showHint = true;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Need Hint?'),
          content: const Text(
            'You don’t have enough points.\nWatch an ad to unlock this hint?',
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel')),
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
          'Algebra Easy - Practise 7',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (loadingPoints)
              const SizedBox(height: 8, child: LinearProgressIndicator()),
            const SizedBox(height: 8),
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
                  title: Text(
                    option,
                    style: const TextStyle(fontSize: 17),
                  ),
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
