import 'package:flutter/material.dart';
import 'package:navigation_drawer/screen/account.dart';
import 'package:navigation_drawer/screen/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<MyHomePage> {
  var homePageContent = "Persist key with sp";
  var counter = 0;
  var key = "counter";

  Drawer getNavDrawer(BuildContext context) {
    var headerChild = new DrawerHeader(child: Text("Header"));
    var aboutChild = new AboutListTile(
      child: new Text("About"),
      applicationName: "Application Name",
      applicationVersion: "v1.0.0",
      applicationIcon: new Icon(Icons.adb),
      icon: new Icon(Icons.info),
    );

    ListTile getNavItem(var icon, String s, String routeName) {
      return new ListTile(
        leading: new Icon(icon),
        title: new Text(s),
        onTap: () {
          setState(() {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.settings, "Settings", SettingScreen.routeName),
      getNavItem(Icons.home, "Home", "/"),
      getNavItem(Icons.account_box, "Account", AccountScreen.routeName),
      aboutChild,
    ];
    ListView listView = new ListView(children: myNavChildren);
    return new Drawer(
      child: listView,
    );
  }

  void _loadSaveData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      counter = (sp.getInt(key) ?? 0);
    });
  }

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSaveData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Navigation Drawer Example"),
      ),
      body: _getContainer(),
      drawer: getNavDrawer(context),
    );
  }
}
