import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';

class getWaGetJson {
  static Future getWagetJs() async {
    try {
      final response = await http.get(
        Uri.parse(waUrl),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<WaJsModel> wa = it.map((e) => WaJsModel.fromJson(e)).toList();
        return wa;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
