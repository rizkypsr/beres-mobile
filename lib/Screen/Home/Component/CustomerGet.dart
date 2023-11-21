import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';

class getCustomerGetJson {
  static Future getCustomerGetJs(id) async {
    try {
      final response = await http.get(
        Uri.parse(customergetUrl + '/${id}'),
      );
      if (response.statusCode == 200) {
        print(response.body);
        var it = jsonDecode(response.body)['data'];
        customerModel customerget = customerModel.fromJson(it);
        return customerget;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
