import 'package:flutter/material.dart';
import 'package:flutter_widgets/gridview.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List _fruits = ["Apple", "Banana", "Pineapple", "Mango", "Grapes"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _select_fruit;
  List data;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropdownMenuItem(_fruits);
    _select_fruit = _dropDownMenuItems[0].value;
    // TODO: implement initState
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropdownMenuItem(List _fruits) {
    List<DropdownMenuItem<String>> list = new List();
    for (String fruit in _fruits) {
      list.add(new DropdownMenuItem(value: fruit, child: Text(fruit)));
    }
    return list;
  }

  void changeDropDowmItem(String fruit) {
    setState(() {
      _select_fruit = fruit;
    });
  }

  @override
  Widget build(BuildContext context) {
    final MyGridView myGridView = new MyGridView();
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          title: new Text("DropDownMenuItems"),
        ),
//        body: new Container(
//          child: new Column(
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: <Widget>[
//              new DropdownButton(
//                  value: _select_fruit,
//                  items: _dropDownMenuItems,
//                  onChanged: changeDropDowmItem)
//            ],
//          ),
//          decoration: BoxDecoration(
//            image: DecorationImage(
//                image: AssetImage("assets/ic_launcher.png"), fit: BoxFit.cover),
//          ),
//        ),
//        body: myGridView.build(),
        body: new FutureBuilder(
            future: DefaultAssetBundle.of(context).load("data_repo/dd.json"),
            builder: (context, snapshot) {
              var new_data = jsonDecode(snapshot.data.toString());
              return new ListView.builder(itemBuilder: (context, int index) {
                return new Card(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(new_data[index]['name']),
                      Text(new_data[index]['height']),
                      Text(new_data[index]['mass']),
                      Text(new_data[index]['hair_color']),
                      Text(new_data[index]['skin_color']),
                      Text(new_data[index]['name']),
                    ],
                  ),
                );
              });
            }),
      ),
    );
  }
}
