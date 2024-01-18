import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';

class getProductJson {
  // static Future getProductJs(id) async {
  //   print('id: $id');
  //   try {
  //     final response = await http.get(
  //       Uri.parse(productjsUrl + '/${id}'),
  //     );
  //     if (response.statusCode == 200) {
  //       print(response.body);
  //       Iterable it = jsonDecode(response.body);
  //       List<ProductJSModel> product =
  //           it.map((e) => ProductJSModel.fromJson(e)).toList();
  //       return product;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  static Future getProductJs(id) async {
    print(productjsUrl + '/${id}');
    try {
      final response = await http.get(Uri.parse(productjsUrl + '/${id}'));

      print(response.statusCode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> articleList = List.from(data['data']);

        List<ProductJSModel> parsedArticles = articleList
            .map((articleData) => ProductJSModel.fromJson(articleData))
            .toList();

        return parsedArticles;
      } else {
        throw Exception('Gagal mendapatkan data produk');
      }
    } catch (error) {
      print(error);
      throw Exception('Gagal mendapatkan data produk');
    }
  }
}
