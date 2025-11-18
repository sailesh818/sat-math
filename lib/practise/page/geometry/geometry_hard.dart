import 'package:flutter/material.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise1.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise2.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise3.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise4.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise5.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise6.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise7.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise8.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise9.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise10.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise11.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise12.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise13.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise14.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise15.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise16.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise17.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise18.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise19.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise20.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard/geometry_hard_practise21.dart';

class GeometryHard extends StatefulWidget {
  const GeometryHard({super.key});

  @override
  State<GeometryHard> createState() => _GeometryHardState();
}

class _GeometryHardState extends State<GeometryHard> {
  final List<String> practiseList =
      List.generate(21, (index) => 'Practise ${index + 1}');

  void _navigateToPractisePage(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = const GeometryHardPractise1();
        break;
      case 1:
        page = const GeometryHardPractise2();
        break;
      case 2:
        page = const GeometryHardPractise3();
        break;
      case 3:
        page = const GeometryHardPractise4();
        break;
      case 4:
        page = const GeometryHardPractise5();
        break;
      case 5:
        page = const GeometryHardPractise6();
        break;
      case 6:
        page = const GeometryHardPractise7();
        break;
      case 7:
        page = const GeometryHardPractise8();
        break;
      case 8:
        page = const GeometryHardPractise9();
        break;
      case 9:
        page = const GeometryHardPractise10();
        break;
      case 10:
        page = const GeometryHardPractise11();
        break;
      case 11:
        page = const GeometryHardPractise12();
        break;
      case 12:
        page = const GeometryHardPractise13();
        break;
      case 13:
        page = const GeometryHardPractise14();
        break;
      case 14:
        page = const GeometryHardPractise15();
        break;
      case 15:
        page = const GeometryHardPractise16();
        break;
      case 16:
        page = const GeometryHardPractise17();
        break;
      case 17:
        page = const GeometryHardPractise18();
        break;
      case 18:
        page = const GeometryHardPractise19();
        break;
      case 19:
        page = const GeometryHardPractise20();
        break;
      case 20:
        page = const GeometryHardPractise21();
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
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        title: const Text(
          'Geometry - Hard',
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
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.red),
              onTap: () => _navigateToPractisePage(context, index),
            ),
          );
        },
      ),
    );
  }
}
