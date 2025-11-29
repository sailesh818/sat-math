import 'package:flutter/material.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise1.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise2.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise3.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise4.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise5.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise6.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise7.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise8.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise9.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise10.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise11.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise12.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise13.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise14.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise15.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise16.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise17.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise18.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise19.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise20.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard/algebra_hard_practise21.dart';

class AlgebraHardPage extends StatefulWidget {
  const AlgebraHardPage({super.key});

  @override
  State<AlgebraHardPage> createState() => _AlgebraHardPageState();
}

class _AlgebraHardPageState extends State<AlgebraHardPage> {
  final List<String> practiseList =
      List.generate(21, (index) => 'Practise ${index + 1}');

  void _navigateToPractisePage(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = const AlgebraHardPractise1();
        break;
      case 1:
        page = const AlgebraHardPractise2();
        break;
      case 2:
        page = const AlgebraHardPractise3();
        break;
      case 3:
        page = const AlgebraHardPractise4();
        break;
      case 4:
        page = const AlgebraHardPractise5();
        break;
      case 5:
        page = const AlgebraHardPractise6();
        break;
      case 6:
        page = const AlgebraHardPractise7();
        break;
      case 7:
        page = const AlgebraHardPractise8();
        break;
      case 8:
        page = const AlgebraHardPractise9();
        break;
      case 9:
        page = const AlgebraHardPractise10();
        break;
      case 10:
        page = const AlgebraHardPractise11();
        break;
      case 11:
        page = const AlgebraHardPractise12();
        break;
      case 12:
        page = const AlgebraHardPractise13();
        break;
      case 13:
        page = const AlgebraHardPractise14();
        break;
      case 14:
        page = const AlgebraHardPractise15();
        break;
      case 15:
        page = const AlgebraHardPractise16();
        break;
      case 16:
        page = const AlgebraHardPractise17();
        break;
      case 17:
        page = const AlgebraHardPractise18();
        break;
      case 18:
        page = const AlgebraHardPractise19();
        break;
      case 19:
        page = const AlgebraHardPractise20();
        break;
      case 20:
        page = const AlgebraHardPractise21();
        break;
      default:
        page = Scaffold(
          appBar: AppBar(title: const Text('Coming Soon')),
          body: const Center(child: Text('This practise page is under development')),
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
      backgroundColor:Colors.red.shade50,
      appBar: AppBar(
        title: const Text(
          'Algebra - Hard',
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
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                practiseList[index],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.red),
              onTap: () => _navigateToPractisePage(context, index),
            ),
          );
        },
      ),
    );
  }
}
