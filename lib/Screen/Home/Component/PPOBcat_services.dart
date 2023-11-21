import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';

class getCatPPOBJson{
static Future getCatPPOBJs() async {
    try {
      final response = await http
          .get(Uri.parse(ppobcatUrl),);
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body)['data'];
        print(it);
        List<CatPPOBmodel> category =
            it.map((e) => CatPPOBmodel.fromJson(e)).toList();
        return category;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  }
