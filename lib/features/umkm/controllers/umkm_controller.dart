import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/features/home/entitties/kecamatan.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/features/umkm/models/umkm.dart';

class UmkmController extends GetxController {
  var isLoading = false.obs;
  var isLoadingKecamatan = false.obs;
  var umkm = <Umkm>[].obs;
  var kecamatan = <Kecamatan>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchKecamatan();
  }

  Future<void> fetchUmkm(int id) async {
    isLoading.value = true;

    try {
      final response = await http.get(Uri.parse('${baseUrlApi}/umkm/${id}'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> articleList = List.from(data['data']);

        print(articleList);

        List<Umkm> parsedArticles = articleList
            .map((articleData) => Umkm.fromJson(articleData))
            .toList();

        umkm.value = parsedArticles;
      } else {
        isLoading.value = false;
        throw Exception('Gagal mendapatkan data umkm');
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

  Future<void> fetchKecamatan() async {
    isLoadingKecamatan.value = true;

    try {
      final response = await http.get(Uri.parse('${baseUrlApi}/kecamatan'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> articleList = List.from(data['data']);

        List<Kecamatan> parsedArticles = articleList
            .map((articleData) => Kecamatan.fromJson(articleData))
            .toList();

        kecamatan.value = parsedArticles;
      } else {
        isLoadingKecamatan.value = false;
        throw Exception('Gagal mendapatkan data kecamatan');
      }
    } catch (error) {
      Fluttertoast.showToast(
        msg: 'Error: $error',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } finally {
      isLoadingKecamatan.value = false;
    }
  }
}
