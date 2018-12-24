import 'package:flutter/material.dart';
import 'display_strings.dart';
import 'package:intl/intl.dart';
import 'app_config.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(config.appDisplayName)),
      body: _buildBody(
          config.appDisplayName, config.stringResource, config.appInternalId),
    );
  }

  Widget _buildBody(
      String appName, StringResource stringResource, int appInternalId) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Text(appName),
          Text(DATE + getDateForDisplay()),
          Text(stringResource.APP_DESCRIPTION),
          Image.asset(
            "assets/dancing.png",
            width: 50.0,
            height: 50.0,
          ),
          Image.asset(
            "assets/" + appInternalId.toString() + "/1.png",
            width: 50.0,
            height: 50.0,
          ),
        ],
      ),
    );
  }

  String getDateForDisplay() {
    DateTime now = DateTime.now();
    var formatter = DateFormat('HH:mm a');
    return formatter.format(now);
  }
}
