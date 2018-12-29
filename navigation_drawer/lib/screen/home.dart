import 'package:flutter/material.dart';
import 'package:navigation_drawer/screen/account.dart';
import 'package:navigation_drawer/screen/settings.dart';
import 'package:navigation_drawer/screen/editText.dart';
import 'package:navigation_drawer/tab/firstTab.dart';
import 'package:navigation_drawer/tab/secondTab.dart';
import 'package:navigation_drawer/tab/thirdTab.dart';
import 'package:navigation_drawer/screen/httpget.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  var homePageContent = "Persist key with sp";

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
      getNavItem(Icons.edit, "editText", MyEditText.routeName),
      getNavItem(Icons.http, 'httpget', MyHttpGet.routeName),
      aboutChild,
    ];
    ListView listView = new ListView(children: myNavChildren);
    return new Drawer(
      child: listView,
    );
  }

  TabController controller;

  TabBarView _getTabView() {
    return new TabBarView(
      children: [new FirstTab(), new SecondTab(), new ThirdTab()],
      controller: controller,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Navigation Drawer Example"),
      ),
      body: _getTabView(),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          tabs: [
            new Tab(
              icon: new Icon(Icons.favorite),
            ),
            new Tab(
              icon: new Icon(Icons.adb),
            ),
            new Tab(
              icon: new Icon(Icons.airport_shuttle),
            )
          ],
          controller: controller,
        ),
      ),
      drawer: getNavDrawer(context),
    );
  }
}
