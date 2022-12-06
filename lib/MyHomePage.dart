import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get_inspired/QuoteSlide.dart';
import 'Quote.dart';
import 'RemoteService.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController controller = PageController();

  List<Quote>? quotes;
  Quote? currentQuote;

  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getQuotes();
  }

  getQuotes() async {
    quotes = await RemoteService().fetchQuotes();
    quotes?.shuffle();
    if (quotes != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: quotes?.length,
      itemBuilder: (context, index) {
        return QuoteSlide(
          quote: quotes?[index] ?? Quote(text: "", author: ""),
        );
      },
    );
  }
}
