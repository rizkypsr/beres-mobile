import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/features/logs/models/ppob_transaction.dart';
import 'package:ovo_ui/features/ppob/models/ppob.dart';

class LogsPpobController extends GetxController {
  var logs = <PpobTransaction>[].obs;
  var isLoading = false.obs;

  Future<void> fetchData(String id, String type) async {
    isLoading.value = true;

    try {
      final response = await http.get(Uri.parse('${baseUrlApi}/log/$id/$type'));

      print(response.body);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        List<Map<String, dynamic>> articleList = List.from(data['data']);

        List<PpobTransaction> parsedArticles = articleList
            .map((articleData) => PpobTransaction.fromJson(articleData))
            .toList();

        logs.value = parsedArticles;
      } else {
        throw Exception('Gagal mendapatkan data logs');
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
