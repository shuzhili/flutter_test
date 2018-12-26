import 'package:flutter/material.dart';
import 'package:navigation_drawer/screen/home.dart';
import 'package:navigation_drawer/screen/settings.dart';
import 'package:navigation_drawer/screen/account.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        SettingScreen.routeName: (context) => new SettingScreen(),
        AccountScreen.routeName:(context) => new AccountScreen(),
      },
    );
  }
}


