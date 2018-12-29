import 'package:flutter/material.dart';
import 'package:navigation_drawer/Utils.dart';

class AccountScreen extends StatefulWidget {
  static const String routeName = "/account";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AccountScreenState();
  }
}

class AccountScreenState extends State<AccountScreen> {

  final TextEditingController controller = new TextEditingController();
  String results = "";

  TextField _getTextField() {
    return new TextField(
      decoration: new InputDecoration(helperText: "enter text here"),
      onSubmitted: (String str) {
        setState(() {
          results = results + '\n' + str;
          controller.text = '';
        });
      },
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Account"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(16.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(
                "Account Screen",
                style: getCustomFontTextStyle(),
              ),
              _getTextField(),
              new Text(results),
            ],
          ),
        ),
      ),
    );
  }
}
