import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'api/happiness_api_client.dart';
import 'api/happiness_response.dart';
import 'happinessItem.dart';

class HappinessList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HappinessList();
}

class _HappinessList extends State<HappinessList> {
  final happinessList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _asyncFindAll();
    });

    // happinessList.add(Happiness(
    //     title: "title",
    //     content: "content",
    //     happinessIndex: 30,
    //     createdAt: '2022-07-19',
    //     imagePath: 'imagePath'));
  }

  _asyncFindAll() async {
    const api = HappinessApiClient();
    var list = await api.findAll();
    setState(() {
      happinessList.addAll(list.reversed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('My Savings',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 100),
        itemBuilder: (context, index) {
          return Card(
              child: InkWell(
                child: _tile(
                    happinessList[index].imageUrl,
                    happinessList[index].title,
                    happinessList[index].happinessIndex,
                    happinessList[index].createdAt.toString().replaceAll('T', ' ')),
                onTap: () {
                  Navigator.of(context).pushNamed('/viewDetail',
                      arguments: happinessList[index]);
                },
              )
          );
        },
        itemCount: happinessList.length,
      ),
    );
  }

  ListTile _tile(
          String icon, String title, int happinessIndex, String createdAt) =>
      ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        subtitle: Text(happinessIndex.toString()),
        leading: (icon != null)? Image.network(icon) :
                      Icon(
                        Icons.image,
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
