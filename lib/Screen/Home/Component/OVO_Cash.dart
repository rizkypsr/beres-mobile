import 'package:flutter/material.dart';
import 'package:ovo_ui/Constant/Color.dart';

class OVOCash extends StatelessWidget {
  final String? user;
  final String? saldo;
  final String? id;
  final String? alamat;
  OVOCash({this.saldo, this.user, this.id, this.alamat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                children: <TextSpan>[
                  TextSpan(
                      text: "Selamat Datang ${user}",
                      style: TextStyle(fontSize: 16)),
                  //TextSpan(text: "--", style: TextStyle(fontSize: 14))
                ]),
          ),
          SizedBox(height: 6),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text("Saldo ${saldo}",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
              //SizedBox(height:0),
              // Text("Rp 00.000 ${saldo}",
              //     style: TextStyle(
              //         fontSize: 13,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.white)),
              Text(
                "\nAlamat: ${alamat}",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              )
            ],
          ),
          SizedBox(height: 6),
          /*Row(
            children: <Widget>[
              Text("ovo Points",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 14)),
              SizedBox(
                width: 4,
              ),
              Text(
                "28.120",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: orangetext),
              )
            ],
          )*/
        ],
      ),
    );
  }
}
