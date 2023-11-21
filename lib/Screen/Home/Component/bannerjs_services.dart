import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';

class getbannerJson{
static Future getbannerJs() async {
    try {
      final response = await http
          .get(Uri.parse(bannerUrl));
      if (response.statusCode == 200) {
        print("cek response");
        print(response.body);
        Iterable it = jsonDecode(response.body)['data'];
        List<Bannermodel> bannerget =
            it.map((e) => Bannermodel.fromJson(e)).toList();
        return bannerget;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  }