import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new FirstTabState();
  }
}

class FirstTabState extends State<FirstTab> {
  var counter = 0;
  var key = "counter";

  void _loadSaveData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      counter = (sp.getInt(key) ?? 0);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSaveData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    _onIncrement() async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      setState(() {
        counter = (sp.getInt(key) ?? 0) + 1;
      });
      sp.setInt(key, counter);
    }

    _onDecrement() async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      setState(() {
        counter = (sp.get(key) ?? 0) - 1;
      });
      sp.setInt(key, counter);
    }

    Container _getContainer() {
      return new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                  child: new Text("dialog"),
                  onPressed: () {
                    AlertDialog alerDialog = new AlertDialog(
                      content: Text("hellor"),
                      title: new Text("tishi"),
                    );
                    showDialog(context: context, child: alerDialog);
                  }),
              new Text(
                '$counter',
                textScaleFactor: 10.0,
              ),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new RaisedButton(
                onPressed: _onIncrement,
                child: new Text("Increment Counter"),
              ),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new RaisedButton(
                onPressed: _onDecrement,
                child: new Text("DecrementHit"),
              ),
            ],
          ),
        ),
      );
    }

    return new Scaffold(
      backgroundColor: Colors.red,
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.favorite,
              size: 160.0,
              color: Colors.white,
            ),
            new Text(
              "First Tab",
              style: new TextStyle(color: Colors.white),
            ),
            _getContainer(),
          ],
        ),
      ),
    );
  }
}
