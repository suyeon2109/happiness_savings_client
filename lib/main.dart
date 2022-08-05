import 'package:flutter/material.dart';
import 'package:happiness_savings_client/home.dart';

import 'home.dart';
import 'happinessList.dart';
import 'viewDetail.dart';
import 'write.dart';

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
