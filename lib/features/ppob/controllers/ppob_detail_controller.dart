import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/features/ppob/models/ppob_detail.dart';
import 'package:http/http.dart' as http;

class PpobDetailController extends GetxController {
  var isLoading = false.obs;
  var ppob = <PpobDetail>[].obs;
  var selectedPpob = PpobDetail().obs;

  void setSelectedPpob(PpobDetail ppobDetail) {
    selectedPpob.value = ppobDetail;
  }

  Future<void> fetchPpob(int id) async {
    isLoading.value = true;

    try {
      final response =
          await http.get(Uri.parse('${baseUrlApi}/detailppob/${id}'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> articleList = List.from(data['data']);

        List<PpobDetail> parsedArticles = articleList
            .map((articleData) => PpobDetail.fromJson(articleData))
            .toList();

        print(parsedArticles);
        ppob.value = parsedArticles;
      } else {
        isLoading.value = false;
        throw Exception('Gagal mendapatkan data artikel');
      }
    } catch (error) {
      error.printError();
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
