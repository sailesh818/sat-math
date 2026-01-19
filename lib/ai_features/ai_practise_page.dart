import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'ai_questions_show.dart';

class AiPractisePage extends StatefulWidget {
  const AiPractisePage({super.key});

  @override
  State<AiPractisePage> createState() => _AiPractisePageState();
}

class _AiPractisePageState extends State<AiPractisePage> {
  String category = "Heart of Algebra";
  String difficulty = "Easy";

  List<Map<String, dynamic>> questions = [];
  List<bool> expanded = [];
  bool loading = false;

  int totalPoints = 0;
  final int requiredPoints = 200;

  @override
  void initState() {
    super.initState();
    _fetchUserPoints();
  }

  // ================= FETCH USER POINTS =================
  Future<void> _fetchUserPoints() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final snap =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    if (snap.exists) {
      setState(() {
        totalPoints = snap.data()?['totalPoints'] ?? 0;
      });
    }
  }

  // ================= DEDUCT POINTS =================
  Future<void> _deductPoints() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection("users").doc(uid).update({
      "totalPoints": FieldValue.increment(-requiredPoints),
    });

    setState(() {
      totalPoints -= requiredPoints;
    });
  }

  // ================= POPUP =================
  void _showGeneratePopup() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Unlock AI Question"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Your Points: $totalPoints",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              totalPoints >= requiredPoints
                  ? "You can generate AI SAT questions now."
                  : "You need at least 200 points to unlock AI features.\nPractice more to earn points.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text("Practice Page"),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AiQuestionsShow(
                    category: category,
                    difficulty: difficulty,
                    title: "Practice & Earn Points",
                  ),
                ),
              );
            },
          ),
          if (totalPoints >= requiredPoints)
            ElevatedButton(
              child: const Text("Generate Now"),
              onPressed: () async {
                Navigator.pop(context);
                await generateSatQuestion();
              },
            ),
        ],
      ),
    );
  }

  // ================= API CALL =================
  Future<void> generateSatQuestion({int attempt = 0}) async {
    if (attempt >= 5) return;

    setState(() => loading = true);

    try {
      final response = await http.post(
        Uri.parse("https://generatesatquestion-sybhmzrvwa-uc.a.run.app/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"category": category, "difficulty": difficulty}),
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        if (decoded.isEmpty || decoded.containsKey("error")) return;

        bool isDuplicate =
            questions.any((q) => q['question'] == decoded['question']);

        if (isDuplicate || (decoded['question'] ?? '').isEmpty) {
          await generateSatQuestion(attempt: attempt + 1);
          return;
        }

        setState(() {
          questions.add(decoded);
          expanded.add(true);
        });

        // 🔥 DEDUCT ONLY AFTER SUCCESS
        await _deductPoints();
      }
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to generate question")),
      );
    } finally {
      setState(() => loading = false);
    }
  }

  // ================= QUESTION CARD (FULL EXPLANATION) =================
  Widget buildQuestionCard(int index, Map<String, dynamic> q) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shadowColor: Colors.green.withOpacity(0.3),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: ListTile(
              title: Text(
                "Practice AI ${index + 1}",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                expanded[index] ? Icons.expand_less : Icons.expand_more,
                color: Colors.white,
              ),
              onTap: () => setState(() => expanded[index] = !expanded[index]),
            ),
          ),

          if (expanded[index])
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// QUESTION
                  Text(
                    q["question"] ?? "",
                    style: const TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 12),

                  /// OPTIONS
                  if ((q["options"] as Map?)?.isNotEmpty == true)
                    ...((q["options"] as Map<String, dynamic>)
                        .entries
                        .map(
                          (e) => Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              "${e.key}) ${e.value}",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        )),

                  const SizedBox(height: 12),

                  /// 💡 HINT
                  if ((q["hint"] ?? "").isNotEmpty)
                    Text(
                      "💡 Hint: ${q['hint']}",
                      style: TextStyle(
                        color: Colors.orange.shade800,
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                  const SizedBox(height: 10),

                  /// ✅ SOLUTION
                  if ((q["solution_steps"] as List?)?.isNotEmpty == true) ...[
                    const Divider(),

                    Text(
                      "✅ Correct Answer: ${q['correct_answer']}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),

                    const SizedBox(height: 6),

                    ...((q["solution_steps"] as List)
                        .map((e) => Text("• $e"))),

                    if ((q["final_explanation"] ?? "").isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(q["final_explanation"]),
                      ),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SAT Math AI Practice"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        elevation: 5,
        shadowColor: Colors.green.withOpacity(0.5),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: category,
              decoration: InputDecoration(
                labelText: "Question Category",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.blue.shade50,
              ),
              items: const [
                "Heart of Algebra",
                "Problem Solving and Data Analysis",
                "Passport to Advanced Math",
                "Geometry and Trigonometry",
              ]
                  .map((e) =>
                      DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) => setState(() => category = value!),
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: difficulty,
              decoration: InputDecoration(
                labelText: "Difficulty Level",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.green.shade50,
              ),
              items: const ["Easy", "Medium", "Hard"]
                  .map((e) =>
                      DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) => setState(() => difficulty = value!),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green.shade700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: loading ? null : _showGeneratePopup,
                child: loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "Generate SAT Question",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
              ),
            ),

            const SizedBox(height: 20),

            if (questions.isEmpty)
              const Center(
                child: Text("No questions generated yet.",
                    style: TextStyle(color: Colors.grey)),
              ),

            ...questions.asMap().entries
                .map((e) => buildQuestionCard(e.key, e.value)),

            const SizedBox(height: 30),

            Divider(color: Colors.grey.shade400),
            const SizedBox(height: 12),

            const Center(
              child: Text(
                "See what others AI SAT practiced",
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.public, color: Colors.blue),
                label: const Text("Explore AI Practice Questions"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AiQuestionsShow(
                        category: category,
                        difficulty: difficulty,
                        title: "Community AI Practice",
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
