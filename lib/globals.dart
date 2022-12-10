import 'package:shared_preferences/shared_preferences.dart';
import 'model/Quote.dart';

const QUOTES_KEY = 'quotes_key';

List<Quote> favouriteQuotes = [];

setPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final String encodedQuotes = Quote.encode(favouriteQuotes);
  prefs.setString(QUOTES_KEY, encodedQuotes);
}

loadPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final String? quotesString = prefs.getString(QUOTES_KEY);
  final List<Quote> favouriteQuotesPrefs = Quote.decode(quotesString!);
  favouriteQuotes = favouriteQuotesPrefs;
}