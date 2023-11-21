import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JemputSampahservices {
  static Future jemputsampahjs(String nama, String nomor, String alamat,
      String jenis_sampah, int kecamatan) async {
    var uri = Uri.parse(jemputsampahUrl);
    var request = http.MultipartRequest("POST", uri);
    request.fields['nama_layanan'] = nama;
    request.fields['no_hp_layanan'] = nomor;
    request.fields['alamat_layanan'] = alamat;
    request.fields['jenis_sampah_layanan'] = jenis_sampah;
    request.fields['kecamatan_layanan'] = kecamatan.toString();

    var response = await request.send();
    //     .timeout(Duration(seconds: ), onTimeout: () {
    //   throw Exception("Connection time out, please try again!");
    // });
    var response2 = await http.Response.fromStream(response);
    print(response);
    print(response2.body);

    var json = jsonDecode(response2.body);
    return json;
  }
}
