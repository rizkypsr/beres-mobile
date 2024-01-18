import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:http/http.dart' as http;
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/features/home/entitties/kecamatan.dart';

class getKecamatanJson {
  static Future getKecamatanJs() async {
    try {
      final response = await http.get(Uri.parse(kecamatanUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> articleList = List.from(data['data']);

        List<Kecamatan> parsedArticles = articleList
            .map((articleData) => Kecamatan.fromJson(articleData))
            .toList();

        print(parsedArticles);

        return parsedArticles;
      } else {
        throw Exception('Gagal mendapatkan data kecamatan');
      }
    } catch (error) {
      throw Exception('Gagal mendapatkan data kecamatan');
    }
  }
}
