import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Get Inspired';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Inspired',

      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text(_title,
              style: GoogleFonts.acme()),
        ),
        body: const MyHomePage(),
      ),
    );
  }
}
