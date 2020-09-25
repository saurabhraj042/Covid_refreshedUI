import 'package:flutter/material.dart';

TextStyle _customTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
);

class CountryTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(
        child: Text(
          "India",
          style: _customTextStyle,
        ),
      ),
    );
  }
}
