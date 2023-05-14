import 'package:flutter/material.dart';
import 'package:medical_diagnosis_app/gallerybtn.dart';

import 'camerabtn.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Welcome {Patient Name}"),
          Row(
            children: const [
              GalleryButton(),
              CameraButton(),
            ],
          )
        ],
      ),
    );
  }
}
