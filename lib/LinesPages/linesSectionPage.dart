import 'package:flutter/material.dart';
import 'linesIntroductionPage.dart';
import 'linesPracticePage.dart';
import 'linesQuiz.dart';
import '../main.dart';

void main() {
  runApp(LinesSections());
}

class LinesSections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sections Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LinesSectionsPage(),
    );
  }
}

class LinesSectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lines Sections'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Add back arrow icon
          onPressed: () {
            Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BilingualMathGeoHomePage()), // Navigate back to PAGE2.dart
                ); // Navigate back when arrow is pressed
              },
            ),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SectionItem(
            title: 'QUIZ',
            color: Colors.blue,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LineFinalQuizApp()),
              );
            },
          ),
          SectionItem(
            title: 'LEARN',
            color: Colors.green,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LinesIntroductionPage()), // Navigate to PAGE2.dart
              );
            },
          ),
          SectionItem(
            title: 'PRACTICE',
            color: Colors.orange,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LinesPracticeQuiz()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SectionItem extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;

  const SectionItem({
    Key? key,
    required this.title,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: color,
            padding: EdgeInsets.all(20.0),
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Page'),
      ),
      body: Center(
        child: const Text('Quiz Page Content'),
      ),
    );
  }
}

class LearnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Page'),
      ),
      body: Center(
        child: const Text('Learn Page Content'),
      ),
    );
  }
}

class PracticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Page'),
      ),
      body: Center(
        child: const Text('Practice Page Content'),
      ),
    );
  }
}