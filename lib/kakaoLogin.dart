import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/happiness_api_client.dart';

class KaKaoLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _KaKaoLogin();
}

class _KaKaoLogin extends State<KaKaoLogin> {
  bool _isKaKaoTalkInstalled = false;

  _initKaKaoTalkInstalled() async {
    final installed = await isKakaoTalkInstalled();
    setState(() {
      _isKaKaoTalkInstalled = installed;
    });
  }

  isLoggedIn() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var savedUuid = sharedPreferences.getString('uuid');

    if(savedUuid != null){
      Navigator.of(context).pushNamed('/home');
    } else {
      _initKaKaoTalkInstalled();
    }
  }

  @override
  void initState() {
    super.initState();

    isLoggedIn();
  }

  Future<void> _loginButtonPressed() async {
    try {
      var authCode = (_isKaKaoTalkInstalled ?
      await AuthCodeClient.instance.requestWithTalk() :
      await AuthCodeClient.instance.request());
      print("authCode : " + authCode);

      // var token = await AuthApi.instance.issueAccessToken(authCode: authCode);
      // var tokenManager = DefaultTokenManager();
      // print("token : " + token.toString());
      // tokenManager.setToken(token);

      User user = await UserApi.instance.me();

      print('사용자 정보 요청 성공'
          '\n회원번호: ${user.id}');

      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('uuid', '${user.id}');

      const api = HappinessApiClient();
      final apiResponse = await api.signUp();

      if (kDebugMode) {
        print('apiResponse: $apiResponse');
      }

      Navigator.of(context).pushNamed('/home');
    } catch(e){
      print("fail");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
                onPressed: _loginButtonPressed,
                color: Colors.yellow,
                child: const Text(
                  '카카오 로그인',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
