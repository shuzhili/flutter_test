import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  static const String routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Settings"),
      ),
      body: new Center(
        child: new Center(
          child: new Text("Settings Screen"),
        ),
      ),
    );
  }
}
