class IndiaData {
  final String updated;
  final String country;
  final String countryInfo;
  final String cases;
  final String todayCases;
  final String deaths;
  final String todayDeaths;
  final String recovered;
  final String todayRecovered;
  final String active;
  final String gcritical;
  final String casesPerOneMillion;
  final String deathsPerOneMillion;
  final String tests;
  final String testsPerOneMillion;
  final String population;
  final String continent;
  final String oneCasePerPeople;
  final String oneDeathPerPeople;
  final String oneTestPerPeople;
  final String activePerOneMillion;
  final String recoveredPerOneMillion;
  final String criticalPerOneMillion;

  IndiaData(
      {this.updated,
      this.country,
      this.countryInfo,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.gcritical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.tests,
      this.testsPerOneMillion,
      this.population,
      this.continent,
      this.oneCasePerPeople,
      this.oneDeathPerPeople,
      this.oneTestPerPeople,
      this.activePerOneMillion,
      this.recoveredPerOneMillion,
      this.criticalPerOneMillion});

  factory IndiaData.fromJson(Map<String, dynamic> json) {
    return IndiaData(
      updated: json['updated'] as String,
      country: json['country'] as String,
      countryInfo: json['countryInfo'] as String,
      cases: json['cases'] as String,
      todayCases: json['todayCases'] as String,
      deaths: json['deaths'] as String,
      todayDeaths: json['todayDeaths'] as String,
      recovered: json['recovered'] as String,
      todayRecovered: json['todayRecovered'] as String,
      active: json['active'] as String,
      gcritical: json['gcritical'] as String,
      casesPerOneMillion: json['casesPerOneMillion'] as String,
      deathsPerOneMillion: json['deathsPerOneMillion'] as String,
      tests: json['tests'] as String,
      testsPerOneMillion: json['testsPerOneMillion'] as String,
      population: json['population'] as String,
      continent: json['continent'] as String,
      oneCasePerPeople: json['oneCasePerPeople'] as String,
      oneDeathPerPeople: json['oneDeathPerPeople'] as String,
      oneTestPerPeople: json['oneTestPerPeople'] as String,
      activePerOneMillion: json['activePerOneMillion'] as String,
      recoveredPerOneMillion: json['recoveredPerOneMillion'] as String,
      criticalPerOneMillion: json['criticalPerOneMillion'] as String,
    );
  }
}
