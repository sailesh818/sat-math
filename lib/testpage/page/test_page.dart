import 'package:flutter/material.dart';
import 'package:sat_math/testpage/test1/page/test1model1_page.dart'; // Import Test1model1Page
import 'package:sat_math/testpage/test1/page/test1model2_page.dart'; // Import Test1model2Page

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // Function to navigate to Model 1 Page
  void _goToModel1Page() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const Test1model1Page()),
    );
  }

  // Function to navigate to Model 2 Page
  void _goToModel2Page() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const Test1model2Page()),
    );
  }

  // Function to show modal with test options
  void _showTestOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow modal to take full height
      backgroundColor: Colors.transparent, // Transparent background for the modal
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Model 1 Button
              ElevatedButton(
                onPressed: _goToModel1Page,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Model 1",
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),

              // Model 2 Button
              ElevatedButton(
                onPressed: _goToModel2Page,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Model 2",
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Page"),
        backgroundColor: Colors.green, // Green color for app bar
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100], // Light background for the page
      body: SingleChildScrollView( // Make the body scrollable
        padding: const EdgeInsets.all(16), // Added padding to the main body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Heading Text
            const Text(
              "SAT Math Test Preparation",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green, // Green color for heading
              ),
            ),

            const SizedBox(height: 20),

            // Information Text
            const Text(
              "Take the test to evaluate your scores and get ready for SAT preparation!",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 40),

            // Card for Test Options
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.green[50], // Light green background
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Choose your test model to get started",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    // Start Test Button
                    ElevatedButton(
                      onPressed: () => _showTestOptions(context), // Show options when pressed
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Start Test",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 50), // Add space for future content or actions

            // Footer Section (Optional - Placeholder for future use)
            const Align(
              alignment: Alignment.center,
              child: Text(
                "More features coming soon...",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
