import 'package:flutter/material.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise1.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise2.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise3.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise4.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise5.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise6.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise7.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise8.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise9.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise10.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise11.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise12.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise13.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise14.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise15.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise16.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise17.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise18.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise19.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise20.dart';
import 'package:sat_math/practise/page/functions/functions_medium/functions_medium_practise21.dart';

class FunctionsMedium extends StatefulWidget {
  const FunctionsMedium({super.key});

  @override
  State<FunctionsMedium> createState() => _FunctionsMediumState();
}

class _FunctionsMediumState extends State<FunctionsMedium> {
  final List<String> practiseList =
      List.generate(21, (index) => 'Practise ${index + 1}');

  void _navigateToPractisePage(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = const FunctionsMediumPractise1();
        break;
      case 1:
        page = const FunctionsMediumPractise2();
        break;
      case 2:
        page = const FunctionsMediumPractise3();
        break;
      case 3:
        page = const FunctionsMediumPractise4();
        break;
      case 4:
        page = const FunctionsMediumPractise5();
        break;
      case 5:
        page = const FunctionsMediumPractise6();
        break;
      case 6:
        page = const FunctionsMediumPractise7();
        break;
      case 7:
        page = const FunctionsMediumPractise8();
        break;
      case 8:
        page = const FunctionsMediumPractise9();
        break;
      case 9:
        page = const FunctionsMediumPractise10();
        break;
      case 10:
        page = const FunctionsMediumPractise11();
        break;
      case 11:
        page = const FunctionsMediumPractise12();
        break;
      case 12:
        page = const FunctionsMediumPractise13();
        break;
      case 13:
        page = const FunctionsMediumPractise14();
        break;
      case 14:
        page = const FunctionsMediumPractise15();
        break;
      case 15:
        page = const FunctionsMediumPractise16();
        break;
      case 16:
        page = const FunctionsMediumPractise17();
        break;
      case 17:
        page = const FunctionsMediumPractise18();
        break;
      case 18:
        page = const FunctionsMediumPractise19();
        break;
      case 19:
        page = const FunctionsMediumPractise20();
        break;
      case 20:
        page = const FunctionsMediumPractise21();
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
      backgroundColor: Colors.deepOrange.shade50,
      appBar: AppBar(
        title: const Text(
          'Functions - Medium',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
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
                backgroundColor: Colors.deepOrange,
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
                  const Icon(Icons.arrow_forward_ios, color: Colors.deepOrange),
              onTap: () => _navigateToPractisePage(context, index),
            ),
          );
        },
      ),
    );
  }
}
