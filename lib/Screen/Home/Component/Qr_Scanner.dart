import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/OVO_Cash.dart';
import 'package:ovo_ui/Screen/Home/Component/pinpass.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:ovo_ui/Screen/Home/Component/userpayment.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QrScanner extends StatefulWidget {
  final int? id_detail;
  final String? id_pelanggan;
  final String? Tipe;

  const QrScanner({Key? key, this.id_detail, this.id_pelanggan, this.Tipe})
      : super(key: key);

  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  TextEditingController controllerId = new TextEditingController();

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    // if (Platform.isAndroid) {
    await controller!.pauseCamera();
    // }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQrView(context),
          Positioned(bottom: 10, child: buildResult())
        ],
      ),
    );
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

  Widget buildResult() => Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white24,
        ),
        child: Text(
          barcode != null ? 'Result : ${barcode!.code}' : 'Scan a code',
          maxLines: 3,
        ),
      );

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen(
      (barcode) {
        setState(() {
          this.controller = controller;
          this.barcode = barcode;
        });

        if (barcode != null) {
          controller.pauseCamera();
          print("ke scan");
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return PinPass(
              id_detail: widget.id_detail,
              id_pelanggan: widget.id_pelanggan,
              id_user: barcode.code,
              Tipe: widget.Tipe,
            );
            //UserPayment(/*user: barcode.code,*/);
          }));
        } else {
          Fluttertoast.showToast(
              msg: "QR CODE Bermasalah, Scan Kembali",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER);
        }
      },
    );
  }
}
