import 'package:flutter/material.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise_page.dart';

class TrigonometryHardPage extends StatelessWidget {
  TrigonometryHardPage({super.key});

  final List<String> practiseList =
      List.generate(21, (index) => 'Practise ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry - Hard',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 4,
      ),
      body: ListView.builder(
        itemCount: practiseList.length,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(vertical: 6),
            elevation: 3,
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                practiseList[index],
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
              trailing:
                  const Icon(Icons.arrow_forward_ios, color: Colors.red),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TrigonometryHardPractisePage(
                      jsonFileName: 'practise${index + 1}.json',
                      title: practiseList[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
