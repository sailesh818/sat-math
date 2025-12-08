import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AlgebraEasyPractise3 extends StatefulWidget {
  const AlgebraEasyPractise3({super.key});

  @override
  State<AlgebraEasyPractise3> createState() => _AlgebraEasyPractise3State();
}

class _AlgebraEasyPractise3State extends State<AlgebraEasyPractise3> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  bool showHint = false;

  int userPoints = 0;

  RewardedAd? rewardedAd;

  @override
  void initState() {
    super.initState();
    loadUserPoints();
    loadRewardedAd();
  }

  /// ----------------- LOAD USER POINTS -----------------
  Future<void> loadUserPoints() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final doc = await FirebaseFirestore.instance.collection("users").doc(uid).get();
    setState(() {
      userPoints = (doc.data()?["points"] ?? 0);
    });
  }

  /// ----------------- UPDATE POINTS -----------------
  Future<void> updatePoints(int change) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    userPoints += change;

    await FirebaseFirestore.instance.collection("users").doc(uid).update({
      "points": userPoints,
    });

    setState(() {});
  }

  /// ----------------- LOAD REWARDED AD -----------------
  void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: "ca-app-pub-3940256099942544/5224354917", // Test Ad ID
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          rewardedAd = ad;
        },
        onAdFailedToLoad: (error) {
          rewardedAd = null;
        },
      ),
    );
  }

  /// ----------------- SHOW AD -----------------
  void showRewardedAdForHint() {
    if (rewardedAd != null) {
      rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          setState(() => showHint = true);
        },
      );
      rewardedAd = null;
      loadRewardedAd();
    }
  }

  /// ----------------- QUESTIONS -----------------
  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. If x = 4, find the value of 3x + 2.',
      'options': ['10', '12', '14', '8'],
      'correctIndex': 2,
      'hint': 'Substitute x = 4 into 3x + 2.',
      'explanation': '3(4) + 2 = 12 + 2 = 14.'
    },
    {
      'question': '2. Evaluate: 5y - 7 when y = 3.',
      'options': ['8', '10', '15', '5'],
      'correctIndex': 0,
      'hint': 'Replace y with 3.',
      'explanation': '5(3) - 7 = 15 - 7 = 8.'
    },
    {
      'question': '3. Find the value of 2a + 3b if a = 2 and b = 1.',
      'options': ['5', '6', '7', '8'],
      'correctIndex': 1,
      'hint': 'Substitute a = 2 and b = 1.',
      'explanation': '2(2) + 3(1) = 4 + 3 = 7.'
    },
    {
      'question': '4. If x = 2 and y = 3, evaluate 4x + y.',
      'options': ['11', '10', '9', '12'],
      'correctIndex': 0,
      'hint': 'Multiply 4×x then add y.',
      'explanation': '4(2) + 3 = 8 + 3 = 11.'
    },
    {
      'question': '5. If p = 6, find p² - 3p.',
      'options': ['12', '18', '21', '27'],
      'correctIndex': 1,
      'hint': 'Square p first, then subtract 3p.',
      'explanation': '6² − 3(6) = 36 − 18 = 18.'
    },
  ];

  /// ----------------- CHECK ANSWER -----------------
  void checkAnswer(int index) {
    if (answerChecked) return;

    setState(() {
      selectedAnswerIndex = index;
      answerChecked = true;
    });

    final correct = index == questions[currentQuestionIndex]['correctIndex'];

    if (correct) {
      updatePoints(5); // +5 points for correct answer
    } else {
      updatePoints(-2); // -2 points for wrong answer
    }
  }

  /// ----------------- NEXT QUESTION -----------------
  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        answerChecked = false;
        showHint = false;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("🎉 Completed!"),
          content: const Text("You solved all questions in this practice!"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "Algebra Easy - Practise 3",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                "⭐ $userPoints",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// ----------------- QUESTION -----------------
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  q['question'],
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// ----------------- OPTIONS -----------------
            ...List.generate(q['options'].length, (i) {
              final option = q['options'][i];
              final isCorrect = answerChecked && i == q['correctIndex'];
              final isWrong =
                  answerChecked && selectedAnswerIndex == i && !isCorrect;

              return Card(
                color: isCorrect
                    ? Colors.green.shade200
                    : isWrong
                        ? Colors.red.shade200
                        : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 2,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text("${i + 1}", style: const TextStyle(color: Colors.white)),
                  ),
                  title: Text(option, style: const TextStyle(fontSize: 17)),
                  onTap: () => checkAnswer(i),
                ),
              );
            }),

            const SizedBox(height: 10),

            /// ----------------- HINT BUTTON -----------------
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (showHint) return;

                  if (userPoints >= 10) {
                    updatePoints(-10);
                    setState(() => showHint = true);
                  } else {
                    showRewardedAdForHint();
                  }
                },
                icon: const Icon(Icons.lightbulb_outline, color: Colors.white),
                label: const Text("Hint", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            if (showHint)
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(q['hint'], style: const TextStyle(fontSize: 16)),
              ),

            const SizedBox(height: 20),

            /// ----------------- EXPLANATION -----------------
            if (answerChecked)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Explanation: ${q['explanation']}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            /// ----------------- NEXT BUTTON -----------------
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
