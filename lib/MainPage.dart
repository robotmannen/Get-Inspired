import 'package:flutter/material.dart';
import 'package:get_inspired/QuoteSlide.dart';
import 'package:get_inspired/widgets/TitleWidget.dart';
import 'globals.dart';
import 'widgets/FavouritesPage.dart';
import 'model/Quote.dart';
import 'network/RemoteService.dart';
import 'globals.dart' as globals;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController controller = PageController();

  List<Quote>? quotes;
  bool isLoaded = false;
  var counterColor = 0;

  @override
  void initState() {
    super.initState();

    _getQuotes();
    globals.loadPrefs();
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
    globals.setPrefs();
  }

  Color _getSlideColor() {
    final List<Color> slideColors = [
      Colors.pink,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.amber,
      Colors.cyan
    ];

    if (counterColor == 5) {
      counterColor = 0;
    } else {
      counterColor++;
    }
    return slideColors[counterColor];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,

      // FAB onPress navigates to favourites page
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.greenAccent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavouritesPage()),
            ).then((value) => {
                  setState(() {
                    counterColor--;
                    globals.setPrefs();
                  })
                });
          },
          child: const Icon(
            Icons.favorite,
            color: Colors.pinkAccent,
          )),
      body: Stack(children: [
        // enerates a new page for new quote
        PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: quotes?.length,
          itemBuilder: (context, index) {
            return QuoteSlide(
              slideColor: _getSlideColor(),
              quote: quotes?[index] ?? Quote(text: "", author: ""),
              handleFavouriteSelection: (Quote quote) =>
                  _handleFavouriteButton(quote),
            );
          },
        ),
        const SafeArea(child: TitleWidget())
      ]),
    );
  }
}
