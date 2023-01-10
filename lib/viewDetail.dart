import 'package:flutter/material.dart';
import 'package:happiness_savings_client/api/happiness_response.dart';

class ViewDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViewDetail();
}

class _ViewDetail extends State<ViewDetail> {
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as HappinessResponse;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('My Saving',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:30, left: 30),
                child: Text(args.title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 30),
                child: Row(
                  children: [
                    const Icon(
                      Icons.shield_moon,
                      size: 20,
                      color: Colors.brown,
                    ),
                    const SizedBox(width: 5),
                    Text("행복지수 ${args.happinessIndex}", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              const SizedBox(height: 20),
               Padding(
                 padding: const EdgeInsets.only(left: 30, right: 30),
                 child: SizedBox(
                   height: (args.imageUrl != null)? Image.network(args.imageUrl).height : MediaQuery.of(context).size.height * 0.2,
                   width: (args.imageUrl != null)? Image.network(args.imageUrl).width : MediaQuery.of(context).size.width,
                   child: (args.imageUrl != null)? Image.network(args.imageUrl) : const Center(child: Text("No Image")),
                 ),
               ),
              Padding(
                padding: const EdgeInsets.only(top:20, left: 30),
                child: Text(args.content, style: const TextStyle(fontSize: 15),),
              ),
            ],
          ),
        )
      ),
    );
  }
}
