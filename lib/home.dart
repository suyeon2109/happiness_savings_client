import 'package:flutter/material.dart';
import 'happinessItem.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  List<Happiness> happinessList = new List.empty(growable: true);

  @override
  void initState() {
    happinessList.add(Happiness(
        title: "title", content: "content", happinessIndex: 30, date: '2022-07-19'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/happinessList');
        },
        child: const Align(
          alignment: Alignment.center,
          heightFactor: 5,
          child: FlutterLogo(
            size: 100,
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 30, 100),
        child: FloatingActionButton(
          child: const Icon(Icons.text_fields),
          onPressed: () {
            Navigator.of(context).pushNamed('/write');
          },
        ),
      ),
    );
  }
}
