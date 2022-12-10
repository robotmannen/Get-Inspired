import 'package:flutter/material.dart';

import 'model/Quote.dart';

class FullscreenFavouriteQuote extends StatelessWidget {
  FullscreenFavouriteQuote({Key? key, required this.quote}) : super(key: key);

  Quote quote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: IconButton(
                            iconSize: 20,
                            icon: const Icon(Icons.close),
                            enableFeedback: true,
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      Text(
                        "\"${quote.text}\"\n",
                        style: const TextStyle(
                            color: Colors.black, fontSize: 20.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "-${quote.author ?? "unknown"}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
