import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const Motchi());
}

class Motchi extends StatelessWidget {
  const Motchi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepOrange,
      ),
      home: const HomePage(),
    );
  }
}
