import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class customerservices {
  static Future customerservicespost(String id_customer , String pin) async {
    try {
      var uri = Uri.parse(customerUrl);
      var request = http.MultipartRequest("POST", uri);
      request.fields['id_customer'] = id_customer;
      request.fields['pin_customer'] = pin;
      
      print("call api");
      print(id_customer);
      print(pin);
      var response = await request
          .send();
      //     .timeout(Duration(seconds: ), onTimeout: () {
      //   throw Exception("Connection time out, please try again!");
      // });
      var response2 = await http.Response.fromStream(response);

      var json = jsonDecode(response2.body);
      return json;
    } catch (e) {
      print(e);
    }
  }
}