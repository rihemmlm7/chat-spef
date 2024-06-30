import 'package:flutter/material.dart';
import 'dart:io';

class FullScreenImagePage extends StatelessWidget {
  final File imageFile;

  const FullScreenImagePage({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.pop(context), // Tap to close the image
        child: Center(
          child: Image.file(imageFile, fit: BoxFit.contain), // Ensures the image is contained properly within the screen
        ),
      ),
    );
  }
}
