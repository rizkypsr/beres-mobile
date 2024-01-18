import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/features/env_learning/controllers/video_upload_controller.dart';

class FileInputField extends StatelessWidget {
  const FileInputField({
    Key? key,
    required this.label,
    this.selectedFile,
    this.onPressed,
    this.onDelete,
  }) : super(key: key);

  final File? selectedFile;
  final String label;
  final Function()? onPressed;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(label),
        ),
        selectedFile != null ? SizedBox(height: 16) : SizedBox.shrink(),
        selectedFile != null
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedFile!.path.split('/').last, // Display file name
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: onDelete,
                      icon: Icon(Icons.delete, color: Colors.red),
                    )
                  ],
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
