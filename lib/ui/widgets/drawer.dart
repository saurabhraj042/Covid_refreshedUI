import 'package:covid_refreshed/ui/shared/colors.dart';
import 'package:covid_refreshed/ui/views/statewise_view.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(""),
            decoration: BoxDecoration(
              color: Palette.primaryColor,
            ),
          ),
          ListTile(
            title: Text('Statewise Data'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StatewiseView()));
            },
          ),
        ],
      ),
    );
  }
}
