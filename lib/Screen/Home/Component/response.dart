import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:ovo_ui/features/home/presentations/home_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:ovo_ui/main_screen.dart';

class SuccessPage extends StatefulWidget {
  final String? id_user;
  final String? nominal;

  SuccessPage({this.id_user, this.nominal});

  @override
  _SuccessPage createState() => _SuccessPage();
}

class _SuccessPage extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Proses Transaksi"),
        ),
        backgroundColor: darkpurple,
        body: SingleChildScrollView(
            child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/images/sucessbro.json", height: 200),
                // Lottie.network(
                //     "https://assets7.lottiefiles.com/packages/lf20_maz5zcuo.json",
                //     ),
                // Image.asset(
                //   "assets/images/success.gif",
                //   height: 150,
                //   color: Colors.white,
                // ),
                SizedBox(
                  height: 20,
                ),
                Text("Terima Kasih \nPembayaran Telah Berhasil Dilakukan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 70,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Get.off(() => MainScreen());
                  },
                  child: Text(
                    "Kembali ke Beranda",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: darkpurple,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
