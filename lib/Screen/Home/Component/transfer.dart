import 'package:flutter/material.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/InputIdOption.dart';
import 'package:ovo_ui/Screen/Home/Component/Qr_Scanner.dart';
import 'package:ovo_ui/Screen/Home/Component/Qr_Scanner2.dart';
//import 'package:ovo_ui/Screen/TopUp/InstantTopUp/Component/KartuDebit.dart';
import 'package:ovo_ui/Screen/TopUp/InstantTopUp/Component/PilihTopUp.dart';
import 'package:ovo_ui/Screen/TopUp/InstantTopUp/Component/TopUpKe.dart';

class Transfer extends StatefulWidget {
  final String? namapengirim;
  // final String id_pengirim;
  final String? id_user;
  String? nominalchanged;
  final String? Tipe;

  Transfer({this.nominalchanged, this.Tipe, this.id_user, this.namapengirim});
  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer/Pembayaran"),
      ),
      backgroundColor: greybgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopUpKe(),
            PilihTopUp(nominalfunction: (data) {
              widget.nominalchanged = data;
            }),
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
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return InputIdOption(
                                    namapengirim: widget.namapengirim,
                                    // id_pengirim: widget.id_pengirim,
                                    id_user: widget.id_user,
                                    nominal: widget.nominalchanged,
                                    Tipe: 'Transfer2',
                                  );
                                  // return QrScanner2(
                                  //   namapengirim: widget.namapengirim,
                                  //   // id_pengirim: widget.id_pengirim,
                                  //   id_user: widget.id_user,
                                  //   nominal: widget.nominalchanged,
                                  //   Tipe: 'Transfer',
                                  // );
                                  //UserPayment(/*user: barcode.code,*/);
                                }));
                              },
                              child: Text("Ya"))
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
    );
  }
}
