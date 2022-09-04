import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'api/happiness_api_client.dart';
import 'flChart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'home.dart';
import 'mood_graph.dart';
import 'write.dart';
import 'viewDetail.dart';
import 'happinessList.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final uuid = await resolveUuid();
  if (kDebugMode) {
    print('uuid: $uuid');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/moodGraph' : (context) => FlChart(),
        // '/moodGraph' : (context) => MoodGraph(),
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

  const api = HappinessApiClient();
  final apiResponse = await api.signUp();

  if (kDebugMode) {
    print('apiResponse: $apiResponse');
  }

  return uuid;
}