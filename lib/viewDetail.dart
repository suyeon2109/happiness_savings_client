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
        title: Text('내용 디테일 화면'),
      ),
    );
  }
}
