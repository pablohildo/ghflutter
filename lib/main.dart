import 'package:flutter/material.dart';

import 'strings.dart';
import 'ghflutterwidget.dart';

void main() => runApp(GHFlutterApp());

class GHFlutterApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: Strings.appTitle,
      theme: new ThemeData(primaryColor: Colors.green.shade800),
      home: new GHFlutterWidget(),
    );
  }
}