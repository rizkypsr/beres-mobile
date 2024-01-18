import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoUploadController extends GetxController {
  Rx<File?> selectedVideo = Rx<File?>(null);
  RxList<File> selectedImages = RxList<File>();

  void pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null && result.files.isNotEmpty) {
      File file = File(result.files.single.path!);

      if (file.lengthSync() > 20 * 1024 * 1024) {
        Get.snackbar(
          'Error',
          "Ukuran video harus kurang dari 20MB",
          backgroundColor: Colors.red,
        );
        return;
      }

      // Check file extension manually
      String extension = file.path.split('.').last.toLowerCase();
      if (!['mp4', 'mov', 'avi'].contains(extension)) {
        Get.snackbar(
          'Error',
          "File harus berupa video (MP4, MOV, AVI)",
          backgroundColor: Colors.red,
        );
        return;
      }

      selectedVideo.value = file;
    }
  }

  void pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true, // Allow multiple file selection
    );

    if (result != null && result.files.isNotEmpty) {
      List<File> files = result.files.map((file) => File(file.path!)).toList();

      // Iterate over the selected files
      for (var file in files) {
        if (file.lengthSync() > 2 * 1024 * 1024) {
          Get.snackbar(
            'Error',
            "Ukuran gambar harus kurang dari 2MB",
            backgroundColor: Colors.red,
          );
          return; // If any file is too large, return
        }

        // Check file extension manually
        String extension = file.path.split('.').last.toLowerCase();
        if (!['jpg', 'jpeg', 'png'].contains(extension)) {
          Get.snackbar(
            'Error',
            "File harus berupa gambar (JPG, JPEG, PNG)",
            backgroundColor: Colors.red,
          );
          return; // If any file has the wrong format, return
        }
      }

      selectedImages.addAll(files); // Add all files to the selectedImages list
    }
  }
}
