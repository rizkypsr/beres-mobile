import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:ovo_ui/Screen/Home/Component/InputId_page.dart';
import 'package:ovo_ui/Screen/Home/Component/Logs.dart';
import 'package:ovo_ui/Screen/Home/Component/OVO_Cash.dart';
import 'package:ovo_ui/Screen/Home/Component/Qr_Scanner.dart';
import 'package:ovo_ui/Screen/Home/Component/Qr_Scanner2.dart';
import 'package:ovo_ui/Screen/Home/Component/customer_services.dart';
import 'package:ovo_ui/Screen/Home/Component/response.dart';
import 'package:ovo_ui/Screen/Home/Component/transjs_service.dart';
import 'package:ovo_ui/Screen/Home/Component/transppob_services.dart';
import 'package:ovo_ui/Screen/Home/Component/userpayment.dart';
import 'package:ovo_ui/features/home/presentations/home_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InputIdOption extends StatefulWidget {
//   // final int id_detail;
  final String? namapengirim;
  final String? nominal;
  final String? id_user;
  final String? Tipe;
  final List<JenisSampahBody>? listSampah;

  InputIdOption(
      {this.namapengirim,
      this.nominal,
      this.id_user,
      this.Tipe,
      this.listSampah});
//   // {this.id_detail,
//   // this.id_pelanggan,
//   // this.id_user,
//   // this.Tipe,
//   // this.listSampah});
  @override
  _InputIdOption createState() => _InputIdOption();
}

class _InputIdOption extends State<InputIdOption> {
  //TextEditingController controller = new TextEditingController();
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
                      buildButtonScan(),
                      //SizedBox(height: 5),
                      buildButtonInput()
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
  Widget buildButtonScan() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () async {
              if (widget.Tipe == 'Jual Sampah') {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return (QrScanner2(
                    Tipe: widget.Tipe,
                    listSampah: widget.listSampah,
                  ));
                }));
              } else if (widget.Tipe == 'Transfer2') {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return (QrScanner2(
                    namapengirim: widget.namapengirim,
                    id_user: widget.id_user,
                    nominal: widget.nominal,
                    Tipe: widget.Tipe,
                  ));
                }));
              } else if (widget.Tipe == 'Transfer') {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return (QrScanner(
                    Tipe: widget.Tipe,
                  ));
                }));
              }
            }
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return (UserPayment());
            // }));
            ,
            child: Text("Verifikasi dengan Barcode",
                style: TextStyle(
                  color: darkpurple,
                  fontWeight: FontWeight.w800,
                ))));
  }

  @override
  Widget buildButtonInput() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () async {
              if (widget.Tipe == 'Jual Sampah') {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return (InputId_page(
                    Tipe: widget.Tipe!,
                    listSampah: widget.listSampah,
                  ));
                }));
              } else if (widget.Tipe == 'Transfer') {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return (InputId_page(
                    Tipe: widget.Tipe!,
                    //listSampah: widget.listSampah,
                  ));
                }));
              } else if (widget.Tipe == 'Transfer2') {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return (InputId_page(
                    namapengirim: widget.namapengirim,
                    id_user: widget.id_user,
                    nominal: widget.nominal,
                    Tipe: widget.Tipe!,
                    //listSampah: widget.listSampah,
                  ));
                }));
              }
            }
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return (UserPayment());
            // }));
            ,
            child: Text("Verifikasi dengan User ID",
                style: TextStyle(
                  color: darkpurple,
                  fontWeight: FontWeight.w800,
                ))));
  }
}
