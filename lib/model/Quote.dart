import 'dart:convert';

class Quote {
  Quote({
    required this.text,
    required this.author,
  });

  String text;
  String? author;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    text: json["text"],
    author: json["author"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "author": author,
  };

  static Map<String, String?> toMap(Quote quote) => {
    'text': quote.text,
    'rating': quote.author,

  };

  static String encode(List<Quote> quotes) => json.encode(
    quotes
        .map<Map<String, String?>>((quote) => Quote.toMap(quote))
        .toList(),
  );

  static List<Quote> decode(String quotes) =>
      (json.decode(quotes) as List<dynamic>)
          .map<Quote>((item) => Quote.fromJson(item))
          .toList();
}
