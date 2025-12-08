import 'package:flutter/material.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_hard/coordinate_geometry_hard_practise_page.dart';

class CoordinateGeometryHardPage extends StatelessWidget {
  CoordinateGeometryHardPage({super.key});

  final List<String> practiseList =
      List.generate(21, (index) => 'Practise ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        title: const Text('Coordinate Geometry - Hard'),
        backgroundColor: Colors.red,
        centerTitle: true,
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
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text('${index + 1}', style: const TextStyle(color: Colors.white)),
              ),
              title: Text(practiseList[index]),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.red),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CoordinateGeometryHardPractisePage(
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
