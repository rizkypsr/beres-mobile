import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/Screen/Home/Component/response.dart';
import 'package:ovo_ui/features/logs/models/customer.dart';

class TransferController extends GetxController {
  var isLoading = false.obs;
  var isLoadingPost = false.obs;
  var customer = Rx<Customer?>(null);
  var users = RxList<Customer>([]);

  Future<void> fetchMultipleUsers(List<String> usersId) async {
    isLoading.value = true;

    users.clear();

    try {
      List<Future<http.Response>> fetchFutures = usersId.map((id) {
        return http.get(Uri.parse('${baseUrlApi}/customerget/$id'));
      }).toList();

      List<http.Response> responses = await Future.wait(fetchFutures);

      for (var response in responses) {
        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          Map<String, dynamic> customerData = data['data'];

          users.add(Customer.fromJson(customerData));
        } else {
          throw Exception('Failed to fetch user data');
        }
      }

      print(users);
    } catch (error) {
      error.printError();
      Fluttertoast.showToast(
        msg: 'Error: $error',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      throw error;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchUser(String id) async {
    isLoading.value = true;

    final response =
        await http.get(Uri.parse('${baseUrlApi}/customerget/${id}'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      Map<String, dynamic> customerData = data['data'];

      print(customerData);

      customer.value = Customer.fromJson(customerData);

      isLoading.value = false;
    } else {
      throw Exception('Gagal mendapatkan data user');
    }

    try {
      final response =
          await http.get(Uri.parse('${baseUrlApi}/customerget/${id}'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        Map<String, dynamic> customerData = data['data'];

        print(customerData);

        customer.value = Customer.fromJson(customerData);

        isLoading.value = false;
      } else {
        throw Exception('Gagal mendapatkan data user');
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

  Future<void> postTransfer(
      String pengirimId, String penerimaId, int nominal) async {
    isLoadingPost.value = true;

    try {
      final response = await http.post(
        Uri.parse("${baseUrlApi}/transferadd/${pengirimId}"),
        body: {'penerima': penerimaId, 'nominal': nominal.toString()},
      );

      if (response.statusCode == 200) {
        // navigate to challenge_screen, and clear all previous screen
        Get.offAll(SuccessPage());
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final String errorMessage = responseData['message'];

        Get.snackbar(
          'Error',
          'Gagal melakukan Transfer: $errorMessage',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (error) {
      error.printError();

      Get.snackbar(
        'Error',
        'Gagal melakukan Transfer: $error',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoadingPost(false);
    }
  }
}
