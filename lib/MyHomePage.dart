import 'package:flutter/material.dart';
import 'package:get_inspired/QuoteSlide.dart';
import 'package:get_inspired/widgets/TitleWidget.dart';
import 'globals.dart';
import 'widgets/FavouritesPage.dart';
import 'model/Quote.dart';
import 'network/RemoteService.dart';
import 'globals.dart' as globals;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController controller = PageController();

  List<Quote>? quotes;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    _getQuotes();
  }

  _getQuotes() async {
    quotes = await RemoteService().fetchQuotes();
    quotes?.shuffle();
    if (quotes != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  _handleFavouriteButton(Quote quote) {
    //Checks for duplicates
    var result = globals.favouriteQuotes.where((element) =>
        element.text == quote.text && element.author == quote.author);

    //adds when no duplicates are found, and removes when un-favourited
    if (result.isEmpty) {
      globals.favouriteQuotes.add(quote);
    } else if (favouriteQuotes.contains(quote)) {
      globals.favouriteQuotes
          .removeWhere((element) => element.text == quote.text);
    }
  }

  var counter = 0;

  Color _getSlideColor() {
    final List<Color> slideColors = [
      Colors.pink,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.amber,
      Colors.cyan
    ];

    if (counter == 5) {
      counter = 0;
    } else {
      counter++;
    }
    return slideColors[counter];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.greenAccent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavouritesPage()),
            ).then((value) => { setState(() {
            }) });
          },
          child: const Icon(
            Icons.favorite,
            color: Colors.pinkAccent,
          )),
      body: Stack(children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: quotes?.length,
          itemBuilder: (context, index) {
            return QuoteSlide(
              slideColor: _getSlideColor(),
              quote: quotes?[index] ?? Quote(text: "", author: ""),
              onFavouriteSelected: (Quote quote) =>
                  _handleFavouriteButton(quote),
            );
          },
        ),
        const SafeArea(child: TitleWidget())
      ]),
    );
  }
}
