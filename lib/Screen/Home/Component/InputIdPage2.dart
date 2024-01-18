import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/confirmjs.dart';
import 'package:ovo_ui/Screen/Home/Component/pinpass.dart';
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

class InputId_page2 extends StatefulWidget {
  final int? id_detail;
  final String? id_pelanggan;
  //final String id_user;
  final String? Tipe;
  final List<JenisSampahBody>? listSampah;

  InputId_page2(
      {this.id_detail,
      this.id_pelanggan,
      //this.id_user,
      this.Tipe,
      this.listSampah});
  // this.listSampah});
  @override
  _InputId2 createState() => _InputId2();
}

class _InputId2 extends State<InputId_page2> {
  TextEditingController controller = new TextEditingController();
  bool _validate = false;
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
                        'User ID',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 50),
                      buildInputId2(),
                      SizedBox(height: 10),
                      // InkWell(
                      //   onTap: () {
                      //     return buildVerifBtn(UserPayment(user: Barcode.code),);
                      //   },
                      // ),
                      buildButton2()
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
  Widget buildInputId2() {
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
              // obscureText: true,
              style: TextStyle(color: Colors.black87, fontSize: 16),
              controller: controller,
              decoration: InputDecoration(
                  errorText: _validate ? 'Masukkan User ID anda' : null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF0e8e83)),
                  hintText: 'User ID',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget buildButton2() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () async {
              if (widget.Tipe == 'Transfer') {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return confirmjs(
                      id_user: controller.text, listSampah: widget.listSampah!);
                }));
              }
              // else if(widget.Tipe==''){

              // }
              else {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return PinPass(
                    id_detail: widget.id_detail!,
                    id_pelanggan: widget.id_pelanggan!,
                    id_user: controller.text,
                    Tipe: widget.Tipe!,
                  );
                  //UserPayment(/*user: barcode.code,*/);
                }));
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


 // Widget buildInputId() => Container(
  //     padding: EdgeInsets.all(12),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(8),
  //       color: Colors.white24,
  //     ),
  //     child: TextField(
  //       controller: controllerId,
  //       keyboardType: TextInputType.number,
  //       style: TextStyle(color: Colors.black87, fontSize: 16),
  //       decoration: InputDecoration(
  //           border: InputBorder.none,
  //           contentPadding: EdgeInsets.all(8),
  //           prefixIcon: Icon(
  //             Icons.people_rounded,
  //             color: Color(0xFF0e8e83),
  //           ),
  //           hintText: 'User ID',
  //           hintStyle: TextStyle(color: Colors.black38)),
  //       // child: Text(
  //       //   barcode != null ? 'Result : ${barcode.code}' : 'Scan a code',
  //       //   maxLines: 3,
  //       // ),
  //     ));

  // Widget buildButton() {
  //   return Container(
  //     padding: EdgeInsets.all(5),
  //     width: double.infinity,
  //     child: ElevatedButton(
  //         onPressed: () async {
  //           setState(() {
  //             this.controllerId = controllerId;
  //           });
  //           if (controllerId != null) {
  //             Navigator.of(context).push(MaterialPageRoute(builder: (context) {
  //               return PinPass(
  //                 id_detail: widget.id_detail,
  //                 id_pelanggan: widget.id_pelanggan,
  //                 id_user: controllerId.text,
  //                 Tipe: widget.Tipe,
  //               );
  //               //UserPayment(/*user: barcode.code,*/);
  //             }));
  //           } else {
  //             Fluttertoast.showToast(
  //                 msg: "User ID Salah, Masukkan User ID Kembali",
  //                 toastLength: Toast.LENGTH_LONG,
  //                 gravity: ToastGravity.CENTER);
  //           }
  //         },
  //         child: Text("Login")),
  //   );
  // }