import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/features/env_learning/controllers/save_user_challenge.dart';
import 'package:ovo_ui/features/env_learning/controllers/video_upload_controller.dart';
import 'package:ovo_ui/features/env_learning/presentations/widgets/file_input_field.dart';
import 'package:ovo_ui/features/env_learning/presentations/widgets/image_picker_field.dart';
import 'package:ovo_ui/features/verification/widgets/text_field_regular.dart';
import 'package:ovo_ui/features/verification/widgets/verification_button.dart';

class EnvLearningFormScreen extends StatelessWidget {
  EnvLearningFormScreen({Key? key}) : super(key: key);

  final VideoUploadController controller = Get.put(VideoUploadController());
  final SaveUserChallenge saveUserChallenge = Get.put(SaveUserChallenge());

  final TextEditingController judulController = TextEditingController();
  final TextEditingController subjudulController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final int challengeId = Get.arguments['challengeId'];
    final int userId = int.parse(Get.arguments['userId']);
    final String userType = Get.arguments['userType'];

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: darkpurple,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Form Challenge',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 32),
              TextFieldRegular(hintText: 'Judul', controller: judulController),
              const SizedBox(height: 14),
              TextFieldRegular(
                  hintText: 'Sub Judul', controller: subjudulController),
              const SizedBox(height: 14),
              TextFieldRegular(
                  hintText: 'Deskripsi', controller: deskripsiController),
              const SizedBox(height: 14),
              Obx(() {
                return ImagePickerField(
                  label: 'Pilih Gambar',
                  selectedFiles: controller.selectedImages.value,
                  onPressed: () {
                    // if (controller.selectedImages.value.isEmpty) {
                    //   controller.selectedImages.value = [];
                    // } else {
                    // }

                    controller.pickImage();
                  },
                  onDelete: (File file) {
                    controller.selectedImages.remove(file);
                  },
                );
              }),
              const SizedBox(height: 14),
              Obx(() {
                return FileInputField(
                  label: 'Pilih Video',
                  selectedFile: controller.selectedVideo.value,
                  onPressed: () {
                    controller.pickVideo();
                  },
                  onDelete: () {
                    controller.selectedVideo.value = null;
                  },
                );
              }),
              const SizedBox(height: 16),
              Obx(
                () => saveUserChallenge.isLoading.value
                    ? CircularProgressIndicator()
                    : VerificationButton(
                        label: "Submit",
                        onPressed: () {
                          if (judulController.text.isEmpty) {
                            Get.snackbar(
                              'Error',
                              'Judul wajib diisi!',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                            return;
                          }

                          if (controller.selectedImages.value.isNotEmpty ||
                              controller.selectedVideo.value != null) {
                            saveUserChallenge.postVideo(
                              judul: judulController.text,
                              subjudul: subjudulController.text,
                              deskripsi: deskripsiController.text,
                              challengeId: challengeId,
                              userId: userId,
                              userType: userType,
                              video: controller.selectedVideo.value,
                              images: controller.selectedImages.value,
                            );
                          } else {
                            Get.snackbar(
                              'Error',
                              'Gambar atau Video wajib diisi! Pilih salah satu!',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
