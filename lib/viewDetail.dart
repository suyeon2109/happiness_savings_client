import 'package:flutter/material.dart';

class ViewDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViewDetail();
}

class _ViewDetail extends State<ViewDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('내용 디테일 화면',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
