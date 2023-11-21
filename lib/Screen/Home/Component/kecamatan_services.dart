import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';

class getKecamatanJson{
static Future getKecamatanJs() async {
    try {
      final response = await http
          .get(Uri.parse(kecamatanUrl),);
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body)['data'];
        print(it);
        List<KotaJSModel> kecamatan =
            it.map((e) => KotaJSModel.fromJson(e)).toList();
        return kecamatan;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  }
