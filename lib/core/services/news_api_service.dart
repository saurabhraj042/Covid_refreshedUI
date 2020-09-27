import 'dart:convert';
import 'package:covid_refreshed/core/models/models.dart';
import 'package:http/http.dart' as http;

Future<News> getNews() async {
  http.Response response = await http.get(
      "https://newsapi.org/v2/everything?q=COVID&apiKey=ce3d2d77c6cd4de5b00f3b79b6e1a712");
  var data = json.decode(response.body);
  return News.fromJson(data);
}
