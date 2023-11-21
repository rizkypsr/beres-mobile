import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';

class getPPOBdetailJson{
static Future getPPOBdetailJs(id) async {
    try {
      final response = await http
          .get(Uri.parse(detailPPOBUrl+'/${id}'),);
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body)['data'];
        List<detailPPOBmodel> ppobdetail =
            it.map((e) => detailPPOBmodel.fromJson(e)).toList();
        return ppobdetail;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  }
