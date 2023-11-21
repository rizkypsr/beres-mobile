import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';

class getProductUmkmJson{
static Future getProductUmkmJs(id) async {
    try {
      final response = await http
          .get(Uri.parse(productUmkmUrl+'/${id}'),);
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<ProductUMKMmodel> proumkm =
            it.map((e) => ProductUMKMmodel.fromJson(e)).toList();
        return proumkm;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  }