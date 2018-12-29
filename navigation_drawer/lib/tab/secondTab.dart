import 'package:flutter/material.dart';

class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.adb,
              size: 160.0,
              color: Colors.white,
            ),
            new Text(
              "second Tab",
              style: new TextStyle(color: Colors.white),
            ),
            new RaisedButton(
                child: new Text("SnackBar"),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(new SnackBar(
                    content: new Text("snackbar"),
                    duration: new Duration(seconds: 3),
                    action: new SnackBarAction(
                        label: "hit",
                        onPressed: () {
                          Scaffold.of(context).showSnackBar(
                              new SnackBar(content: new Text("action")));
                        }),
                  ));
                }),
          ],
        ),
      ),
    );
  }
}
