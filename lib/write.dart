import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:happiness_savings_client/raindrop/animation_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'api/happiness_api_client.dart';
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
  var _imgPath = "";

  @override
  void dispose() {
    _title.dispose();
    _content.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var happiness = Happiness(
        title: _title.text,
        content: _content.text,
        happinessIndex: _happinessIndex.toInt(),
        imagePath: _imgPath);

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
              if (_formKey.currentState!.validate()) {
                upload(happiness);
                Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
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
                happinessIndexLabel(),
                happinessIndex(),
                const SizedBox(height: 50),
                showImage(),
                const SizedBox(height: 30),
                camera(),
                const SizedBox(height: 20),
                title(),
                const SizedBox(height: 30),
                content()
              ]),
        ),
      ),
    );
  }

  Widget happinessIndexLabel() {
    return Row(
      children: const [
        Icon(
          Icons.shield_moon,
          size: 20,
          color: Colors.brown,
        ),
        SizedBox(width: 5),
        Text('행복지수', style: TextStyle(fontSize: 18))
      ],
    );
  }

  Widget happinessIndex() {
    var gaugeColor = _happinessIndex < -50
        ? Colors.blue[600]
        : _happinessIndex <= -1
            ? Colors.blue[300]
            : _happinessIndex < 50
                ? Colors.red[200]
                : Colors.red[300];

    return SfLinearGauge(
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
            endValue: _happinessIndex > 0 ? _happinessIndex : 0,
            startValue: _happinessIndex > 0 ? 0 : _happinessIndex,
            color: gaugeColor,
            position: LinearElementPosition.cross)
      ],
    );
  }

  XFile? _image;
  final picker = ImagePicker();

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = image; // 가져온 이미지를 _image에 저장
      _imgPath = _image!.path;
    });
  }

  // 이미지를 보여주는 위젯
  Widget showImage() {
    if (_image == null) {
      return const Center(child: Text('No image selected.'));
    } else {
      return Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.file(File(_image!.path)),
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(10),
            child: FloatingActionButton(
              onPressed: () {
                clearImage();
              },
              backgroundColor: Colors.black,
              child: const Icon(
                Icons.delete,
                size: 20,
              ),
            ),
          )
        ],
      );
    }
  }

  clearImage() {
    setState(() {
      _image = null;
    });
  }

  Widget camera() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // 카메라 촬영 버튼
        SizedBox(
          height: 40,
          width: 50,
          child: FloatingActionButton(
            heroTag: "cameraBtn",
            tooltip: 'camera',
            backgroundColor: Colors.blue.shade300,
            onPressed: () {
              getImage(ImageSource.camera);
            },
            child: const Icon(
              Icons.add_a_photo,
              size: 20,
            ),
          ),
        ),
        // const SizedBox(width: 5),

        // 갤러리에서 이미지를 가져오는 버튼
        SizedBox(
          height: 40,
          child: FloatingActionButton(
            heroTag: "imgBtn",
            tooltip: 'pick Image',
            backgroundColor: Colors.blue.shade300,
            onPressed: () {
              getImage(ImageSource.gallery);
            },
            child: const Icon(
              Icons.photo_library_outlined,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget title() {
    return TextFormField(
      controller: _title,
      style: const TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
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
        setState(() {});
      },
    );
  }

  Widget content() {
    return TextFormField(
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
        setState(() {});
      },
    );
  }

  Future<void> upload(happiness) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(happiness.toString())));

    const api = HappinessApiClient();
    MultipartFile imgFile = await MultipartFile.fromFile(_imgPath);
    final apiResponse = await api.write(_title.text, _content.text, _happinessIndex.toInt(), imgFile);
  }
}
