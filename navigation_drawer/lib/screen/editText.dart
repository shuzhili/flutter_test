import 'package:flutter/material.dart';

class MyEditText extends StatefulWidget {
  static const String routeName = '/edit';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new EditTextState();
  }
}

class EditTextState extends State<MyEditText> {
  double billAmount = 0.0;
  double tipPercentage = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextField billAmountField = new TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        try {
          billAmount = double.parse(value);
        } catch (exception) {
          billAmount = 0.0;
        }
      },
      decoration: new InputDecoration(labelText: "Bill amount(\$)"),
    );
    TextField tipPerField = new TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        try {
          tipPercentage = double.parse(value);
        } catch (exception) {
          tipPercentage = 0.0;
        }
      },
    );
    RaisedButton raisedButton = new RaisedButton(
        child: new Text("calculate"),
        onPressed: () {
          // Calculate tip and total
          double calculatedTip = billAmount * tipPercentage / 100.0;
          double total = billAmount + calculatedTip;

          AlertDialog dialog = new AlertDialog(
            content: new Text("tip:\$$calculatedTip \n"
                "Total:\$$total"),
          );
          showDialog(context: context, child: dialog);
        });

    Container container = new Container(
      padding: EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[billAmountField, tipPerField, raisedButton],
      ),
    );
    AppBar appBar = new AppBar(
      title: new Text("editText"),
      backgroundColor: Colors.red,
    );
    return new Scaffold(
      appBar: appBar,
      body: container,
    );
  }
}
