import 'dart:convert';

import 'package:covid_refreshed/core/models/daily_cases_data.dart';
import 'package:http/http.dart' as http;

Future<DailyCasesApiData> fetchDailyData() async {
  http.Response response =
      await http.get('https://api.covid19india.org/data.json');

  final data = json.decode(response.body);
  //print(data.toString());
  return DailyCasesApiData.fromJson(data);
}
