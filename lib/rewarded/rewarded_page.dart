import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardPage extends StatefulWidget {
  final int totalQuestions;
  final int correctAnswers;
  final int hintsUsed;
  final int hintPenalty;

  const RewardPage({
    super.key,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.hintsUsed,
    required this.hintPenalty,
  });

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  RewardedAd? _rewardedAd;
  bool _isRewardedAdReady = false;
  bool pointsAwarded = false;
  int totalPoints = 0;

  @override
  void initState() {
    super.initState();
    _loadRewardedAd(); // 🔥 Load as soon as page opens
    _loadUserPoints();
  }

  // ================= LOAD USER POINTS =================
  Future<void> _loadUserPoints() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();

    if (doc.exists) {
      setState(() {
        totalPoints = doc.data()?["totalPoints"] ?? 0;
      });
    }
  }

  // ================= LOAD REWARDED AD =================
  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-6704136477020125/4036473926', // Test Ad ca-app-pub-6704136477020125/4036473926
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isRewardedAdReady = true;
        },
        onAdFailedToLoad: (error) {
          debugPrint("Ad failed to load: ${error.message}");
          _isRewardedAdReady = false;
        },
      ),
    );
  }

  // ================= POINT CALCULATION =================
  int _calculateRewardPoints() {
    if (widget.correctAnswers <= 0) return 5;
    if (widget.correctAnswers == 1) return 6;
    if (widget.correctAnswers == 2) return 7;
    if (widget.correctAnswers == 3) return 8;
    if (widget.correctAnswers == 4) return 9;
    return 10;
  }

  // ================= AWARD POINTS =================
  Future<void> _awardPoints() async {
    if (pointsAwarded) return;

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final rewardPoints = _calculateRewardPoints();

    await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
      "totalPoints": FieldValue.increment(rewardPoints),
    }, SetOptions(merge: true));

    setState(() {
      totalPoints += rewardPoints;
      pointsAwarded = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("+$rewardPoints points added 🎉")),
    );
  }

  // ================= SHOW REWARDED AD =================
  void _showRewardedAd() {
    if (!_isRewardedAdReady || _rewardedAd == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ad is still loading, please wait...")),
      );
      return;
    }

    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _loadRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (ad, _) {
        ad.dispose();
        _loadRewardedAd();
      },
    );

    _rewardedAd!.show(
      onUserEarnedReward: (ad, reward) async {
        await _awardPoints(); // 🔥 Only here points are awarded
      },
    );

    _rewardedAd = null;
    _isRewardedAdReady = false;
  }

  // ================= STAT CARD =================
  Widget _buildStatCard(
      String label, String value, Color color, IconData icon) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 5,
        shadowColor: color.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Icon(icon, size: 32, color: color),
              const SizedBox(height: 8),
              Text(value,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color)),
              const SizedBox(height: 4),
              Text(label,
                  style:
                      const TextStyle(fontSize: 14, color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      appBar: AppBar(
        title: const Text("Quiz Results"),
        backgroundColor: const Color(0xFF1976D2),
        centerTitle: true,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 70),

            // ================= TROPHY =================
            Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade200.withOpacity(0.5),
                    blurRadius: 25,
                    offset: const Offset(0, 12),
                  )
                ],
              ),
              child: const Icon(Icons.emoji_events,
                  size: 90, color: Color(0xFFFFC107)),
            ),

            const SizedBox(height: 40),

            // ================= CLAIM BUTTON (CENTER & PREMIUM) =================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: pointsAwarded ? null : _showRewardedAd,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  elevation: 8,
                ),
                child: Column(
                  children: const [
                    Icon(Icons.card_giftcard,
                        color: Colors.white, size: 28),
                    SizedBox(height: 6),
                    Text(
                      "Claim Reward",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "Watch ad to earn points",
                      style:
                          TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ================= STATS =================
            Row(
              children: [
                _buildStatCard(
                    "Correct Answers",
                    "${widget.correctAnswers} / ${widget.totalQuestions}",
                    Colors.green,
                    Icons.check_circle),
                const SizedBox(width: 12),
                _buildStatCard("Hints Used", "${widget.hintsUsed}",
                    Colors.orange, Icons.lightbulb),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                _buildStatCard("Total Points", "$totalPoints",
                    Colors.blue.shade700, Icons.stars),
                const SizedBox(width: 12),
                _buildStatCard("Hint Penalty", "${widget.hintPenalty}",
                    Colors.red, Icons.remove_circle),
              ],
            ),

            const SizedBox(height: 50),

            // ================= HOME BUTTON (ONLY AT LAST) =================
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.home),
                label: const Text("Home"),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
