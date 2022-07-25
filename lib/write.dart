import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'happinessItem.dart';

class Write extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Write();
}

class _Write extends State<Write> {
  double _happinessIndex = 0;
  final _title = TextEditingController();
  final _content = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose(){
    _title.dispose();
    _content.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    var date = DateFormat('yyyy-MM-dd').add_jm().format(now);

    var happiness = Happiness(date: date, title: _title.text, content: _content.text, happinessIndex: _happinessIndex.toInt());

    var gaugeColor = _happinessIndex < -50
        ? Colors.blue[600]
        : _happinessIndex <= -1
            ? Colors.blue[300]
            : _happinessIndex < 50
                ? Colors.red[200]
                : Colors.red[400];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('새 기록',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
                Icons.check,
                size: 30,
                color: Colors.blue,
              ),
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(happiness.toString())));
                  Navigator.of(context).pop();
                }
              },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: ListView(
              // mainAxisAlignment: MainAxisAlignment.top,
              children: <Widget>[
                Row(
                  children: const [
                    Icon(
                      Icons.shield_moon,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text('행복지수', style: TextStyle(fontSize: 18))
                  ],
                ),
                SfLinearGauge(
                  maximum: 100.0,
                  minimum: -100.0,
                  showTicks: false,
                  axisTrackStyle: const LinearAxisTrackStyle(thickness: 8),
                  markerPointers: [
                    LinearShapePointer(
                        value: _happinessIndex,
                        shapeType: LinearShapePointerType.circle,
                        position: LinearElementPosition.cross,
                        onChanged: (double value) {
                          setState(() {
                            _happinessIndex = value;
                          });
                        },
                        color: gaugeColor),
                    LinearWidgetPointer(
                      value: _happinessIndex,
                      onChanged: (double value) {
                        setState(() {
                          _happinessIndex = value;
                        });
                      },
                      position: LinearElementPosition.outside,
                      child: Container(
                        width: 55,
                        height: 45,
                        child: Center(
                          child: Text(
                            _happinessIndex.toInt().toStringAsFixed(0),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: gaugeColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                  ranges: [
                    LinearGaugeRange(
                        endValue:
                            _happinessIndex > 0 ? _happinessIndex : 0,
                        startValue:
                            _happinessIndex > 0 ? 0 : _happinessIndex,
                        color: gaugeColor,
                        position: LinearElementPosition.cross)
                  ],
                ),
                const SizedBox(height: 50),
                TextFormField(
                  controller: _title,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                    labelText: '제목',
                    isDense: true,
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "한 글자 이상 입력해주세요";
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                    controller: _content,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      labelText: '당신의 순간을 기록해보세요',
                      isDense: true,

                      //make hint text
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "한 글자 이상 입력해주세요";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      setState(() {
                      });
                    },
                 ),
              ]),
        ),
      ),
    );
  }
}
