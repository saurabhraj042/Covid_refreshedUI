import 'dart:convert';
import 'package:covid_refreshed/core/models/models.dart';
import 'package:http/http.dart' as http;

Future<IndiaData> fetchIndiaData() async {
  http.Response responseFromAPI =
      await http.get('https://corona.lmao.ninja/v2/countries/IND');

  if (responseFromAPI.statusCode == 200) {
    print("--status 200 ---fetchIndiaData()");
    Map decodedJsonData = json.decode(responseFromAPI.body);
    final String updated = decodedJsonData['updated'].toString();
    final String country = decodedJsonData['country'].toString();
    final String countryInfo = decodedJsonData['countryInfo'].toString();
    final String cases = decodedJsonData['cases'].toString();
    final String todayCases = decodedJsonData['todayCases'].toString();
    final String deaths = decodedJsonData['deaths'].toString();
    final String todayDeaths = decodedJsonData['todayDeaths'].toString();
    final String recovered = decodedJsonData['recovered'].toString();
    final String todayRecovered = decodedJsonData['todayRecovered'].toString();
    final String active = decodedJsonData['active'].toString();
    final String gcritical = decodedJsonData['gcritical'].toString();
    final String casesPerOneMillion = decodedJsonData['casesPerOneMillion'].toString();
    final String deathsPerOneMillion = decodedJsonData['deathsPerOneMillion'].toString();
    final String tests = decodedJsonData['tests'].toString();
    final String testsPerOneMillion = decodedJsonData['testsPerOneMillion'].toString();
    final String population = decodedJsonData['population'].toString();
    final String continent = decodedJsonData['continent'].toString();
    final String oneCasePerPeople = decodedJsonData['oneCasePerPeople'].toString();
    final String oneDeathPerPeople = decodedJsonData['oneDeathPerPeople'].toString();
    final String oneTestPerPeople = decodedJsonData['oneTestPerPeople'].toString();
    final String activePerOneMillion = decodedJsonData['activePerOneMillion'].toString();
    final String recoveredPerOneMillion =
        decodedJsonData['recoveredPerOneMillion'].toString();
    final String criticalPerOneMillion = decodedJsonData['criticalPerOneMillion'].toString();

    IndiaData _finalParsedData = IndiaData(
      cases: cases,
      casesPerOneMillion: casesPerOneMillion,
      continent: continent,
      country: country,
      countryInfo: countryInfo,
      criticalPerOneMillion: criticalPerOneMillion,
      oneCasePerPeople: oneCasePerPeople,
      oneDeathPerPeople: oneDeathPerPeople,
      oneTestPerPeople: oneTestPerPeople,
      todayCases: todayCases,
      tests: tests,
      testsPerOneMillion: testsPerOneMillion,
      todayDeaths: todayDeaths,
      todayRecovered: todayRecovered,
      activePerOneMillion: activePerOneMillion,
      deathsPerOneMillion: deathsPerOneMillion,
      recoveredPerOneMillion: recoveredPerOneMillion,
      population: population,
      recovered: recovered,
      updated: updated,
      active: active,
      deaths: deaths,
      gcritical: gcritical,
    );

    return _finalParsedData;
  } else {
    throw Exception("--Problem in parsing json, ---fetchIndiaData()");
  }
}
