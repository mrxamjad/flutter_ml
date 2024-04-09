import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key, required this.title});

  final String title;

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _image;
  ImagePicker _imagePicker = ImagePicker();

  chooseImage() async {
    // Add image picker code here
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  captureImage() async {
    // Add image picker code here
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image != null
                ? Image.file(_image!)
                : const Icon(Icons.image, size: 100),
            ElevatedButton(
              onLongPress: () async {
                await captureImage();
              },
              onPressed: () async {
                // Add image picker code here
                await chooseImage();
              },
              child: const Text('Pick Image'),
            ),
            Text("Long press to capture image from camera")
          ],
        ),
      ),
    );
  }
}
