import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController? cameraController;
  List<CameraDescription> cameras = [];
  getCamera() async {
    cameras = await availableCameras();
    
    cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraController?.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  void initState() {
    getCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cameraController == null
          ? Center(child: CircularProgressIndicator())
          : CameraPreview(cameraController!),
    );
  }
}
