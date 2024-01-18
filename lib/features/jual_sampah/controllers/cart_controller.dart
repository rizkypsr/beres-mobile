import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/Screen/Home/Component/response.dart';
import 'package:ovo_ui/features/home/entitties/kecamatan.dart';
import 'package:ovo_ui/features/jual_sampah/models/cart.dart';
import 'package:ovo_ui/features/jual_sampah/models/cart_data.dart';
import 'package:ovo_ui/features/jual_sampah/models/product.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  var total = 0.0.obs;
  RxList<Cart> cart = <Cart>[].obs;

  var isLoading = false.obs;
  var isLoadingKecamatan = false.obs;
  var products = <Product>[].obs;
  var kecamatan = <Kecamatan>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchKecamatan();
  }

  void updateTotal(int price, double newQuantity, Product product) {
    // Find the cart item corresponding to the product
    Cart? existingCartItem = cart.firstWhereOrNull((c) => c.id == product.id);

    double oldQuantity = 0.0;
    if (existingCartItem != null) {
      // If the item exists in the cart, get the old quantity
      oldQuantity = existingCartItem.cartData.quantity;
      // Update the quantity in the cart
      existingCartItem.cartData.quantity = newQuantity;
    } else {
      // If the item does not exist, add it to the cart
      cart.add(Cart(
        id: product.id,
        cartData: CartData(
          product: product,
          quantity: newQuantity,
        ),
      ));
    }

    // Calculate the quantity difference
    double quantityDifference = newQuantity - oldQuantity;

    // Adjust the total value
    total.value += (price * quantityDifference);
  }

  Future<void> fetchProduct(int id) async {
    isLoading.value = true;

    resetTotal();

    try {
      final response =
          await http.get(Uri.parse('${baseUrlApi}/produkjs/${id}'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> articleList = List.from(data['data']);

        List<Product> parsedArticles = articleList
            .map((articleData) => Product.fromJson(articleData))
            .toList();

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

  Future postTransfer(String id, String penerima, String nominal) async {
    var uri = Uri.parse(TransferUrl + '/${id}');
    var request = http.MultipartRequest("POST", uri);
    request.fields['penerima'] = penerima;
    request.fields['nominal'] = nominal;

    var response = await request.send();

    if (response.statusCode == 201) {
      Get.offAll(SuccessPage());
    } else {
      Get.snackbar(
        'Error',
        'Gagal submit',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void resetTotal() {
    total.value = 0;
    cart.value = <Cart>[];
  }
}
