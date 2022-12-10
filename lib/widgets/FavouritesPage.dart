import 'package:flutter/material.dart';
import 'package:get_inspired/FullscreenFavouriteQuote.dart';
import 'package:get_inspired/globals.dart' as globals;

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Stack(children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      enableFeedback: true,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
                const Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Text("Favourites",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                          fontSize: 30)),
                ),
              ]),
              Expanded(
                child: globals.favouriteQuotes.isEmpty
                    ? const Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          "No Favourites yet :)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      )
                    : GridView.builder(
                        itemCount: globals.favouriteQuotes.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 4.0,
                                mainAxisSpacing: 4.0),
                        itemBuilder: (context, index) {
                          return Dismissible(
                            direction: DismissDirection.endToStart,
                            key: UniqueKey(),
                            background: Stack(children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                              ),
                              const Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: Icon(Icons.delete,
                                    color: Colors.white, size: 60.0),
                              )
                            ]),
                            onDismissed: (direction) {
                              setState(() {
                                globals.favouriteQuotes.removeAt(index);
                                globals.setPrefs();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Removed from favourites'),
                                  ),
                                );
                              });
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FullscreenFavouriteQuote(
                                            quote:
                                                globals.favouriteQuotes[index]),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "\"${globals.favouriteQuotes[index].text}\"",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4),
                                    Text(
                                      "\n-${globals.favouriteQuotes[index].author ?? "unknown"}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
