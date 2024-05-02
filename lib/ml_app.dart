import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

class ML_App extends StatefulWidget {
  const ML_App({super.key});

  @override
  State<ML_App> createState() => _ML_AppState();
}

class _ML_AppState extends State<ML_App> {
  File? _image;
  bool _busy = false;
  late List _recognitions;
  String prediction = '';

  @override
  void initState() {
    super.initState();

    _busy = true;

    loadModel().then((val) {
      setState(() {
        _busy = false;
      });
    });
  }

  Future loadModel() async {
    Tflite.loadModel(
        model: 'assets/mobilenet_v1_1.0_224.tflite',
        labels: 'assets/mobilenet_v1_1.0_224.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Image Prediction App'),
        ),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Image Prediction'),
            _image != null
                ? Image.file(_image!)
                : Image.asset('assets/pexels-magda-ehlers-pexels-2549156.jpg'),
            Row(
              children: [
                ElevatedButton(
                    onPressed: loadImage, child: Text('Select Image')),
                ElevatedButton(
                    onPressed: predictImage, child: Text('Predict Image')),
              ],
            ),
            Text('Your prediction is... $prediction')
          ],
        )));
  }

  Future loadImage() async {
    var image = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);

    if (image == null) return;

    setState(() {
      _image = File(image.path);
    });
  }

  void predictImage() async {
    if (_image == null || _busy == true) {
      return;
    }

    _busy = true;

    var recognitions = await Tflite.runModelOnImage(
      path: _image!.path,
      numResults: 3,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _recognitions = recognitions!;
      print('RECOGNITION no .toString(): $recognitions}');
      print('RECOGNITION: ${recognitions.toString()}');
      print( recognitions.toList()[0]);
      print( recognitions.toList()[0]['label']);
      prediction = recognitions.toList()[0]['label'];
      _busy = false;
    });
  }
}
