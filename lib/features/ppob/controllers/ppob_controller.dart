import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/Screen/Home/Component/response.dart';
import 'package:ovo_ui/features/ppob/controllers/ppob_detail_controller.dart';
import 'package:ovo_ui/features/ppob/models/ppob.dart';
import 'package:ovo_ui/features/ppob/models/ppob_detail.dart';
import 'package:ovo_ui/features/ppob/presentations/confirmation_ppob_screen.dart';

class PpobController extends GetxController {
  var isLoading = false.obs;
  var ppob = <Ppob>[].obs;
  var selectedPpob = Ppob().obs;
  var error = {}.obs;

  final PpobDetailController ppobDetailController =
      Get.put(PpobDetailController());

  @override
  void onInit() {
    fetchPpob();
    super.onInit();
  }

  void setSelectedPpob(Ppob ppobDetail) {
    selectedPpob.value = ppobDetail;
  }

  Future<void> fetchPpob() async {
    isLoading.value = true;

    try {
      final response = await http.get(Uri.parse('${baseUrlApi}/ppob'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> articleList = List.from(data['data']);

        List<Ppob> parsedArticles = articleList
            .map((articleData) => Ppob.fromJson(articleData))
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

  Future<void> postPpob({
    required String userId,
    required String produk,
  }) async {
    error.value = {};

    if (userId.isEmpty) {
      error["idPelanggan"] = "ID Pelanggan tidak boleh kosong";
    }

    if (error.isNotEmpty) {
      isLoading.value = false;
      Fluttertoast.showToast(
        msg: "Pastikan semua data terisi",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
      return;
    }

    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse("${baseUrlApi}/transaksippobadd/${userId}"));

      request.fields['produk_transaksi_ppob'] = produk;

      isLoading(true);

      var response = await request.send();

      print(response);

      if (response.statusCode == 200) {
        // navigate to challenge_screen, and clear all previous screen
        Get.offAll(SuccessPage());
      } else {
        Get.snackbar(
          'Error',
          'Gagal melakukan TopUp',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (error) {
      Get.snackbar(
        'Error',
        'Gagal melakukan TopUp: $error',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}
