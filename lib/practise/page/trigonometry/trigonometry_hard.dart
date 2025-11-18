import 'package:flutter/material.dart';

// Import all 21 Trigonometry Hard practise pages
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise1.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise2.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise3.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise4.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise5.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise6.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise7.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise8.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise9.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise10.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise11.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise12.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise13.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise14.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise15.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise16.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise17.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise18.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise19.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise20.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard/trigonometry_hard_practise21.dart';

class TrigonometryHard extends StatefulWidget {
  const TrigonometryHard({super.key});

  @override
  State<TrigonometryHard> createState() => _TrigonometryHardState();
}

class _TrigonometryHardState extends State<TrigonometryHard> {
  final List<String> practiseList =
      List.generate(21, (index) => 'Practise ${index + 1}');

  // Function to navigate to the respective practise page
  void _navigateToPractisePage(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = const TrigonometryHardPractise1();
        break;
      case 1:
        page = const TrigonometryHardPractise2();
        break;
      case 2:
        page = const TrigonometryHardPractise3();
        break;
      case 3:
        page = const TrigonometryHardPractise4();
        break;
      case 4:
        page = const TrigonometryHardPractise5();
        break;
      case 5:
        page = const TrigonometryHardPractise6();
        break;
      case 6:
        page = const TrigonometryHardPractise7();
        break;
      case 7:
        page = const TrigonometryHardPractise8();
        break;
      case 8:
        page = const TrigonometryHardPractise9();
        break;
      case 9:
        page = const TrigonometryHardPractise10();
        break;
      case 10:
        page = const TrigonometryHardPractise11();
        break;
      case 11:
        page = const TrigonometryHardPractise12();
        break;
      case 12:
        page = const TrigonometryHardPractise13();
        break;
      case 13:
        page = const TrigonometryHardPractise14();
        break;
      case 14:
        page = const TrigonometryHardPractise15();
        break;
      case 15:
        page = const TrigonometryHardPractise16();
        break;
      case 16:
        page = const TrigonometryHardPractise17();
        break;
      case 17:
        page = const TrigonometryHardPractise18();
        break;
      case 18:
        page = const TrigonometryHardPractise19();
        break;
      case 19:
        page = const TrigonometryHardPractise20();
        break;
      case 20:
        page = const TrigonometryHardPractise21();
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
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.red),
              onTap: () => _navigateToPractisePage(context, index),
            ),
          );
        },
      ),
    );
  }
}
