import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.red,
      ),
      body: new Container(
        child: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Home Page\nClick on below icon to goto About Page",
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
//              new Image.network(
//                  'https://github.com/nisrulz/flutter-examples/raw/develop/image_from_network/img/flutter_logo.png'),
              // even loads gifs
              // Gif image from Giphy, all copyrights are owned by Giphy
              new Image.network(
                  'https://github.com/nisrulz/flutter-examples/raw/develop/image_from_network/img/loop_anim.gif'),
              IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/list');
                },
                iconSize: 80.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
