import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Screen/Home/Component/response.dart';
import 'package:ovo_ui/features/home/entitties/kecamatan.dart';
import 'package:ovo_ui/features/jual_sampah/controllers/cart_controller.dart';
import 'package:ovo_ui/features/jual_sampah/models/cart.dart';
import 'package:ovo_ui/features/jual_sampah/models/product.dart';

class JualSampahController extends GetxController {
  var isLoading = false.obs;
  var isLoadingKecamatan = false.obs;
  var products = <Product>[].obs;
  var kecamatan = <Kecamatan>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchKecamatan();
  }

  Future<void> fetchProduct(int id) async {
    isLoading.value = true;

    try {
      final response =
          await http.get(Uri.parse('${baseUrlApi}/produkjs/${id}'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> articleList = List.from(data['data']);

        List<Product> parsedArticles = articleList
            .map((articleData) => Product.fromJson(articleData))
            .toList();

        print(articleList);

        products.value = parsedArticles;
      } else {
        isLoading.value = false;
        throw Exception('Gagal mendapatkan data produk  ');
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
      error.printError();
      Fluttertoast.showToast(
        msg: 'Error: Gagal mendapatkan data kecamatan',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } finally {
      isLoadingKecamatan.value = false;
    }
  }

  /**
   * 
   * ID Produk
   * Jumlah per produk
   */

  Future jualsampahjs(
    String id_user,
    List<Cart> listCart,
  ) async {
    var uri = Uri.parse(jualsampahUrl + '/' + id_user);

    print(jsonEncode(listCart.map((e) => e.toJson()).toList()));

    isLoading(true);

    try {
      var response = await http.post(
        uri,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "jenissampah_js": listCart.map((e) => e.toJson()).toList(),
        }),
        encoding: Encoding.getByName("utf-8"),
      );

      print(response.body);

      if (response.statusCode == 200) {
        Get.delete<CartController>();
        Get.delete<JualSampahController>();
        Get.to(() => SuccessPage());
      } else {
        throw Exception('Gagal melakukan Transaksi');
      }
    } catch (error) {
      error.printError();
      Get.snackbar(
        'Error',
        'Gagal melakukan Transaksi: $error',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}
