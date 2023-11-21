import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Transferservices {
  static Future Transferjs(String id, String penerima, String nominal) async {
    print(id);
    print(penerima);
    var uri = Uri.parse(TransferUrl + '/${id}');
    var request = http.MultipartRequest("POST", uri);
    request.fields['penerima'] = penerima;
    request.fields['nominal'] = nominal;

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
