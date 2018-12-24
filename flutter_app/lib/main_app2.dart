import 'app_config.dart';
import 'main_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/resource/display_strings_app2.dart';

void main() {
  var configuredApp = AppConfig(
    appDisplayName: "App 2",
    appInternalId: 2,
    stringResource: StringResourceApp2(),
    child: MyApp(),
  );
  mainCommon();
  runApp(configuredApp);
}
