import 'package:flutter/material.dart';
import 'package:get_inspired/Quote.dart';
import 'package:get_inspired/RemoteService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Inspired',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Get Inspired'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Quote>? quotes;

  String quoteOfTheDayEndpoint = "/today";
  String allQuotesEndpoint = "/quotes";

  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getManyQuotes(quoteOfTheDayEndpoint);
  }

  getManyQuotes(String endpoint) async {
    quotes = await RemoteService().fetchQuotes(endpoint: endpoint);
    if (quotes != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Row(children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(color: Colors.yellow),
                child: const Text(
                  "Random Quote",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                  fontSize: 20.0),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(color: Colors.cyan),
                child: const Text(
                  "Quote of The Day",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink,
                  fontSize: 20.0),
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Visibility(
              visible: isLoaded,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quotes?.first.q ?? "Not yet",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(
                      '-${quotes?.first.a}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
