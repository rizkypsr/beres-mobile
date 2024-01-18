import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:ovo_ui/Screen/Home/Component/Logs.dart';
import 'package:ovo_ui/Screen/Home/Component/OVO_Cash.dart';
import 'package:ovo_ui/Screen/Home/Component/customer_services.dart';
import 'package:ovo_ui/Screen/Home/Component/response.dart';
import 'package:ovo_ui/Screen/Home/Component/transjs_service.dart';
import 'package:ovo_ui/Screen/Home/Component/transppob_services.dart';
import 'package:ovo_ui/Screen/Home/Component/userpayment.dart';
import 'package:ovo_ui/features/home/presentations/home_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PinPass extends StatefulWidget {
  final int? id_detail;
  final String? id_pelanggan;
  final String? id_user;
  final String? Tipe;
  final List<JenisSampahBody>? listSampah;

  PinPass(
      {this.id_detail,
      this.id_pelanggan,
      this.id_user,
      this.Tipe,
      this.listSampah});
  @override
  _PinPass createState() => _PinPass();
}

class _PinPass extends State<PinPass> {
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xFF0e8e83),
                      Color(0xFF0e8e83),
                    ])),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Pin Password',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 50),
                      buildPassword(),
                      SizedBox(height: 10),
                      // InkWell(
                      //   onTap: () {
                      //     return buildVerifBtn(UserPayment(user: Barcode.code),);
                      //   },
                      // ),
                      buildVerifBtn()
                      //          buildPhone(),
                      //        buildAddress(),
                      //      buildSentBtn(),
                      // Container(
                      //   height: 20,
                      //   child: Row(
                      //     children: <Widget>[
                      //       Theme(
                      //           data: ThemeData(unselectedWidgetColor: Colors.white),
                      //           // child: Checkbox(
                      //           //   value: isRememberMe,
                      //           //   checkColor: Colors.blue,
                      //           //   activeColor: Colors.white,
                      //           //   onChanged: (value) {
                      //           //     setState(() {
                      //           //       isRememberMe = value;
                      //           //     });
                      //           //   },
                      //           // )
                      //           ),
                      //       Text(
                      //         'Remember Me',
                      //         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      //  buildLoginBtn()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   'Password',
        //   style: TextStyle(
        //       color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        // ),
        SizedBox(height: 7),
        Container(
          margin: EdgeInsets.all(5),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 68,
          child: Center(
            child: TextField(
              maxLength: 6,
              keyboardType: TextInputType.numberWithOptions(),
              obscureText: true,
              style: TextStyle(color: Colors.black87, fontSize: 16),
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF0e8e83)),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget buildVerifBtn() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () async {
              print("ke klik ${widget.Tipe}");
              if (widget.Tipe == 'PPOB') {
                transppobservices();
                var response = await transppobservices.transppob(
                    widget.id_detail!,
                    widget.id_user!,
                    widget.id_pelanggan!,
                    controller.text);
                print(response);
                if (response['status'] == 'success') {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return (SuccessPage());
                  }));
                } else {
                  Fluttertoast.showToast(
                      msg: "Pin Salah, Masukkan Pin Kembali",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER);
                }
              } else if (widget.Tipe == 'Transfer') {
                var response = await customerservices.customerservicespost(
                    widget.id_user!, controller.text);
                if (response['status'] == 'success') {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return (UserPayment(
                      id_user: widget.id_user!,
                      saldo: response['data']['saldo_customer'],
                      nama: response['data']['nama_customer'],
                      alamat: response['data']['alamat_customer'],
                    ));
                  }));
                } else {
                  Fluttertoast.showToast(
                      msg: "Pin Salah, Masukkan Pin Kembali",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER);
                }
              } else if (widget.Tipe == 'Logs') {
                var response = await customerservices.customerservicespost(
                    widget.id_user!, controller.text);
                if (response['status'] == 'success') {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return (LogsPage(
                      id_user: widget.id_user,
                      // saldo: response['data']['saldo_customer'],
                      // nama: response['data']['nama_customer'],
                      // alamat: response['data']['alamat_customer'],
                    ));
                  }));
                } else {
                  Fluttertoast.showToast(
                      msg: "Pin Salah, Masukkan Pin Kembali",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER);
                }
              } else if (widget.Tipe == 'Jual Sampah') {
                var response = await jualsampahJson.jualsampahjs(
                    widget.id_user!, widget.listSampah!);
                print(response);
                if (response['status'] == 'success') {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SuccessPage();
                  }));
                } else {
                  Fluttertoast.showToast(
                      msg: "Anda Belum menjual sampah",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER);
                }
              } else {
                Fluttertoast.showToast(
                    msg: "Pin Salah, Masukkan Pin Kembali",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER);
              }
            }
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return (UserPayment());
            // }));
            ,
            child: Text("Verifikasi",
                style: TextStyle(
                  color: darkpurple,
                  fontWeight: FontWeight.w800,
                ))));
  }
}
