import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_inspired/Quote.dart';

class RemoteService {
  List<Quote> quoteFromJson(String str) => List<Quote>.from(json.decode(str).map((x) => Quote.fromJson(x)));

  String quoteToJson(List<Quote> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  Future<List<Quote>?> fetchQuotes({required String endpoint}) async {
    var client = http.Client();

    var baseUri = Uri.parse('https://zenquotes.io/api$endpoint');

    var response = await client.get(baseUri);
    if (response.statusCode == 200) {
      var json = response.body;
      return quoteFromJson(json);
    }
    return null;
  }
}



