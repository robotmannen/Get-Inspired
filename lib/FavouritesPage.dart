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
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                        decoration: const BoxDecoration(shape: BoxShape.circle,
                        color: Colors.white),
                        child: const Icon(Icons.arrow_back))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
