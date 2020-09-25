class DailyCasesApiData {
  final List<CaseTimeSeries> caseTimeSeries;
  final List<Statewise> statewise;
  final List<Tested> tested;

  DailyCasesApiData({this.caseTimeSeries, this.statewise, this.tested});

  factory DailyCasesApiData.fromJson(Map<String, dynamic> json) {
    var caseTimeSeriesList = json['cases_time_series'] as List;
   // print(caseTimeSeriesList.runtimeType);
    List<CaseTimeSeries> ctsList =
        caseTimeSeriesList.map((i) => CaseTimeSeries.fromJson(i)).toList();

    var statewiseList = json['statewise'] as List;
    //print(statewiseList.runtimeType);
    List<Statewise> statList =
        statewiseList.map((s) => Statewise.fromJson(s)).toList();

    var testedList = json['tested'] as List;
    //print(testedList.runtimeType);
    List<Tested> tstList = testedList.map((e) => Tested.fromJson(e)).toList();

    return DailyCasesApiData(
      caseTimeSeries: ctsList,
      statewise: statList,
      tested: tstList,
    );
  }
}

class CaseTimeSeries {
  final String dailyconfirmed;
  final String dailydeceased;
  final String dailyrecovered;
  final String date;
  final String totalconfirmed;
  final String totaldeceased;
  final String totalrecovered;

  CaseTimeSeries(
      {this.dailyconfirmed,
      this.dailydeceased,
      this.dailyrecovered,
      this.date,
      this.totalconfirmed,
      this.totaldeceased,
      this.totalrecovered});

  factory CaseTimeSeries.fromJson(Map<String, dynamic> json) {
    return CaseTimeSeries(
        dailyconfirmed: json['dailyconfirmed'] as String,
        dailydeceased: json['dailydeceased'] as String,
        dailyrecovered: json['dailyrecovered'] as String,
        date: json['date'] as String,
        totalconfirmed: json['totalconfirmed'] as String,
        totaldeceased: json['totaldeceased'] as String,
        totalrecovered: json['totalrecovered'] as String);
  }
}

class Statewise {
  final String active;
  final String confirmed;
  final String deaths;
  final String deltaconfirmed;
  final String deltadeaths;
  final String deltarecovered;
  final String lastupdatedtime;
  final String migratedother;
  final String recovered;
  final String state;
  final String statecode;
  final String statenotes;

  Statewise(
      {this.active,
      this.confirmed,
      this.deaths,
      this.deltaconfirmed,
      this.deltadeaths,
      this.deltarecovered,
      this.lastupdatedtime,
      this.migratedother,
      this.recovered,
      this.state,
      this.statecode,
      this.statenotes});

  factory Statewise.fromJson(Map<String, dynamic> json) {
    return Statewise(
      active: json['active'] as String,
      confirmed: json['confirmed'] as String,
      deaths: json['deaths'] as String,
      deltaconfirmed: json['deltaconfirmed'] as String,
      deltadeaths: json['deltadeaths'] as String,
      deltarecovered: json['deltarecovered'] as String,
      lastupdatedtime: json['lastupdatedtime'] as String,
      migratedother: json['migratedother'] as String,
      recovered: json['recovered'] as String,
      state: json['state'] as String,
      statecode: json['statecode'] as String,
      statenotes: json['statenotes'] as String,
    );
  }
}

class Tested {
  final String dailyrtpcrtests;
  final String individualstestedperconfirmedcase;
  final String positivecasesfromsamplesreported;
  final String samplereportedtoday;
  final String source;
  final String source1;
  final String source3;
  final String testedasof;
  final String testpositivityrate;
  final String testsconductedbyprivatelabs;
  final String testsperconfirmedcase;
  final String testspermillion;
  final String totalindividualstested;
  final String totalpositivecases;
  final String totalrtpcrtests;
  final String totalsamplestested;
  final String updatetimestamp;

  Tested(
      {this.dailyrtpcrtests,
      this.individualstestedperconfirmedcase,
      this.positivecasesfromsamplesreported,
      this.samplereportedtoday,
      this.source,
      this.source1,
      this.source3,
      this.testedasof,
      this.testpositivityrate,
      this.testsconductedbyprivatelabs,
      this.testsperconfirmedcase,
      this.testspermillion,
      this.totalindividualstested,
      this.totalpositivecases,
      this.totalrtpcrtests,
      this.totalsamplestested,
      this.updatetimestamp});

  factory Tested.fromJson(Map<String, dynamic> json) {
    return Tested(
      dailyrtpcrtests: json['dailyrtpcrtests'] as String,
      individualstestedperconfirmedcase:
          json['individualstestedperconfirmedcase'] as String,
      positivecasesfromsamplesreported:
          json['positivecasesfromsamplesreported'] as String,
      samplereportedtoday: json['samplereportedtoday'] as String,
      source: json['source'] as String,
      source1: json['source1'] as String,
      source3: json['source3'] as String,
      testedasof: json['testedasof'] as String,
      testpositivityrate: json['testpositivityrate'] as String,
      testsconductedbyprivatelabs:
          json['testsconductedbyprivatelabs'] as String,
      testsperconfirmedcase: json['testsperconfirmedcase'] as String,
      testspermillion: json['testspermillion'] as String,
      totalindividualstested: json['totalindividualstested'] as String,
      totalpositivecases: json['totalpositivecases'] as String,
      totalrtpcrtests: json['totalrtpcrtests'] as String,
      totalsamplestested: json['totalsamplestested'] as String,
      updatetimestamp: json['updatetimestamp'] as String,
    );
  }
}
