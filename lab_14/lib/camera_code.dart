import 'dart:io';
import 'dart:typed_data'; // Для роботи з байтами у веб
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart'; // Для роботи з веб
import 'package:flutter/foundation.dart'; // Для `kIsWeb`
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  File? _image; // Для мобільних платформ
  Uint8List? _webImage; // Для веб-платформи
  final ImagePicker _picker = ImagePicker();
  String? _imageDate;
  String? _nativeString;

  // Налаштовуємо MethodChannel для взаємодії з нативним кодом
  static const platform = MethodChannel('com.example/native_demo_app');

  // Метод для отримання нативного тексту
  Future<void> _getNativeString() async {
    try {
      final String result = await platform.invokeMethod('getStaticString');
      setState(() {
        _nativeString = result;
      });
    } on PlatformException catch (e) {
      setState(() {
        _nativeString = "Failed to get native string: '${e.message}'";
      });
    }
  }

  // Метод для відкриття камери та фотографування
  Future<void> _takePicture() async {
    if (kIsWeb) {
      // Для веб
      final pickedFile = await ImagePickerWeb.getImageAsBytes();
      setState(() {
        if (pickedFile != null) {
          _webImage = pickedFile;
        }
      });
    } else {
      // Для мобільних платформ
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          _imageDate = DateFormat('yyyy-MM-dd – kk:mm').format(
            File(pickedFile.path).lastModifiedSync(),
          );
        }
      });
    }
  }

  // Метод для показу діалогу з даними
  void _showDateDialog() {
    _getNativeString();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.all(20),
          title: Column(
            children: [
              Icon(Icons.info, size: 50, color: Colors.blue),
              SizedBox(height: 10),
              Text(
                'Native Data:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text(
            _nativeString ?? 'No native string available',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera App')),
      body: Stack(
        children: [
          Center(
            child: _webImage == null && _image == null
                ? Text('No image selected.')
                : kIsWeb
                ? Image.memory(
              _webImage!,
              height: 400,
              width: 400,
              fit: BoxFit.contain,
            )
                : Image.file(
              _image!,
              height: 400,
              width: 400,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                onPressed: _showDateDialog,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text('Show Native String'),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: _takePicture,
              tooltip: 'Take Picture',
              child: Icon(Icons.camera),
            ),
          ),
        ],
      ),
    );
  }
}
