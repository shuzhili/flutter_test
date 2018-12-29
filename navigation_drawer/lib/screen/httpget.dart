import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:navigation_drawer/Utils.dart';

class MyHttpGet extends StatefulWidget {
  static const String routeName="httpget";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHttpGetState();
  }
}

class MyHttpGetState extends State<MyHttpGet> {
  final String url = "https://swapi.co/api/people";
  List data;

  Future<String> getJSONData() async {
    var reponse = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    print(reponse.body);
    setState(() {
      // Get the JSON data
      var dataConvertedToJSON = json.decode(reponse.body);
      // Extract the required part and assign it to the global variable named data
      data = dataConvertedToJSON['results'];
    });
    return "Successfull";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("httpget"),
      ),
      body: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (context, int index) {
            return new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      child: new Text(
                        data[index]['name'],
                        style: getCustomFontTextStyle(),
                      ),
                      padding: const EdgeInsets.all(16.0),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
