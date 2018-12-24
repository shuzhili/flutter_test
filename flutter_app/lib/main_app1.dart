import 'app_config.dart';
import 'main_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/resource/display_strings_app1.dart';

void main() {
  var configuredApp = AppConfig(
    appDisplayName: "App 1",
    appInternalId: 1,
    stringResource: StringResourceApp1(),
    child: MyApp(),
  );
  mainCommon();
  runApp(configuredApp);
}
