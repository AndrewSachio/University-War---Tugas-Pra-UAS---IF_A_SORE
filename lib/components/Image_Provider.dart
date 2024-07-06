import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageProviderclass extends ChangeNotifier {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  File? get imageFile => _imageFile;

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  void clearImage() {
    _imageFile = null;
    notifyListeners();
  }
}
