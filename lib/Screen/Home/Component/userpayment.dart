import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/OVO_Cash.dart';
import 'package:ovo_ui/Screen/Home/Component/Purple_BG.dart';
import 'package:ovo_ui/Screen/Home/Component/transfer.dart';
import 'package:ovo_ui/Screen/MainPage/MainPage.dart';

class UserPayment extends StatefulWidget {
  final String? id_detail;
  final String? id_pelanggan;
  final String? id_user;
  final String? nama;
  final String? saldo;
  final String? alamat;

  UserPayment(
      {this.id_detail,
      this.id_pelanggan,
      this.id_user,
      this.nama,
      this.saldo,
      this.alamat});
  @override
  _UserPayment createState() => _UserPayment();
}

class _UserPayment extends State<UserPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Saldo Cek"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              PurpleBG(),
              Column(
                children: <Widget>[
                  Container(
                    child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  "Saldo Beres \n" +
                                      NumberFormat.currency(
                                              locale: 'id',
                                              symbol: ' ',
                                              decimalDigits: 0)
                                          .format(int.parse(widget.saldo!)) +
                                      " Poin",
                                  // 'Saldo Beres \n Rp ${widget.saldo}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(0, 5),
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(height: 5),
                                      SizedBox(height: 5),
                                      Text(
                                        '${widget.nama}',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '${widget.alamat}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'ID \t: ${widget.id_user}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  buildBayarBtn(),
                  SizedBox(
                    height: 5,
                  ),
                  buildHomepageBtn(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildBayarBtn() {
    return Container(
      //color: darkpurple,
      padding: EdgeInsets.symmetric(vertical: 0),
      width: 200,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(darkpurple),
        ),
        onPressed: () {
          if (widget.saldo != 0) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Transfer(
                id_user: widget.id_user,
                namapengirim: widget.nama,
              );
            }));
          } else {
            Fluttertoast.showToast(
                msg: "Saldo anda kosong, Silahkan Top Up",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER);
          }
        },
        child: Text("Lanjutkan Pembayaran"),
      ),
    );
  }

  @override
  Widget buildHomepageBtn() {
    return Container(
      //color: darkpurple,
      padding: EdgeInsets.symmetric(vertical: 0),
      width: 200,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(darkpurple),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return MainPage();
          }));
        },
        child: Text("Kembali halaman utama"),
      ),
    );
  }
}
