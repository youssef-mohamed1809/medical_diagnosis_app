// Navigator.push(context,
//     MaterialPageRoute(builder: (context) => MainScreen()));
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_diagnosis_app/result.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  File? image;
  bool photoPresent = false;
  Future openCamera(String scanType) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
        photoPresent = true;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ResultScreen(scanType, File(image.path))));
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future openGallery(String scanType) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ResultScreen(scanType, File(image.path))));
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("XRay Scan"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => openCamera("XRay"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(80, 80),
                        shape: const CircleBorder(),
                      ),
                      child: const Center(
                        child: Text(
                          "Take a photo",
                          style: TextStyle(),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  onPressed: () => openGallery("XRay"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(80, 80),
                    shape: const CircleBorder(),
                  ),
                  child: const Center(
                    child: Text(
                      "Open Gallery",
                      style: TextStyle(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            const Text("MRI Scan"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => openCamera("MRI"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(80, 80),
                        shape: const CircleBorder(),
                      ),
                      child: const Center(
                        child: Text(
                          "Take a photo",
                          style: TextStyle(),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  onPressed: () => openGallery("MRI"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(80, 80),
                    shape: const CircleBorder(),
                  ),
                  child: const Center(
                    child: Text(
                      "Open Gallery",
                      style: TextStyle(),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
