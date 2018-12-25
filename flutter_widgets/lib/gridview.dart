import 'package:flutter/material.dart';

class MyGridView {
  Card getStructuredGridCell(name, image) {
    return Card(
      elevation: 1.5,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Image.asset("assets/ic_launcher.png"),
          new Center(
            child: new Text("111"),
          ),
        ],
      ),
    );
  }

  GridView build() {
    return new GridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[
        getStructuredGridCell("", ""),
        getStructuredGridCell("", ""),
        getStructuredGridCell("", ""),
        getStructuredGridCell("", ""),
        getStructuredGridCell("", ""),
        getStructuredGridCell("", ""),
        getStructuredGridCell("", ""),
      ],
    );
  }
}
