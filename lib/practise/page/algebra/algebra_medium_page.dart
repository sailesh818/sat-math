import 'package:flutter/material.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise1.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise2.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise3.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise4.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise5.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise6.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise7.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise8.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise9.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise10.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise11.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise12.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise13.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise14.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise15.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise16.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise17.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise18.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise19.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise20.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium/algebra_medium_practise21.dart';

class AlgebraMediumPage extends StatefulWidget {
  const AlgebraMediumPage({super.key});

  @override
  State<AlgebraMediumPage> createState() => _AlgebraMediumPageState();
}

class _AlgebraMediumPageState extends State<AlgebraMediumPage> {
  final List<String> practiseList =
      List.generate(21, (index) => 'Practise ${index + 1}');

  void _navigateToPractisePage(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = const AlgebraMediumPractise1();
        break;
      case 1:
        page = const AlgebraMediumPractise2();
        break;
      case 2:
        page = const AlgebraMediumPractise3();
        break;
      case 3:
        page = const AlgebraMediumPractise4();
        break;
      case 4:
        page = const AlgebraMediumPractise5();
        break;
      case 5:
        page = const AlgebraMediumPractise6();
        break;
      case 6:
        page = const AlgebraMediumPractise7();
        break;
      case 7:
        page = const AlgebraMediumPractise8();
        break;
      case 8:
        page = const AlgebraMediumPractise9();
        break;
      case 9:
        page = const AlgebraMediumPractise10();
        break;
      case 10:
        page = const AlgebraMediumPractise11();
        break;
      case 11:
        page = const AlgebraMediumPractise12();
        break;
      case 12:
        page = const AlgebraMediumPractise13();
        break;
      case 13:
        page = const AlgebraMediumPractise14();
        break;
      case 14:
        page = const AlgebraMediumPractise15();
        break;
      case 15:
        page = const AlgebraMediumPractise16();
        break;
      case 16:
        page = const AlgebraMediumPractise17();
        break;
      case 17:
        page = const AlgebraMediumPractise18();
        break;
      case 18:
        page = const AlgebraMediumPractise19();
        break;
      case 19:
        page = const AlgebraMediumPractise20();
        break;
      case 20:
        page = const AlgebraMediumPractise21();
        break;
      default:
        page = Scaffold(
          appBar: AppBar(title: const Text('Coming Soon')),
          body: const Center(
              child: Text('This practise page is under development')),
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
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text(
          'Algebra - Medium',
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
                backgroundColor:Colors.blue,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                practiseList[index],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              trailing:
                  Icon(Icons.arrow_forward_ios, color: Colors.blue),
              onTap: () => _navigateToPractisePage(context, index),
            ),
          );
        },
      ),
    );
  }
}
