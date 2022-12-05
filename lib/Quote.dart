
class Quote {
  Quote({
    required this.q,
    required this.a,
  });

  String q;
  String a;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    q: json["q"],
    a: json["a"],
  );

  Map<String, dynamic> toJson() => {
    "q": q,
    "a": a,
  };
}
