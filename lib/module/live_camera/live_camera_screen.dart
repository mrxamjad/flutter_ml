import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class LiveCameraScreen extends StatefulWidget {
  const LiveCameraScreen({super.key});

  @override
  State<LiveCameraScreen> createState() => _LiveCameraScreenState();
}

class _LiveCameraScreenState extends State<LiveCameraScreen> {
  late CameraController _cameraController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showLiveCamera();
  }

  showLiveCamera() async {
    late List<CameraDescription> _cameras;
    _cameras = await availableCameras();

    _cameraController = CameraController(
      _cameras[0],
      ResolutionPreset.max,
    );
    _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
    }).catchError((error) {
      print('Error: $error');

      if (error is CameraException) {
        print('Error Code: ${error.code}');
        print('Error Description: ${error.description}');

        switch (error.code) {
          case "CameraAccessDenied":
            print('Camera access error');
            break;
          // case CameraErrorCode.cameraPermission:
          //   print('Camera permission error');
          //   break;
          // case CameraErrorCode.unknown:
          //   print('Unknown error');
          //   break;
          default:
            print('Unknown error');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CameraPreview(),
    );
  }
}
