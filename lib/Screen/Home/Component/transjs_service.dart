import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ovo_ui/Constant/ProductJsModel.dart';


class jualsampahJson {
  static Future jualsampahjs( String id_user, List<JenisSampahBody> listsampah) async {
    var uri = Uri.parse(jualsampahUrl + '/' +id_user);

    print("test body");
    print(jsonEncode(listsampah.map((e) => e.toJson()).toList()));
    var response = await http.post(
      uri,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "jenissampah_js": listsampah.map((e) => e.toJson()).toList(),
      }),
      encoding: Encoding.getByName("utf-8"),
    );

    var json = jsonDecode(response.body);
    print("result");
    print(json);
    return json;
  }
}