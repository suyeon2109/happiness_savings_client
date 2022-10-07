import 'dart:convert';

import 'package:happiness_savings_client/api/happiness_request.dart';
import 'package:happiness_savings_client/api/happiness_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HappinessApiClient {
  const HappinessApiClient();

  final String _host = "52.79.226.73:8080";

  Future<String> login() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String userId = sharedPreferences.getString('userId')!;
    String loginType = sharedPreferences.getString('loginType')!;
    return http
        .post(
          Uri.http(_host, '/members/login'),
          // headers: {'Content-Type': 'application/json'},
          body: {'idProviderType':userId, "idProviderUserId":loginType},
        )
        .then((value) => value.body.toString());
  }

  Future<int> write(
    String title,
    String content,
    int happinessIndex,
  ) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String userId = sharedPreferences.getString('userId')!;
    final happinessRequest =
        HappinessRequest(title, content, happinessIndex, userId);
    return http
        .post(
          Uri.http(_host, '/members/$userId/happiness/write'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(happinessRequest.toMap()),
        )
        .then((value) => json.decode(value.body));
  }

  Future<HappinessResponse> findOne(
    int happinessId,
  ) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String userId = sharedPreferences.getString('userId')!;
    return http
        .get(Uri.http(_host, '/members/$userId/happiness/findOne'))
        .then((value) => json.decode(value.body))
        .then((value) => HappinessResponse.fromJson(value));
  }

  Future<List<HappinessResponse>> findAll() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String userId = sharedPreferences.getString('userId')!;
    return http
        .get(Uri.http(_host, '/members/$userId/happiness/findOne'))
        .then((value) => json.decode(value.body))
        .then((value) =>
            (value as List).map((e) => HappinessResponse.fromJson(e)).toList());
  }

  Future<List<HappinessResponse>> findByTitle(
    String title,
  ) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String userId = sharedPreferences.getString('userId')!;
    return http
        .get(Uri.http(_host, '/members/$userId/happiness/findByTitle'))
        .then((value) => json.decode(value.body))
        .then((value) =>
            (value as List).map((e) => HappinessResponse.fromJson(e)).toList());
  }

  Future<int> count() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String userId = sharedPreferences.getString('uuid')!;
    return http
        .get(Uri.http(_host, '/members/$userId/happiness/count'))
        .then((value) => int.parse(value.body));
  }
}
