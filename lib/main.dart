import 'package:flutter/material.dart';
import 'package:flutter_application_1/PlanesPages/planesSectionPage.dart';
import 'LinesPages/linesSectionPage.dart';

void main() {
  runApp(BilingualMathGeo());
}

class BilingualMathGeo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExploraGeometría - Explore Geometry',
      theme: ThemeData(
        primaryColor: Color(0xFFFBDAB),
      ),
      home: BilingualMathGeoHomePage(),
    );
  }
}

class BilingualMathGeoHomePage extends StatelessWidget {
  final int initialLives = 20;
  final int initialPoints = 0;
  final int totalLevels = 5; // Changed to 5 levels

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('ExploraGeometría - Explore Geometry')),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite),
                Text(
                  '$initialLives',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings page
            },
          ),
        ],
      ),
      body: Center(
        child: Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(20.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
            ),
            itemCount: totalLevels,
            itemBuilder: (context, index) {
              int levelNumber = index + 1;
              return GestureDetector(
                onTap: () {
                // Check if the shape is "Lines"
                if (_getShapeForLevel(levelNumber) == 'Lines') {
                  // Navigate to PAGE2.dart if it's "Lines"
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LinesSectionsPage()), // Navigate to PAGE2.dart
                  );
                }
                else if (_getShapeForLevel(levelNumber) == 'Planes') {
        // Navigate to PAGE2.dart if it's "Planes"
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlanesSectionsPage()), // Navigate to PAGE2.dart
        );
      }
              },
              
                child: Container(
                  decoration: BoxDecoration(
                    color: _getColorForLevel(levelNumber),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      _getShapeForLevel(levelNumber),
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.map),
              color: Colors.white,
              onPressed: () {
                // Navigate to map page
              },
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorForLevel(int levelNumber) {
    // Return a different color for each level
    switch (levelNumber) {
      case 1:
        return Colors.red; // Lines
      case 2:
        return Colors.blue; // Planes
      case 3:
        return Colors.green; // Angles
      case 4:
        return Colors.orange; // Triangle
      case 5:
        return Colors.purple; // Quadrilateral
      default:
        return Colors.grey;
    }
  }

  String _getShapeForLevel(int levelNumber) {
    // Return a different shape name for each level
    switch (levelNumber) {
      case 1:
        return 'Lines';
      case 2:
        return 'Planes';
      case 3:
        return 'Angles';
      case 4:
        return 'Triangle';
      case 5:
        return 'Quadrilateral';
      default:
        return '';
    }
  }
}

class LevelPage extends StatelessWidget {
  final int levelNumber;

  LevelPage(this.levelNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level $levelNumber'),
      ),
      body: Center(
        child: Text(
          'This is Level $levelNumber',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
