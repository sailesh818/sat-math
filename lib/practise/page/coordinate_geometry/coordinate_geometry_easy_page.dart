import 'package:flutter/material.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise1.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise10.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise11.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise12.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise13.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise14.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise15.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise16.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise17.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise18.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise19.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise2.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise20.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise21.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise3.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise4.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise5.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise6.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise7.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise8.dart';
import 'package:sat_math/practise/page/coordinate_geometry/cord_geo_easy/coordinate_geometry_easy_practise9.dart';


class CoordinateGeometryEasyPage extends StatefulWidget {
  const CoordinateGeometryEasyPage({super.key});

  @override
  State<CoordinateGeometryEasyPage> createState() => _CoordinateGeometryEasyPageState();
}

class _CoordinateGeometryEasyPageState extends State<CoordinateGeometryEasyPage> {
  final List<String> practiseList =
      List.generate(21, (index) => 'Practise ${index + 1}');

  void _navigateToPractisePage(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = const CoordinateGeometryEasyPractise1();
        break;
      case 1:
        page = const CoordinateGeometryEasyPractise2();
        break;
      case 2:
        page = const CoordinateGeometryEasyPractise3();
        break;
      case 3:
        page = const CoordinateGeometryEasyPractise4();
        break;
      case 4:
        page = const CoordinateGeometryEasyPractise5();
        break;
      case 5:
        page = const CoordinateGeometryEasyPractise6();
        break;
      case 6:
        page = const CoordinateGeometryEasyPractise7();
        break;
      case 7:
        page = const CoordinateGeometryEasyPractise8();
        break;
      case 8:
        page = const CoordinateGeometryEasyPractise9();
        break;
      case 9:
        page = const CoordinateGeometryEasyPractise10();
        break;
      case 10:
        page = const CoordinateGeometryEasyPractise11();
        break;
      case 11:
        page = const CoordinateGeometryEasyPractise12();
        break;
      case 12:
        page = const CoordinateGeometryEasyPractise13();
        break;
      case 13:
        page = const CoordinateGeometryEasyPractise14();
        break;
      case 14:
        page = const CoordinateGeometryEasyPractise15();
        break;
      case 15:
        page = const CoordinateGeometryEasyPractise16();
        break;
      case 16:
        page = const CoordinateGeometryEasyPractise17();
        break;
      case 17:
        page = const CoordinateGeometryEasyPractise18();
        break;
      case 18:
        page = const CoordinateGeometryEasyPractise19();
        break;
      case 19:
        page = const CoordinateGeometryEasyPractise20();
        break;
      case 20:
        page = const CoordinateGeometryEasyPractise21();
        break;
      default:
        page = Scaffold(
          appBar: AppBar(title: const Text('Coming Soon')),
          body: const Center(
            child: Text('This practise page is under development'),
          ),
        );
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text(
          'Coordinate Geometry - Easy',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
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
                backgroundColor: Colors.green,
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
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.green),
              onTap: () => _navigateToPractisePage(context, index),
            ),
          );
        },
      ),
    );
  }
}
