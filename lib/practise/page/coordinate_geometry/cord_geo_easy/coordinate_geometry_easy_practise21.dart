import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CoordinateGeometryEasyPractise21 extends StatefulWidget {
  const CoordinateGeometryEasyPractise21({super.key});

  @override
  State<CoordinateGeometryEasyPractise21> createState() =>
      _CoordinateGeometryEasyPractise21State();
}

class _CoordinateGeometryEasyPractise21State
    extends State<CoordinateGeometryEasyPractise21> {
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

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Slope of line joining points (-2,3) and (4,−1) is:',
      'options': ['1/2', '-2/3', '-2/1', '-1'],
      'correctIndex': 1,
      'hint': 'Slope formula: m = (y2−y1)/(x2−x1)',
      'explanation': 'Slope = (−1−3)/(4−(−2)) = (−4)/6 = −2/3'
    },
    {
      'question': '2. Midpoint of line joining (−4,5) and (2,−1) is:',
      'options': ['(−1,2)', '(−1,3)', '(0,2)', '(0,3)'],
      'correctIndex': 0,
      'hint': 'Midpoint formula: ((x1+x2)/2, (y1+y2)/2)',
      'explanation': 'Midpoint = ((−4+2)/2, (5+(−1))/2) = (−1,2)'
    },
    {
      'question': '3. Distance between points (1,−2) and (4,2) is:',
      'options': ['5', '√20', '√17', '4'],
      'correctIndex': 0,
      'hint': 'Distance formula: √[(x2−x1)² + (y2−y1)²]',
      'explanation': 'Distance = √[(4−1)² + (2−(−2))²] = √[9+16] = 5'
    },
    {
      'question': '4. Equation of line passing through (−1,2) with slope 3 is:',
      'options': ['y = 3x + 5', 'y = 3x + 1', 'y = −3x + 5', 'y = −3x + 1'],
      'correctIndex': 0,
      'hint': 'Use point-slope form: y−y1 = m(x−x1)',
      'explanation': 'y−2 = 3(x+1) ⇒ y = 3x + 5'
    },
    {
      'question': '5. Are points (0,0), (1,1), (2,3) collinear?',
      'options': ['Yes', 'No', 'Cannot Determine', 'Partially'],
      'correctIndex': 1,
      'hint': 'Compare slopes between consecutive points',
      'explanation': 'Slope (0,0)-(1,1) =1, Slope (1,1)-(2,3)=2 ⇒ not collinear'
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
          totalPoints = data["totalPoints"] ?? 0;
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
          'Coordinate Geometry - Easy Practise 21',
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
