import 'package:flutter/material.dart';
import 'package:ovo_ui/Screen/Home/Component/PPOBcategory.dart';
import 'package:ovo_ui/Screen/Home/Component/PPOBdetail.dart';
import 'package:ovo_ui/Screen/Home/Component/Qr_Scanner.dart';
import 'package:ovo_ui/Screen/Home/Component/TitleText.dart';
import 'package:ovo_ui/Screen/Home/Component/confirmppob.dart';
//import 'package:ovo_ui/Screen/TopUp/InstantTopUp/Component/KartuDebit.dart';
import 'package:ovo_ui/Screen/TopUp/InstantTopUp/Component/PilihTopUp.dart';
import 'package:ovo_ui/Screen/TopUp/InstantTopUp/Component/TopUpKe.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InstantTopUp extends StatefulWidget {
  final Function? onChange;
  // final int id_detail;
  final String? tipe;
  // final String tipe;

  InstantTopUp({this.onChange, this.tipe});
  @override
  State<InstantTopUp> createState() => _InstantTopUpState();
}

class _InstantTopUpState extends State<InstantTopUp> {
  int selected_idcat = 0;
  Widget dropdownCat = SizedBox();
  String? harga;
  int selected_id_detail = 0;
  TextEditingController controller = new TextEditingController();
  int? categoryIndex = null;
  bool _validate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if (widget.tipe == "pln") {
        categoryIndex = 0;
      } else if (widget.tipe == "pulsa") {
        categoryIndex = 1;
      } else if (widget.tipe == "pdam") {
        categoryIndex = 2;
      } else if (widget.tipe == "paket") {
        categoryIndex = 3;
      } else {
        categoryIndex = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Up PPOB"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopUpKe(),
            SizedBox(
              height: 10,
            ),
            PPOBcat(
              index: categoryIndex,
              onChange: (id) {
                setState(() {
                  selected_idcat = id;
                  dropdownCat = getDetailCat();
                });
              },
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ]),
              height: 60,
              child: TextField(
                style: TextStyle(fontSize: 16),
                controller: controller,
                decoration: InputDecoration(
                  errorText: _validate ? 'ID Tidak Boleh Kosong' : null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(Icons.input_rounded),
                  hintText: "ID Pelanggan",
                ),
              ),
            ),
            SizedBox(height: 10),
            dropdownCat
            // PilihTopUp(),
            //PilihKartuDebit(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
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
              onTap: () async {
                setState(() {
                  controller.text.isEmpty
                      ? _validate = true
                      : showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Konfirmasi"),
                              content:
                                  Text("Apakah anda yakin untuk melanjutkan?"),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Tidak")),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return confirmppob(
                                            id_detail: selected_id_detail,
                                            id_cat: widget.tipe!,
                                            harga: harga,
                                            id_pelanggan: controller.text);
                                        // return QrScanner(
                                        //   Tipe: "PPOB",
                                        //   id_detail: selected_id_detail,
                                        //   id_pelanggan: controller.text,
                                        // );
                                        //UserPayment(/*user: barcode.code,*/);
                                      }));
                                    },
                                    child: Text("Ya"))
                              ],
                            );
                          });
                });
              }
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) {
              //   return QrScanner();
              // }));
              ,
              child: Text(
                "Lanjutkan Transaksi",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
          ),
        ),
      ),
    );
  }

  Widget getDetailCat() {
    return PPOBdetail(
      iddet: selected_idcat,
      onChange: (id, hrg) {
        selected_id_detail = id;
        harga = hrg;
      },
    );
  }
}
