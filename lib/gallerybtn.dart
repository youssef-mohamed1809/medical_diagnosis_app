import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryButton extends StatefulWidget {
  const GalleryButton({super.key});

  @override
  State<GalleryButton> createState() => _GalleryButtonState();
}

class _GalleryButtonState extends State<GalleryButton> {
  File? _image;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(
      () => _image = imageTemporary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: getImage,
      child: const Text(
        "Select a photo from gallery",
      ),
    );
  }
}
