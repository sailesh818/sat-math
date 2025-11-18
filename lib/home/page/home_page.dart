import 'package:flutter/material.dart';

// Algebra pages
import 'package:sat_math/practise/page/algebra/algebra_easy_page.dart';
import 'package:sat_math/practise/page/algebra/algebra_medium_page.dart';
import 'package:sat_math/practise/page/algebra/algebra_hard_page.dart';
import 'package:sat_math/practise/page/coordinate_geometry/coordinate_geometry_easy_page.dart';
import 'package:sat_math/practise/page/coordinate_geometry/coordinate_geometry_hard_page.dart';
import 'package:sat_math/practise/page/coordinate_geometry/coordinate_geometry_medium_page.dart';

// Probability & Statistics pages
import 'package:sat_math/practise/page/probability_statistics/probability_statistics_easy.dart';
import 'package:sat_math/practise/page/probability_statistics/probability_statistics_medium.dart';
import 'package:sat_math/practise/page/probability_statistics/probability_statistics_hard.dart';

// Trigonometry pages
import 'package:sat_math/practise/page/trigonometry/trigonometry_easy.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_medium.dart';
import 'package:sat_math/practise/page/trigonometry/trigonometry_hard.dart';

// Geometry pages
import 'package:sat_math/practise/page/geometry/geometry_easy.dart';
import 'package:sat_math/practise/page/geometry/geometry_medium.dart';
import 'package:sat_math/practise/page/geometry/geometry_hard.dart';

// Functions pages
import 'package:sat_math/practise/page/functions/functions_easy.dart';
import 'package:sat_math/practise/page/functions/functions_medium.dart';
import 'package:sat_math/practise/page/functions/functions_hard.dart';

// Default practise page for any missing
import 'package:sat_math/practise/page/default_practise_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> topics = [
    'Algebra',
    'Geometry',
    'Probability & Statistics',
    'Trigonometry',
    'Functions',
    'Coordinate Geometry',
  ];

  final List<String> levels = ['Easy', 'Medium', 'Hard'];

  final Map<String, Color> levelColors = {
    'Easy': const Color(0xFF90EE90),
    'Medium': const Color(0xFF32CD32),
    'Hard': const Color(0xFF006400),
  };

  void _navigateToPage(BuildContext context, String topic, String level) {
    Widget destinationPage;

    switch (topic) {
      case 'Algebra':
        if (level == 'Easy') {
          destinationPage = const AlgebraEasyPage();
        } else if (level == 'Medium') {
          destinationPage = const AlgebraMediumPage();
        } else {
          destinationPage = const AlgebraHardPage();
        }
        break;

      case 'Probability & Statistics':
        if (level == 'Easy') {
          destinationPage = const ProbabilityStatisticsEasy();
        } else if (level == 'Medium') {
          destinationPage = const ProbabilityStatisticsMedium();
        } else {
          destinationPage = const ProbabilityStatisticsHard();
        }
        break;

      case 'Trigonometry':
        if (level == 'Easy') {
          destinationPage = const TrigonometryEasy();
        } else if (level == 'Medium') {
          destinationPage = const TrigonometryMedium();
        } else {
          destinationPage = const TrigonometryHard();
        }
        break;

      case 'Geometry':
        if (level == 'Easy') {
          destinationPage = const GeometryEasy();
        } else if (level == 'Medium') {
          destinationPage = const GeometryMedium();
        } else {
          destinationPage = const GeometryHard();
        }
        break;

      case 'Functions':
        if (level == 'Easy') {
          destinationPage = const FunctionsEasy();
        } else if (level == 'Medium') {
          destinationPage = const FunctionsMedium();
        } else {
          destinationPage = const FunctionsHard();
        }
        break;

      case 'Coordinate Geometry':
        if (level == 'Easy') {
          destinationPage = const CoordinateGeometryEasyPage();
        } else if (level == 'Medium') {
          destinationPage = const CoordinateGeometryMediumPage();
        } else {
          destinationPage = const CoordinateGeometryHardPage();
        }
        break;

      default:
        destinationPage = DefaultPracticePage(topic: topic, level: level);
        break;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => destinationPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Practice Topics',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[700], // Green shade for AppBar
        centerTitle: true,
      ),
      backgroundColor: Colors.green[50], // Light green background
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: topics.map((topic) {
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: levels.map((level) {
                          return Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: levelColors[level],
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                _navigateToPage(context, topic, level);
                              },
                              child: Text(
                                level,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green[400]!, Colors.green[600]!], // Gradient of green shades
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.book, color: Colors.white, size: 32),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        topic,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
