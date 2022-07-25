import 'package:flutter/material.dart';

class Write extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('글쓰기 화면'),
      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(30),
                // color: Colors.yellow,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.text,
                    )),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(30),
                // color: Colors.yellow,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    child: Text('저장'),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
