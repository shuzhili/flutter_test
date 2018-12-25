import 'package:flutter/material.dart';
import 'package:flutter_widgets/home.dart';
import 'package:flutter_widgets/list.dart';

void main() {
  runApp(new MaterialApp(
    home: HomePage(),
    routes: <String, WidgetBuilder>{
      // Set named routes
      MyListView.routeName: (BuildContext context) => new MyListView(),
    },
  ));
}
