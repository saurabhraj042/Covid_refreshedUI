import 'package:flutter/material.dart';

class StatewiseView extends StatefulWidget {
  @override
  _StatewiseViewState createState() => _StatewiseViewState();
}

class _StatewiseViewState extends State<StatewiseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statewise"),
      ),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
