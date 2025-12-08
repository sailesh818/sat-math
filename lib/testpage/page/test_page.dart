import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sat_math/login/pages/login_page.dart';

// Import Test Pages
import 'package:sat_math/testpage/test1/page/test1model1_page.dart';
import 'package:sat_math/testpage/test1/page/test1model2_page.dart';
import 'package:sat_math/testpage/test/test2model1_page.dart';
import 'package:sat_math/testpage/test/test2model2_page.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  User? user = FirebaseAuth.instance.currentUser;
  int totalPoints = 0;
  bool loadingPoints = true;
  bool autoLoginChecked = false;

  final int requiredPoints = 1000;

  @override
  void initState() {
    super.initState();
    _autoAnonymousLogin();
  }

  /// AUTO ANONYMOUS LOGIN IF NO USER
  Future<void> _autoAnonymousLogin() async {
    if (user == null) {
      await FirebaseAuth.instance.signInAnonymously();
      user = FirebaseAuth.instance.currentUser;
    }

    autoLoginChecked = true;
    await _loadUserPoints();

    if (mounted) setState(() {});
  }

  /// LOAD POINTS FROM FIRESTORE
  Future<void> _loadUserPoints() async {
    if (user == null) return;

    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .get();

      if (doc.exists && doc.data() != null) {
        final data = doc.data() as Map<String, dynamic>;
        if (mounted) {
          setState(() {
            totalPoints = data["totalPoints"] ?? 0;
          });
        }
      }
    } catch (e) {
      debugPrint("Error loading points: $e");
    }

    loadingPoints = false;
    if (mounted) setState(() {});
  }

  /// MANUAL ANONYMOUS LOGIN
  Future<void> _login() async {
    await FirebaseAuth.instance.signInAnonymously();
    user = FirebaseAuth.instance.currentUser;

    await _loadUserPoints();
    if (mounted) setState(() {});
  }

  /// LOGOUT
  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();

    setState(() {
      user = null;
      totalPoints = 0;
      autoLoginChecked = false;
    });

    _autoAnonymousLogin();
  }

  // Navigation Functions
  void _openTest(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  Future<void> _checkAndOpenTest(Widget testPage, String testName) async {
    if (totalPoints >= requiredPoints) {
      bool confirm = await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Access $testName"),
          content: Text(
              "This test requires $requiredPoints points. You currently have $totalPoints points. Do you want to continue?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Continue"),
            ),
          ],
        ),
      );

      if (confirm) _openTest(testPage);
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Insufficient Points"),
          content: Text(
              "You need $requiredPoints points to take $testName. Practice lessons to earn more points!"),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  // Bottom Sheet for Models
  Widget _modelSheet(String title, VoidCallback model1, VoidCallback model2) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          ElevatedButton(onPressed: model1, child: const Text("Model 1")),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: model2, child: const Text("Model 2")),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _showTest1Models() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _modelSheet(
        "Test 1 Models",
        () => _checkAndOpenTest(const Test1model1Page(), "Test 1 Model 1"),
        () => _checkAndOpenTest(const Test1model2Page(), "Test 1 Model 2"),
      ),
    );
  }

  void _showTest2Models() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _modelSheet(
        "Test 2 Models",
        () => _checkAndOpenTest(const Test2Model1Page(), "Test 2 Model 1"),
        () => _checkAndOpenTest(const Test2Model2Page(), "Test 2 Model 2"),
      ),
    );
  }

  /// DRAWER
  Drawer _buildDrawer() {
    final bool isLoggedIn = user != null;
    final bool isAnonymous = user?.isAnonymous ?? false;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.account_circle, size: 90, color: Colors.green),
            const SizedBox(height: 10),

            // USER STATUS
            Text(
              isLoggedIn
                  ? (isAnonymous
                      ? "Logged in Anonymously"
                      : "Logged in as\n${user!.email}")
                  : "Not Logged In",
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 20),

            // USER POINTS
            loadingPoints
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      const Text("Total Points:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      Text(
                        totalPoints.toString(),
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ],
                  ),

            const SizedBox(height: 30),
            const Divider(),

            // LOGIN BUTTONS
            if (!isLoggedIn)
              ElevatedButton(
                onPressed: _login,
                child: const Text("Login (Anonymous)"),
              )
            else if (isAnonymous) ...[
              const Text(
                "Login to save your points permanently!",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                child: const Text("Login to Backup"),
              ),

              TextButton(onPressed: _logout, child: const Text("Logout")),
            ] else ...[
              TextButton(onPressed: _logout, child: const Text("Logout")),
            ],

            const Spacer(),
            const Text("SAT Math App",
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// MAIN UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      appBar: AppBar(
        title: const Text("Test Page"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: !autoLoginChecked
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  const Text("SAT Math Test Preparation",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),

                  const SizedBox(height: 10),
                  const Text("Take the test to evaluate your scores!",
                      style: TextStyle(fontSize: 16, color: Colors.black54)),
                  const SizedBox(height: 40),

                  // TEST 1 CARD
                  GestureDetector(
                    onTap: _showTest1Models,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      shadowColor: Colors.greenAccent,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.greenAccent, Colors.green],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: const [
                            Icon(Icons.school,
                                size: 60, color: Colors.white),
                            SizedBox(height: 12),
                            Text("Take Test 1",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 8),
                            Text("Requires 1000 points",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                    fontStyle: FontStyle.italic)),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // TEST 2 CARD
                  GestureDetector(
                    onTap: _showTest2Models,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      shadowColor: Colors.blueAccent,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.lightBlueAccent, Colors.blue],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: const [
                            Icon(Icons.calculate,
                                size: 60, color: Colors.white),
                            SizedBox(height: 12),
                            Text("Take Test 2",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 8),
                            Text("Requires 1000 points",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                    fontStyle: FontStyle.italic)),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),
                  const Center(
                    child: Text("More features coming soon...",
                        style: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
            ),
    );
  }
}
