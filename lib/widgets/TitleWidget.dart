import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container( 
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.greenAccent,
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Get Inspired",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent
              ),
            ),
          ),
        ),
      ),
    );
  }
}
