import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';

class getQurbanJson {
  static Future getQurbanJs() async {
    try {
      final response = await http.get(
        Uri.parse(qurbanUrl),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Qurbanmodel> product =
            it.map((e) => Qurbanmodel.fromJson(e)).toList();
        return product;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
