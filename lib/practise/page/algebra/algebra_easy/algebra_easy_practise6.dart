import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AlgebraEasyPractise6 extends StatefulWidget {
  const AlgebraEasyPractise6({super.key});

  @override
  State<AlgebraEasyPractise6> createState() => _AlgebraEasyPractise6State();
}

class _AlgebraEasyPractise6State extends State<AlgebraEasyPractise6> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  int userPoints = 0;
  bool isAdLoaded = false;
  RewardedAd? rewardedAd;

  // ⭐ Load User Points
  @override
  void initState() {
    super.initState();
    loadUserPoints();
    loadRewardedAd();
  }

  Future<void> loadUserPoints() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final snap = await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (snap.exists && snap.data()!.containsKey('points')) {
      setState(() {
        userPoints = snap['points'];
      });
    }
  }

  Future<void> saveUserPoints() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'points': userPoints,
    });
  }

  // ⭐ Load Rewarded Ad
  void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917', // Test ad
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          rewardedAd = ad;
          setState(() => isAdLoaded = true);
        },
        onAdFailedToLoad: (error) {
          isAdLoaded = false;
        },
      ),
    );
  }

  void showRewardedAd(Function rewardCallback) {
    if (rewardedAd == null) return;

    rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        loadRewardedAd();
      },
    );

    rewardedAd!.show(
      onUserEarnedReward: (ad, reward) {
        rewardCallback();
      },
    );
  }

  // 🔹 Topic Questions
  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Simplify: 2(x + 3) + 4x',
      'options': ['2x + 6 + 4x', '6x + 6', '8x + 3', '2x + 12'],
      'correctIndex': 1,
      'hint': 'Distribute 2 first: 2·x and 2·3.',
      'explanation': '2(x+3)=2x+6, then 2x+6+4x=6x+6.'
    },
    {
      'question': '2. Simplify: 3(2y + 5) - y',
      'options': ['6y + 15 - y', '5y + 15', '2y + 5', '7y + 5'],
      'correctIndex': 1,
      'hint': 'Distribute 3, then combine: 6y - y.',
      'explanation': '3(2y+5)=6y+15 → 6y - y = 5y → 5y + 15.'
    },
    {
      'question': '3. Simplify: 4(3a - 2) + 5a',
      'options': ['12a - 8 + 5a', '17a - 8', '7a - 8', '12a + 5a - 2'],
      'correctIndex': 1,
      'hint': 'Distribute 4: 4·3a and 4·(-2).',
      'explanation': '4(3a-2)=12a-8 → 12a+5a=17a → 17a-8.'
    },
    {
      'question': '4. Simplify: 5(2x + 1) - 3x',
      'options': ['10x + 5 - 3x', '7x + 5', '8x + 1', '5x + 7'],
      'correctIndex': 1,
      'hint': 'Distribute 5 first: 5·2x and 5·1.',
      'explanation': '5(2x+1)=10x+5 → 10x - 3x = 7x → 7x + 5.'
    },
    {
      'question': '5. Simplify: 6(p - 4) + 2p + 8',
      'options': ['6p - 24 + 2p + 8', '8p - 16', '4p - 16', '8p + 12'],
      'correctIndex': 1,
      'hint': 'Distribute 6 and then combine terms.',
      'explanation': '6(p-4)=6p-24 → 6p+2p=8p → -24+8=-16 → 8p-16.'
    },
  ];

  void checkAnswer(int index) {
    if (!answerChecked) {
      setState(() {
        selectedAnswerIndex = index;
        answerChecked = true;

        /// ⭐ Earn Points for Correct Answer
        if (index == questions[currentQuestionIndex]['correctIndex']) {
          userPoints += 3;
          saveUserPoints();
        }
      });
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        answerChecked = false;
        showHint = false;
      });
    } else {
      showCompletionDialog();
    }
  }

  void showCompletionDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("🎉 Great Job!"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("You finished all questions."),
            const SizedBox(height: 10),
            Text("⭐ Points Earned: $userPoints"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (!isAdLoaded) return;
                showRewardedAd(() {
                  setState(() {
                    userPoints += 10;
                  });
                  saveUserPoints();
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Watch Ad to Earn +10 Points"),
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  void handleHint() {
    if (userPoints >= 2) {
      setState(() {
        userPoints -= 2;
        showHint = true;
      });
      saveUserPoints();
    } else {
      if (isAdLoaded) {
        showRewardedAd(() {
          setState(() {
            userPoints += 5;
          });
          saveUserPoints();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text(
          'Algebra Easy - Practise 6',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ⭐ Points Display
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "⭐ Points: $userPoints",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 20),

            /// QUESTION CARD
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      height: 1.4),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// OPTIONS
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

            /// HINT BUTTON
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: handleHint,
                  icon: const Icon(Icons.lightbulb_outline, color: Colors.white),
                  label: const Text(
                    "Hint (-2 pts)",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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

            /// NEXT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
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
