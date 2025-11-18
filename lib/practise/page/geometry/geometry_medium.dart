import 'package:flutter/material.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise1.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise2.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise3.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise4.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise5.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise6.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise7.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise8.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise9.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise10.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise11.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise12.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise13.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise14.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise15.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise16.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise17.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise18.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise19.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise20.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium/geometry_medium_practise21.dart';

class GeometryMedium extends StatefulWidget {
  const GeometryMedium({super.key});

  @override
  State<GeometryMedium> createState() => _GeometryMediumState();
}

class _GeometryMediumState extends State<GeometryMedium> {
  final List<String> practiseList =
      List.generate(21, (index) => 'Practise ${index + 1}');

  void _navigateToPractisePage(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = const GeometryMediumPractise1();
        break;
      case 1:
        page = const GeometryMediumPractise2();
        break;
      case 2:
        page = const GeometryMediumPractise3();
        break;
      case 3:
        page = const GeometryMediumPractise4();
        break;
      case 4:
        page = const GeometryMediumPractise5();
        break;
      case 5:
        page = const GeometryMediumPractise6();
        break;
      case 6:
        page = const GeometryMediumPractise7();
        break;
      case 7:
        page = const GeometryMediumPractise8();
        break;
      case 8:
        page = const GeometryMediumPractise9();
        break;
      case 9:
        page = const GeometryMediumPractise10();
        break;
      case 10:
        page = const GeometryMediumPractise11();
        break;
      case 11:
        page = const GeometryMediumPractise12();
        break;
      case 12:
        page = const GeometryMediumPractise13();
        break;
      case 13:
        page = const GeometryMediumPractise14();
        break;
      case 14:
        page = const GeometryMediumPractise15();
        break;
      case 15:
        page = const GeometryMediumPractise16();
        break;
      case 16:
        page = const GeometryMediumPractise17();
        break;
      case 17:
        page = const GeometryMediumPractise18();
        break;
      case 18:
        page = const GeometryMediumPractise19();
        break;
      case 19:
        page = const GeometryMediumPractise20();
        break;
      case 20:
        page = const GeometryMediumPractise21();
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
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text(
          'Geometry - Medium',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
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
                backgroundColor: Colors.orange,
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
                  const Icon(Icons.arrow_forward_ios, color: Colors.orange),
              onTap: () => _navigateToPractisePage(context, index),
            ),
          );
        },
      ),
    );
  }
}
