import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/features/env_learning/presentations/env_learning_form_screen.dart';

class PinCheckController extends GetxController {
  final isLoading = false.obs;

  Future<void> checkPin({
    required String userId,
    required String pin,
  }) async {
    try {
      isLoading.value = true;

      print({
        'user_id': userId,
        'pin': pin,
      });

      final response = await http.post(
        Uri.parse('$baseUrlApi/elearnings/check-pin'),
        body: {
          'user_id': userId,
          'pin': pin,
        },
      );

      final Map<String, dynamic> responseData = json.decode(response.body);

      print(responseData);

      if (responseData.containsKey('valid')) {
        bool isValid = responseData['valid'];
        String message = responseData['message'] ?? '';

        if (isValid) {
          String userType = responseData['user_type'] ?? '';

          Get.back(result: {
            'userId': userId,
            'userType': userType,
          });
        } else {
          Get.snackbar(
            'Gagal',
            message,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'Terjadi kesalahan',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }

      isLoading.value = false;
    } catch (error) {
      print('Error: $error');

      isLoading.value = false;
    }
  }
}
