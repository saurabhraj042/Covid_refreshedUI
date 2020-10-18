import 'package:covid_refreshed/core/models/models.dart';
import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  final IndiaData indiadata;
  const StatsGrid({Key key, this.indiadata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cases = (double.parse(indiadata.cases) / 100000.0 ).floorToDouble();
    final double recovered = (double.parse(indiadata.recovered) / 100000.0 ).roundToDouble();
    final double tests = (double.parse(indiadata.tests) / 100000.0 ).roundToDouble();
    final int death = (int.parse(indiadata.deaths)).round();
    final double active = (double.parse(indiadata.active) / 100000.0).roundToDouble();

    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Total Cases', '$cases Lac', Colors.orange),
                _buildStatCard('Deaths', '$death', Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Recovered', '$recovered Lac', Colors.green),
                _buildStatCard('Active', '$active Lac', Colors.lightBlue),
                _buildStatCard('Tests', '$tests Lac', Colors.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
