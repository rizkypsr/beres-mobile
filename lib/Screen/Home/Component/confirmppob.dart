import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:ovo_ui/Screen/Home/Component/CustomerGet.dart';
import 'package:ovo_ui/Screen/Home/Component/Purple_BG.dart';
import 'package:ovo_ui/Screen/Home/Component/Qr_Scanner.dart';
import 'package:ovo_ui/Screen/Home/Component/response.dart';
import 'package:ovo_ui/Screen/Home/Component/transfer_service.dart';

class confirmppob extends StatefulWidget {
  final String? tipe;
  final String? id_user;
  final int? id_detail;
  final String? harga;
  final String? id_pelanggan;
  final String? id_cat;
  confirmppob(
      {this.tipe,
      this.id_user,
      this.id_detail,
      this.harga,
      this.id_cat,
      this.id_pelanggan});
  @override
  _confirmState createState() => _confirmState();
}

class _confirmState extends State<confirmppob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Konfirmasi"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              PurpleBG(),
              Container(
                height: 70,
                width: double.infinity,
                margin: EdgeInsets.all(20),
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
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                "ID Detail",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              Text(
                                "ID Pelanggan",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              Text("Kategori",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        //flex: 1,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                " : " + widget.id_detail.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              Text(
                                " : " + widget.id_pelanggan!,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              Text(" : " + widget.harga!,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 16, 15, 7),
            width: double.infinity,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                color: darkpurple,
                borderRadius: BorderRadius.circular(19),
              ),
              child: Center(
                  child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Konfirmasi"),
                          content: Text("Apakah anda yakin untuk melanjutkan?"),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Tidak")),
                            ElevatedButton(
                                child: Text("Ya"),
                                onPressed: () async {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return QrScanner(
                                      Tipe: "PPOB",
                                      id_detail: widget.id_detail,
                                      id_pelanggan: widget.id_pelanggan,
                                    );
                                  }));
                                  // var response =
                                  //     await Transferservices.Transferjs(
                                  //         widget.id_pengirim,
                                  //         listname.id_customer.toString(),
                                  //         widget.nominal);
                                  // print(response);
                                  // if (response['status'] == 'success') {
                                  //   Navigator.of(context).push(
                                  //       MaterialPageRoute(builder: (context) {
                                  //     return SuccessPage();
                                  //   }));
                                  // }
                                }),
                          ],
                        );
                      });
                },
                child: Text(
                  "Transfer",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
