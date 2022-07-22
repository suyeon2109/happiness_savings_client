import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'home.dart';
import 'write.dart';
import 'viewDetail.dart';
import 'happinessList.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final uuid = await resolveUuid();
  if (kDebugMode) {
    print('uuid: $uuid');
  }
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

Future<String> resolveUuid() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  var savedUuid = sharedPreferences.getString('uuid');
  if (savedUuid != null) {
    return savedUuid;
  }

  final uuid = const Uuid().v1();
  sharedPreferences.setString('uuid', uuid);
  return uuid;
}