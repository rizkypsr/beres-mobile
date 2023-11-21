import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class transppobservices {
  static Future transppob(int id, String id_user , String input, String pinpass) async {
    var uri = Uri.parse(transPPOBUrl+'/${id_user}');
    var request = http.MultipartRequest("POST", uri);
    request.fields['produk_transaksi_ppob'] = id.toString();
    request.fields['nomor_inputan'] = input;
    request.fields['pin_customer']=pinpass;
    

    var response = await request
        .send();
    //     .timeout(Duration(seconds: ), onTimeout: () {
    //   throw Exception("Connection time out, please try again!");
    // });
    var response2 = await http.Response.fromStream(response);

    var json = jsonDecode(response2.body);
    return json;
  }
}