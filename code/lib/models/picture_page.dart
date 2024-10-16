import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'navigation_menu.dart';

class PicturePage extends StatefulWidget {
  const PicturePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PicturePageState createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  Future<void> _takePicture() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          _imageFile = image;
        });
      }
    } catch (e) {
      stderr.writeln("Error taking picture: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Picture'),
        actions: const [
          NavigationMenu(),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_imageFile != null)
            Image.file(
              File(_imageFile!.path),
              width: 200,
              height: 200,
            ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: _takePicture,
              style: ButtonStyles.primaryButton,
              child: const Text('Open Camera'),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonStyles {
  static final ButtonStyle primaryButton = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );
}
