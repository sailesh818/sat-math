import 'package:flutter/material.dart';
import 'package:sat_math/home/page/home_page.dart';
import 'package:sat_math/testpage/page/test_page.dart';

// Navigation Page with Bottom Navigation Bar
class NavigationButtonBarPage extends StatefulWidget {
  const NavigationButtonBarPage({super.key});

  @override
  State<NavigationButtonBarPage> createState() =>
      _NavigationButtonBarPageState();
}

class _NavigationButtonBarPageState extends State<NavigationButtonBarPage> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    TestPage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Learn"),
        ],
      ),
    );
  }
}
