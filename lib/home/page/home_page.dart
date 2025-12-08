import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Algebra pages
import 'package:sat_math/practise/page/algebra/algebra_easy_page.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium_page.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard_page.dart';

// Coordinate Geometry pages
import 'package:sat_math/practise/page/coordinate_geometry/coordinate_geometry_easy_page.dart';
import 'package:sat_math/practise/page/coordinate_geometry/coordinate_geometry_medium_page.dart';
import 'package:sat_math/practise/page/coordinate_geometry/coordinate_geometry_hard_page.dart';

// Probability & Statistics
import 'package:sat_math/practise/page/probability_statistics/probability_statistics_easy.dart';
import 'package:sat_math/practise/page/probability_statistics/probability_statistics_medium.dart';
import 'package:sat_math/practise/page/probability_statistics/probability_statistics_hard.dart';

// Trigonometry
import 'package:sat_math/practise/page/trigonometry/trigonometry_easy.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_medium.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard.dart';

// Geometry
import 'package:sat_math/practise/page/geometry/geometry_easy.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard.dart';

// Functions
import 'package:sat_math/practise/page/functions/functions_easy.dart';
import 'package:sat_math/practise/page/functions/functions_medium.dart';
import 'package:sat_math/practise/page/functions/functions_hard.dart';

// Default
import 'package:sat_math/practise/page/default_practise_page.dart';

// Login Page
import 'package:sat_math/login/pages/login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  int totalPoints = 0;
  bool loadingPoints = true;
  bool autoLoginChecked = false;

  final List<String> topics = [
    'Algebra',
    'Geometry',
    'Probability & Statistics',
    'Trigonometry',
    'Functions',
    'Coordinate Geometry',
  ];

  final List<String> levels = ['Easy', 'Medium', 'Hard'];

  final Map<String, Color> levelColors = {
    'Easy': const Color(0xFF90EE90),
    'Medium': const Color(0xFF32CD32),
    'Hard': const Color(0xFF006400),
  };

  @override
  void initState() {
    super.initState();
    _autoAnonymousLogin();
  }

  /// AUTO LOGIN
  Future<void> _autoAnonymousLogin() async {
    if (user == null) {
      await FirebaseAuth.instance.signInAnonymously();
      user = FirebaseAuth.instance.currentUser;
    }

    autoLoginChecked = true;
    await _loadUserPoints();

    if (mounted) setState(() {});
  }

  /// LOAD POINTS
  Future<void> _loadUserPoints() async {
    if (user == null) return;

    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .get();

      if (doc.exists && doc.data() != null) {
        final data = doc.data() as Map<String, dynamic>;
        totalPoints = data["totalPoints"] ?? 0;
      }
    } catch (e) {}

    loadingPoints = false;
    if (mounted) setState(() {});
  }

  /// LOGIN ANONYMOUS
  Future<void> _login() async {
    await FirebaseAuth.instance.signInAnonymously();
    user = FirebaseAuth.instance.currentUser;

    await _loadUserPoints();
    setState(() {});
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

  /// NAVIGATE
  void _navigateToPage(BuildContext context, String topic, String level) {
    Widget destinationPage;

    switch (topic) {
      case 'Algebra':
        destinationPage = (level == 'Easy')
            ? AlgebraEasyPage()
            : (level == 'Medium')
                ? AlgebraMediumPage()
                : AlgebraHardPage();
        break;

      case 'Probability & Statistics':
        destinationPage = (level == 'Easy')
            ? ProbabilityStatisticsEasyPage()
            : (level == 'Medium')
                ? ProbabilityStatisticsMediumPage()
                : ProbabilityStatisticsHardPage();
        break;

      case 'Trigonometry':
        destinationPage = (level == 'Easy')
            ? TrigonometryEasyPage()
            : (level == 'Medium')
                ? TrigonometryMediumPage()
                : TrigonometryHardPage();
        break;

      case 'Geometry':
        destinationPage = (level == 'Easy')
            ? GeometryEasyPage()
            : (level == 'Medium')
                ? GeometryMediumPage()
                : GeometryHardPage();
        break;

      case 'Functions':
        destinationPage = (level == 'Easy')
            ? FunctionsEasyPage()
            : (level == 'Medium')
                ? FunctionsMediumPage()
                : FunctionsHardPage();
        break;

      case 'Coordinate Geometry':
        destinationPage = (level == 'Easy')
            ? CoordinateGeometryEasyPage()
            : (level == 'Medium')
                ? CoordinateGeometryMediumPage()
                : CoordinateGeometryHardPage();
        break;

      default:
        destinationPage = DefaultPracticePage(topic: topic, level: level);
    }

    Navigator.push(context, MaterialPageRoute(builder: (_) => destinationPage));
  }

  /// DRAWER UI (Same as TestPage)
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

            // POINTS
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

            // LOGIN OPTIONS
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LoginPage()));
                },
                child: const Text("Login to Backup"),
              ),
              TextButton(
                  onPressed: _logout, child: const Text("Logout")),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      appBar: AppBar(
        title: const Text(
          'Practice Topics',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      backgroundColor: Colors.green[50],

      body: !autoLoginChecked
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: topics.map((topic) {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(24)),
                        ),
                        builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: levels.map((level) {
                                return Container(
                                  width: double.infinity,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: levelColors[level],
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _navigateToPage(context, topic, level);
                                    },
                                    child: Text(
                                      level,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.green[400]!, Colors.green[600]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.book,
                              color: Colors.white, size: 32),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              topic,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios,
                              color: Colors.white),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
