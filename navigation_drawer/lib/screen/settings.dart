import 'package:flutter/material.dart';
import 'package:navigation_drawer/Utils.dart';
import 'package:navigation_drawer/tab/firstTab.dart';
import 'package:navigation_drawer/tab/secondTab.dart';
import 'package:navigation_drawer/tab/thirdTab.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = "/settings";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingScreenState();
  }
}

class SettingScreenState extends State<SettingScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  TabBar _getTabs() {
    return new TabBar(
      tabs: [
        new Tab(
          icon: new Icon(Icons.print),
        ),
        new Tab(
          icon: new Icon(Icons.save),
        ),
        new Tab(
          icon: new Icon(Icons.radio),
        ),
      ],
      controller: tabController,
    );
  }

  TabBarView _getTabBarView(var tabs) {
    return new TabBarView(
      children: tabs,
      controller: tabController,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("tab"),
        bottom: _getTabs(),
      ),
      body: _getTabBarView([new FirstTab(), new SecondTab(), new ThirdTab()]),
    );
  }
}
