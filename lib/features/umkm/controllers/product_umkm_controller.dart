import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/features/umkm/models/product_umkm.dart';
import 'package:http/http.dart' as http;

class ProductUmkmController extends GetxController {
  var isLoadingProduct = false.obs;
  var products = <ProductUmkm>[].obs;

  Future<void> fetchProduct(int id) async {
    isLoadingProduct.value = true;

    try {
      final response =
          await http.get(Uri.parse('${baseUrlApi}/produkumkm/${id}'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> articleList = List.from(data['data']);

        List<ProductUmkm> parsedArticles = articleList
            .map((articleData) => ProductUmkm.fromJson(articleData))
            .toList();

        print(parsedArticles);

        products.value = parsedArticles;
      } else {
        isLoadingProduct.value = false;
        throw Exception('Gagal mendapatkan data produk umkm');
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
      isLoadingProduct.value = false;
    }
  }
}
