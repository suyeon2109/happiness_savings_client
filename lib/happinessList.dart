import 'package:flutter/material.dart';
import 'happinessItem.dart';

class HappinessList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HappinessList();
}

class _HappinessList extends State<HappinessList> {
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
        title: Text('적금 리스트 화면'),
      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                child: Align(
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: InkWell(
                          child: Row(children: <Widget>[
                            Text(happinessList[index].title!,
                                style: TextStyle(fontSize: 30)),
                            Text(happinessList[index].happinessIndex.toString(),
                                style: TextStyle(fontSize: 30)),
                            Text(happinessList[index].date,
                                style: TextStyle(fontSize: 30))
                          ]),
                          onTap: () {
                            Navigator.of(context).pushNamed('/viewDetail',
                                arguments: happinessList[index]);
                          },
                        ),
                      );
                    },
                    itemCount: happinessList.length,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
