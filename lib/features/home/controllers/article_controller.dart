import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/features/home/entitties/article.dart';
import 'package:http/http.dart' as http;

class ArticleController extends GetxController {
  final articles = <Article>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    print('fetch data');
    try {
      final response = await http.get(Uri.parse('${baseUrlApi}/artikel'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> articleList = List.from(data['data']);

        List<Article> parsedArticles = articleList
            .map((articleData) => Article.fromJson(articleData))
            .toList();

        print(articleList);

        articles.assignAll(parsedArticles);
        isLoading.value = false;
      } else {
        throw Exception('Gagal mendapatkan data artikel');
      }
    } catch (error) {
      print('dasdas $error');
      Fluttertoast.showToast(
        msg: 'Error: $error',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );

      isLoading.value = false;
    }
  }
}
