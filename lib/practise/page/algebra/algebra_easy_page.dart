import 'package:flutter/material.dart';

// Import all 21 practise pages
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise1.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise2.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise3.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise4.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise5.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise6.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise7.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise8.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise9.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise10.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise11.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise12.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise13.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise14.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise15.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise16.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise17.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise18.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise19.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise20.dart';
import 'package:sat_math/practise/page/algebra/algebra_easy/algebra_easy_practise21.dart';

class AlgebraEasyPage extends StatefulWidget {
  const AlgebraEasyPage({super.key});

  @override
  State<AlgebraEasyPage> createState() => _AlgebraEasyPageState();
}

class _AlgebraEasyPageState extends State<AlgebraEasyPage> {
  final List<String> practiseList =
      List.generate(21, (index) => 'Practise ${index + 1}');

  // Function to navigate to the respective page
  void _navigateToPractisePage(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = const AlgebraEasyPractise1();
        break;
      case 1:
        page = const AlgebraEasyPractise2();
        break;
      case 2:
        page = const AlgebraEasyPractise3();
        break;
      case 3:
        page = const AlgebraEasyPractise4();
        break;
      case 4:
        page = const AlgebraEasyPractise5();
        break;
      case 5:
        page = const AlgebraEasyPractise6();
        break;
      case 6:
        page = const AlgebraEasyPractise7();
        break;
      case 7:
        page = const AlgebraEasyPractise8();
        break;
      case 8:
        page = const AlgebraEasyPractise9();
        break;
      case 9:
        page = const AlgebraEasyPractise10();
        break;
      case 10:
        page = const AlgebraEasyPractise11();
        break;
      case 11:
        page = const AlgebraEasyPractise12();
        break;
      case 12:
        page = const AlgebraEasyPractise13();
        break;
      case 13:
        page = const AlgebraEasyPractise14();
        break;
      case 14:
        page = const AlgebraEasyPractise15();
        break;
      case 15:
        page = const AlgebraEasyPractise16();
        break;
      case 16:
        page = const AlgebraEasyPractise17();
        break;
      case 17:
        page = const AlgebraEasyPractise18();
        break;
      case 18:
        page = const AlgebraEasyPractise19();
        break;
      case 19:
        page = const AlgebraEasyPractise20();
        break;
      case 20:
        page = const AlgebraEasyPractise21();
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
          'Algebra - Easy',
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
