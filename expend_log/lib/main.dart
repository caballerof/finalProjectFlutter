import 'package:flutter/material.dart';
import 'ui/FirstPage.dart';

void main() {
  const _appName = "Spend Log";
  var dateNow = new DateTime.now();
  runApp(new MaterialApp(
    title: _appName,
    home: FirstPage(
      appName: _appName,
      date: dateNow,
    ),
  ));
}
