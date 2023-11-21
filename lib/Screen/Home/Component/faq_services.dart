import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';

class getFAQJson {
  static Future getFAQJs() async {
    try {
      final response = await http.get(
        Uri.parse(faqUrl),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<FAQmodel> product = it.map((e) => FAQmodel.fromJson(e)).toList();
        return product;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
