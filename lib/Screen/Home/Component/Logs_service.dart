import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';

class getLogsJson {
  static Future getLogsPPOBJs(id) async {
    try {
      final response = await http.get(
        Uri.parse(LogsUrl + '/${id}'),
      );
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body)['data'];

        List<LogsModel> product = it.map((e) => LogsModel.fromJson(e)).toList();

        return product;
      }
    } catch (e) {
      print("Error ketika convert");
      print(e);
      print(e.toString());
    }
  }

  // static Future getLogsJsJs(id) async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse(LogsUrl+'/${id}'),
  //     );
  //     if (response.statusCode == 200) {
  //       Iterable it = jsonDecode(response.body)['data_jual_sampah'];
  //       List<LogsModel> product = it.map((e) => LogsModel.fromJson(e)).toList();
  //       return product;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // static Future getLogsTfJs(id) async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse(LogsUrl+'/${id}'),
  //     );
  //     if (response.statusCode == 200) {
  //       Iterable it = jsonDecode(response.body)['data_transfer'];
  //       List<LogsModel> product = it.map((e) => LogsModel.fromJson(e)).toList();
  //       return product;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // static Future getLogsbyrtokoJs(id) async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse(LogsUrlbyrtoko+'/${id}'),
  //     );
  //     if (response.statusCode == 200) {
  //       print(response.body);
  //       Iterable it = jsonDecode(response.body)['data_bayartoko'];
  //       List<LogsModel> product = it.map((e) => LogsModel.fromJson(e)).toList();
  //       return product;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
