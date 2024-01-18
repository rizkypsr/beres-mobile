import 'package:flutter/material.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:ovo_ui/features/home/presentations/home_screen.dart';
import 'package:lottie/lottie.dart';

class FailedPage extends StatefulWidget {
  final String? id_user;
  final String? nominal;

  FailedPage({this.id_user, this.nominal});

  @override
  _FailedPage createState() => _FailedPage();
}

class _FailedPage extends State<FailedPage> {
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
                Lottie.asset("assets/images/failedgan.json", height: 200),
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
                Text("Maaf, transaksi tidak dapat dilakukan",
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
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return MainPage();
                    // }));
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
