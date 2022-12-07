import 'package:flutter/material.dart';
import 'package:get_inspired/QuoteSlide.dart';
import 'FavouritesPage.dart';
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FavouritesPage()),
            );
          }, child: const Icon(Icons.favorite)),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: quotes?.length,
        itemBuilder: (context, index) {
          return QuoteSlide(
            quote: quotes?[index] ?? Quote(text: "", author: ""),
          );
        },
      ),
    );
  }
}
