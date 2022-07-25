import 'package:flutter/material.dart';
import 'home.dart';
import 'write.dart';
import 'viewDetail.dart';
import 'happinessList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main page',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/write': (context) => Write(),
        '/viewDetail': (context) => ViewDetail(),
        '/happinessList' : (context) => HappinessList(),
      },
    );
  }
}
