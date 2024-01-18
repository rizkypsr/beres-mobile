import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/features/home/presentations/home_screen.dart';
import 'package:ovo_ui/main_screen.dart';

class SaveUserChallenge extends GetxController {
  final String apiUrl = '$baseUrlApi/user-challenges';

  RxBool isLoading = false.obs;

  Future<void> postVideo({
    required String judul,
    String? subjudul,
    String? deskripsi,
    File? video,
    required int challengeId,
    required int userId,
    required String userType,
    List<File>? images,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.fields['judul'] = judul;
      if (subjudul != null) {
        request.fields['subjudul'] = subjudul;
      }
      if (deskripsi != null) {
        request.fields['deskripsi'] = deskripsi;
      }
      request.fields['challenge_id'] = challengeId.toString();
      request.fields['user_id'] = userId.toString();

      if (video != null) {
        request.files.add(
          http.MultipartFile.fromBytes('link', video.readAsBytesSync(),
              filename: video.path.split('/').last),
        );
      }

      if (images != null && images.isNotEmpty) {
        for (var image in images) {
          request.files.add(
            http.MultipartFile.fromBytes('image[]', image.readAsBytesSync(),
                filename: image.path.split('/').last),
          );
        }
      }

      isLoading(true);

      var response = await request.send();

      print(response);

      if (response.statusCode == 201) {
        Get.snackbar(
          'Success',
          'Berhasil mengikuti challenge',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // navigate to challenge_screen, and clear all previous screen
        Get.offAll(MainScreen());
      } else {
        Get.snackbar(
          'Error',
          'Gagal submit',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (error) {
      Get.snackbar(
        'Error',
        'Gagal submit: $error',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}
