import 'package:flutter/material.dart';
import 'globals.dart';
import 'model/Quote.dart';

class QuoteSlide extends StatefulWidget {
  final Quote quote;
  final Function(Quote) handleFavouriteSelection;
  final Color slideColor;

  const QuoteSlide(
      {super.key,
      required this.quote,
      required this.handleFavouriteSelection,
      required this.slideColor});

  @override
  State<QuoteSlide> createState() => _QuoteSlideState();
}

class _QuoteSlideState extends State<QuoteSlide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.slideColor,
      child: Visibility(
        visible: widget.quote.text.isNotEmpty,
        replacement: const LinearProgressIndicator(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
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
                    Text(
                      "\"${widget.quote.text}\"\n",
                      style:
                          const TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "-${widget.quote.author ?? "unknown"}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),

                        // Button add current quote to favourites list
                        IconButton(
                            onPressed: () {
                              setState(() {
                                widget.handleFavouriteSelection(widget.quote);

                              });
                            },
                            icon: Icon(
                              favouriteQuotes.contains(widget.quote)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 25.0,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
