import 'package:flutter/material.dart';
import 'dart:math' as math;

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  final Color randomColor =
  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: randomColor,
          width: double.maxFinite,
          child: Column(
      children: const [Text("data"), Text("data"), Text("data")],
    ),
        ));
  }
}
