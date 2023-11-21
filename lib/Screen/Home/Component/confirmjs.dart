import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:ovo_ui/Screen/Home/Component/CustomerGet.dart';
import 'package:ovo_ui/Screen/Home/Component/Purple_BG.dart';
import 'package:ovo_ui/Screen/Home/Component/pinpass.dart';
import 'package:ovo_ui/Screen/Home/Component/response.dart';
import 'package:ovo_ui/Screen/Home/Component/transfer_service.dart';
import 'package:ovo_ui/Screen/Home/Component/transjs_service.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class confirmjs extends StatefulWidget {
  final int? id_detail;
  final String? nominal;
  final String id_user;
  final String? id_pengirim;
  final List<JenisSampahBody> listSampah;

  confirmjs(
      {this.id_detail,
      this.nominal,
      required this.id_user,
      this.id_pengirim,
      required this.listSampah});
  @override
  _confirmState createState() => _confirmState();
}

class _confirmState extends State<confirmjs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Konfirmasi Jual Sampah"),
      ),
      body: widget.listSampah == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          :
          // Jika tidak null, maka menampilkan list
          CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (ctx, index) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(0, 5),
                                  color: Colors.grey.shade400,
                                ),
                              ],
                            ),
                            child: widget.listSampah != null
                                ? widget.listSampah.length > 0
                                    ? Container(
                                        margin: EdgeInsets.all(8),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "ID Jenis Sampah : " +
                                                    widget
                                                        .listSampah[index].id_js
                                                        .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Text(
                                                "Jenis Sampah : " +
                                                    widget.listSampah[index]
                                                        .judul_js
                                                        .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Text(
                                                  "Jumlah Berat : " +
                                                      widget.listSampah[index]
                                                          .jumlah_js +
                                                      "/kg",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              SizedBox(
                                                height: 7,
                                              ),
                                            ]),
                                      )
                                    : SizedBox()
                                : SizedBox(),
                          ),
                        ],
                      );
                    },
                    // Jika list produk null, maka panjang list di set 0, jika tidak null maka di set sesuai panjang list produk
                    childCount: widget.listSampah != null
                        ? widget.listSampah.length
                        : 0,
                  ),
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2,
                  //     childAspectRatio: 1 / 1.5,
                  //     crossAxisSpacing: 10,
                  //     mainAxisSpacing: 12),
                )
              ],
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
                                    return PinPass(
                                      Tipe: "Jual Sampah",
                                      id_user: widget.id_user,
                                      listSampah: widget.listSampah,
                                    );
                                  }));
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
