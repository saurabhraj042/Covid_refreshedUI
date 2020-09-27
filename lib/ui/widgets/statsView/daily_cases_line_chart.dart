import 'package:covid_refreshed/core/models/models.dart';
import 'package:covid_refreshed/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DailyStat extends StatefulWidget {
  @override
  _DailyStatState createState() => _DailyStatState();
}

class _DailyStatState extends State<DailyStat> {
  Future<DailyCasesApiData> data;
  @override
  void initState() {
    data = fetchDailyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("--Fetch Success ---DailyStat() widget");
            DailyCasesApiData d = snapshot.data;
            List<CaseTimeSeries> s = d.caseTimeSeries;

            return charts.LineChart(
              _createSampleData(s),
              animate: true,
            );
          } else if (snapshot.hasError) {
            print("--Error ---DailyStat() widget");
            print(snapshot.error.toString());
            return Center(
              child: Text("Error..."),
            );
          } else {
            print("--fetching ---DailyStat() widget");
            return Center(
              child: Text("Loading Data..."),
            );
          }
        },
      ),
    );
  }

  static List<charts.Series<DailyStatCovid, int>> _createSampleData(
      List<CaseTimeSeries> ctsData) {
    List<DailyStatCovid> dat = [];
    int len = ctsData.length;
    for (int i = 0; i < len; i++) {
      int cases = int.parse(ctsData[i].dailyconfirmed);
      DailyStatCovid dd = DailyStatCovid(i + 1, cases);
      dat.add(dd);
    }

    return [
      new charts.Series<DailyStatCovid, int>(
        id: 'Cases',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (DailyStatCovid cases, _) => cases.day,
        measureFn: (DailyStatCovid cases, _) => cases.casesToday,
        data: dat,
      )
    ];
  }
}

class DailyStatCovid {
  final int day;
  final int casesToday;

  DailyStatCovid(this.day, this.casesToday);
}
