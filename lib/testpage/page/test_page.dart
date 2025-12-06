import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sat_math/login/pages/login_page.dart';

// Import Test 1 Pages
import 'package:sat_math/testpage/test1/page/test1model1_page.dart';
import 'package:sat_math/testpage/test1/page/test1model2_page.dart';

// Import Test 2 Pages
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
      // handle errors silently
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

  // Navigation
  void _goToTest1Model1() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const Test1model1Page()));
  }

  void _goToTest1Model2() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const Test1model2Page()));
  }

  void _goToTest2Model1() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const Test2Model1Page()));
  }

  void _goToTest2Model2() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const Test2Model2Page()));
  }

  // Bottom Sheet
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
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
        _goToTest1Model1,
        _goToTest1Model2,
      ),
    );
  }

  void _showTest2Models() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _modelSheet(
        "Test 2 Models",
        _goToTest2Model1,
        _goToTest2Model2,
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

              // ⭐ Navigate to Login Page
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

                  const SizedBox(height: 20),
                  const Text("Take the test to evaluate your scores!",
                      style: TextStyle(fontSize: 16, color: Colors.black54)),
                  const SizedBox(height: 40),

                  // TEST 1 CARD
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          const Text("Take Test 1",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green)),
                          const SizedBox(height: 24),
                          ElevatedButton(
                              onPressed: _showTest1Models,
                              child: const Text("Take Test")),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // TEST 2 CARD
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          const Text("Take Test 2",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue)),
                          const SizedBox(height: 24),
                          ElevatedButton(
                              onPressed: _showTest2Models,
                              child: const Text("Take Test")),
                        ],
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
