import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:time_managment_app/views/login_screen/providers/inputed_values_provider.dart';

class UserImagePicker extends ConsumerStatefulWidget {
  const UserImagePicker({
    required this.height,
    required this.opacity,
    super.key,
  });
  final double height;

  final Animation<double> opacity;

  @override
  ConsumerState<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends ConsumerState<UserImagePicker> {
  File? _pickedImage;
  void _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedImageFile = await _picker.pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 150);
    setState(() {
      _pickedImage = File(pickedImageFile!.path);
    });
    ref.refresh(inputedValuesProvider).userImage = _pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: widget.opacity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            child: CircleAvatar(
              radius: widget.height,
              backgroundImage:
                  _pickedImage != null ? FileImage(_pickedImage!) : null,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: widget.height,
            child: TextButton(
              onPressed: _pickImage,
              child: const Text("Add image"),
            ),
          ),
        ],
      ),
    );
  }
}
