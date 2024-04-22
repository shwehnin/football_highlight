import 'package:flutter/material.dart';
import 'package:football_highlight/app/pages/home_page.dart';

void main() {
  runApp(
    const FootballHighlight(),
  );
}

class FootballHighlight extends StatelessWidget {
  const FootballHighlight({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
