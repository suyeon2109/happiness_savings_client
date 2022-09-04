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
        title: "title",
        content: "content",
        happinessIndex: 30,
        createdAt: '2022-07-19',
        imagePath: 'imagePath'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('적금 내역',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                        child: InkWell(
                          child: _tile(
                              Icons.account_circle,
                              happinessList[index].title!,
                              happinessList[index].happinessIndex!,
                              happinessList[index].createdAt!),
                          onTap: () {
                            Navigator.of(context).pushNamed('/viewDetail',
                                arguments: happinessList[index]);
                          },
                        )
                    );
                  },
                  itemCount: happinessList.length,
                ),
              ),
            ]),
      ),
    );
  }

  ListTile _tile(
          IconData icon, String title, int happinessIndex, String createdAt) =>
      ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        subtitle: Text(happinessIndex.toString()),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
        trailing: Text(
          createdAt,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      );
}
