import 'package:flutter/material.dart';
import 'Quote.dart';

class FavouritesPage extends StatefulWidget {
  FavouritesPage({super.key, required this.favouriteQuotes});

  List<Quote> favouriteQuotes = [];

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
                            fontWeight: FontWeight.bold, color: Colors.pinkAccent, fontSize: 30)),
                  ),
                )
              ]),
              Expanded(
                child: widget.favouriteQuotes.isEmpty
                    ? const Text(
                        "No Favourites yet :)",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.0),
                      )
                    : GridView.builder(
                        itemCount: widget.favouriteQuotes?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 4.0,
                                mainAxisSpacing: 4.0),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(15.0),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "\"${widget.favouriteQuotes?[index].text}\"\n",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 15.0),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 7),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "-${widget.favouriteQuotes?[index].author ?? "unknown"}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
