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
        title: "title", content: "content", happiness: 30, date: '2022-07-19'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홈 화면'),
      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/happinessList');
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.green,
                  child: const Align(
                    alignment: Alignment.center,
                    child: FlutterLogo(
                      size: 100,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(30),
                // color: Colors.yellow,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/write');
                    },
                    child: Icon(Icons.edit),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
