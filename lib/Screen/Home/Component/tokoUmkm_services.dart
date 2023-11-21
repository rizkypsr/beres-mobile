import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';

class getTokoUmkmJson{
static Future getTokoUmkmJs(id) async {
    try {
      final response = await http
          .get(Uri.parse(tokoUmkmUrl+'/${id}'),);
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<TokoUMKMmodel> tokoumkm =
            it.map((e) => TokoUMKMmodel.fromJson(e)).toList();
        return tokoumkm;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  }