import 'package:flutter/material.dart';
import 'MainPage.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const GetInspiredApp()));
  runApp(const GetInspiredApp());
}

class GetInspiredApp extends StatelessWidget {
  const GetInspiredApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Inspired',
      home: MainPage(),
    );
  }
}
