import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sat_math/login/pages/create_page.dart';
import 'package:sat_math/login/pages/forgot_page.dart';
import 'package:sat_math/navigation_button/page/navigation_button_bar_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _loading = false;
  bool _showPassword = false;

  Future<void> login() async {
    setState(() => _loading = true);
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavigationButtonBarPage()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Login Failed"),
          backgroundColor: Colors.redAccent,
        ),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final blue = const Color(0xFF1976D2); // Brand Blue

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
            child: Column(
              children: [
                // Logo
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset(
                      'assets/satmath.jpg',
                      height: 110,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Title
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: blue,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Login to continue your SAT Math practice",
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),

                const SizedBox(height: 35),

                // Glassmorphism card
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.15),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Email field
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(color: blue),
                          prefixIcon: Icon(Icons.email_outlined, color: blue),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blue, width: 1.5),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Password field
                      TextField(
                        controller: passwordController,
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: blue),
                          prefixIcon: Icon(Icons.lock_outline, color: blue),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showPassword ? Icons.visibility : Icons.visibility_off,
                              color: blue,
                            ),
                            onPressed: () {
                              setState(() => _showPassword = !_showPassword);
                            },
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blue, width: 1.5),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Forgot password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const ForgotPage()),
                            );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Login button
                      GestureDetector(
                        onTap: _loading ? null : login,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                blue,
                                blue.withOpacity(0.75),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: blue.withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Center(
                            child: _loading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Sign Up option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CreatePage()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
