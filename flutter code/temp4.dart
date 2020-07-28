import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'intermediate.dart';
import 'drawer.dart';
import 'bar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class CameraScreen extends StatefulWidget {
  int id;
  CameraScreen(int id) {
    this.id = id;
  }
  @override
  _CameraScreenState createState() => _CameraScreenState(id);
}

class _CameraScreenState extends State {
  CameraController controller;
  List cameras;
  int selectedCameraIndex;
  String imgPath;
  int id;
  int isFront;
  var test = new Map<String, dynamic>();

  _CameraScreenState(this.id);

  Future uploadFile() async {
    var request = http.MultipartRequest('POST', Uri.parse("http://140.134.27.136:5000"));
    request.files.add(await http.MultipartFile.fromPath('image', imgPath));
    var res = await request.send();
    res.stream.transform(utf8.decoder).listen((value) async {
      test = await jsonDecode(value);
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIndex = 1;
          isFront = 1;
        });
        _initCameraController(cameras[selectedCameraIndex]).then((void v) {});
      } else {
        print('No camera available');
      }
    }).catchError((err) {
      print('Error :${err.code}Error message : ${err.message}');
    });
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(cameraDescription, ResolutionPreset.high,
        enableAudio: false);

    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    NavDrawerExample navDrawerExample = new NavDrawerExample();
    Toptitle toptitle = new Toptitle();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:toptitle.Topbar(context,'膚況檢測',id),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 20,
                  color: Color(0xFFFFD0D1),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '拍照',
                  style: TextStyle(
                    fontFamily: 'GFSDidot',
                    color: const Color(0xFF818181),
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 330,
                      height: 520,
                      child: _cameraPreviewWidget(),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 80,
                        padding: EdgeInsets.all(15),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _cameraToggleRowWidget(),
                            _cameraControlWidget(context),
                            Spacer()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        drawer: navDrawerExample.drawer(context),
      ),
    );
  }

  /// Display Camera preview.
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }

  /// Display the control bar with buttons to take pictures
  Widget _cameraControlWidget(context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(
                Icons.camera,
                color: Colors.black,
                size: 35,
              ),
              backgroundColor: Colors.white70,
              onPressed: () {
                _onCapturePressed(context);
              },
            )
          ],
        ),
      ),
    );
  }

  /// Display a row of toggle to select the camera (or a message if no camera is available).
  Widget _cameraToggleRowWidget() {
    if (cameras == null || cameras.isEmpty) {
      return Spacer();
    }
    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: FlatButton.icon(
          onPressed: _onSwitchCamera,
          icon: Icon(
            _getCameraLensIcon(lensDirection),
            color: Colors.black,
            size: 24,
          ),
          label: Text(
            '${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1).toUpperCase()}',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  IconData _getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        isFront = 0;
        return CupertinoIcons.switch_camera;
      case CameraLensDirection.front:
        isFront = 1;
        return CupertinoIcons.switch_camera_solid;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        return Icons.device_unknown;
    }
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error:${e.code}\nError message : ${e.description}';
    print(errorText);
  }

  void _onCapturePressed(context) async {
    try {
      final path = join((await getTemporaryDirectory()).path, '${DateTime.now()}.jpg');
      await controller.takePicture(path);
      imgPath = path;
      await uploadFile();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IntermediateScreen(imgPath, id, isFront)),
      );
    } catch (e) {
      _showCameraException(e);
    }
  }

  void _onSwitchCamera() {
    selectedCameraIndex =
    selectedCameraIndex < cameras.length - 1 ? selectedCameraIndex + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    _initCameraController(selectedCamera);
  }
}
