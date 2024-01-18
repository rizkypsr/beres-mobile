import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/features/home/entitties/info.dart';

class InfoController extends GetxController {
  final List<Info> info = <Info>[].obs;
  final isLoading = false.obs;
  final currentIndex = 0.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse('${baseUrlApi}/banner'));

      print('mamad: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> infoList = List.from(data['data']);

        List<Info> parsedInfo =
            infoList.map((infoData) => Info.fromJson(infoData)).toList();

        info.assignAll(parsedInfo);
        isLoading.value = false;
      } else {
        throw Exception('Gagal mendapatkan data info');
      }
    } catch (error) {
      throw Exception('Error: $error');
      Fluttertoast.showToast(
        msg: 'Error: $error',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
