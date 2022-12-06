
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
}
