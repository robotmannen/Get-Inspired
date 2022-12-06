import 'dart:math';

import 'package:flutter/material.dart';

import 'Quote.dart';
import 'RemoteService.dart';

class QuoteSlide extends StatefulWidget {
  Quote quote;

  QuoteSlide({super.key, required this.quote});

  @override
  State<QuoteSlide> createState() => _QuoteSlideState();
}

class _QuoteSlideState extends State<QuoteSlide> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.quote.text ?? "",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "-${widget.quote.author}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
