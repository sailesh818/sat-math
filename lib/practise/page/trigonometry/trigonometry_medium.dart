import 'package:flutter/material.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_medium/trigonometry_medium_practise_page.dart';

class TrigonometryMediumPage extends StatelessWidget {
  TrigonometryMediumPage({super.key});

  final List<String> practiseList =
      List.generate(21, (index) => 'Practise ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text(
          'Trigonometry - Medium',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
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
                backgroundColor: Colors.blue,
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
                  const Icon(Icons.arrow_forward_ios, color: Colors.blue),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TrigonometryMediumPractisePage(
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
