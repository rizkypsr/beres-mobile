import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';

class getTeleGetJson {
  static Future getTelegetJs() async {
    try {
      final response = await http.get(
        Uri.parse(TeleUrl),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<TeleJsModel> wa = it.map((e) => TeleJsModel.fromJson(e)).toList();
        return wa;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
