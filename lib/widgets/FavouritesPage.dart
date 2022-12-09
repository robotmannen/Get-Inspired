import 'package:flutter/material.dart';
import 'package:get_inspired/globals.dart' as globals;

class FavouritesPage extends StatefulWidget {
  FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        width: double.maxFinite,
        child: SafeArea(
          child: Column(
            children: [
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Material(
                      color: Colors.white,
                      shape: const CircleBorder(),
                      child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          enableFeedback: true,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Text("Favourites",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent,
                            fontSize: 30)),
                  ),
                )
              ]),
              Expanded(
                child: globals.favouriteQuotes.isEmpty
                    ? const Text(
                        "No Favourites yet :)",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.0),
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Removed from favourites'),
                                  ),
                                );
                              });
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
                                      "\"${globals.favouriteQuotes[index].text}\"\n",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20.0),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 5),
                                  Text(
                                    "-${globals.favouriteQuotes[index].author ?? "unknown"}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ],
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
