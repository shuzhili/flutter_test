import 'package:flutter/material.dart';
import 'package:flutter_widgets/gridview.dart';

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
        body: new Container(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new DropdownButton(
                  value: _select_fruit,
                  items: _dropDownMenuItems,
                  onChanged: changeDropDowmItem)
            ],
          ),
        ),
//        body: myGridView.build(),
      ),
    );
  }
}
