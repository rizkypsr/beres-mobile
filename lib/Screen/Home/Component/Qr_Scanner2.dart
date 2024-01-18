import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:ovo_ui/features/sedekah/presentations/jemput_sampah_screen.dart';
import 'package:ovo_ui/Screen/Home/Component/JemputSampah_services.dart';
import 'package:ovo_ui/Screen/Home/Component/OVO_Cash.dart';
import 'package:ovo_ui/Screen/Home/Component/confirm.dart';
import 'package:ovo_ui/Screen/Home/Component/confirmjs.dart';
import 'package:ovo_ui/Screen/Home/Component/pinpass.dart';
import 'package:ovo_ui/Screen/Home/Component/response.dart';
import 'package:ovo_ui/Screen/Home/Component/transfer_service.dart';
import 'package:ovo_ui/Screen/Home/Component/transjs_service.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:ovo_ui/Screen/Home/Component/userpayment.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QrScanner2 extends StatefulWidget {
  final String? namapengirim;
  final String? id_pengirim;
  final String? Tipe;
  final String? nominal;
  final String? id_user;
  final String? nama;
  final String? nomor;
  final String? Alamat;
  final String? Jenis_Sampah;
  final int? kecamatan;
  final List<JenisSampahBody>? listSampah;

  const QrScanner2(
      {Key? key,
      this.namapengirim,
      this.id_pengirim,
      this.Tipe,
      this.nominal,
      this.id_user,
      this.nama,
      this.nomor,
      this.Alamat,
      this.Jenis_Sampah,
      this.kecamatan,
      this.listSampah})
      : super(key: key);

  @override
  _QrScannerState2 createState() => _QrScannerState2();
}

class _QrScannerState2 extends State<QrScanner2> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  TextEditingController controllerId2 = new TextEditingController();
  QRViewController? controller;
  Barcode? barcode;

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
          buildQrView2(context),
          Positioned(bottom: 10, child: buildResult2())
        ],
      ),
    );
  }

  Widget buildResult2() => Container(
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

  Widget buildQrView2(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated2,
        overlay: QrScannerOverlayShape(
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  void onQRViewCreated2(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen(
      (barcode) async {
        setState(() {
          this.controller = controller;
          this.barcode = barcode;
        });

        if (barcode != null) {
          controller.pauseCamera();
          print("masok");
          print(barcode.code);
          print(widget.Tipe);
          // if (widget.Tipe == 'Jemput Sampah') {
          //   var response = await JemputSampahservices.jemputsampahjs(
          //       widget.nama,
          //       widget.nomor,
          //       widget.Alamat,
          //       widget.Jenis_Sampah,
          //       widget.kecamatan);
          //   print(response);
          //   if (response['status'] == 'success') {
          //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //       return SuccessPage(id_user: barcode.code);
          //     }));
          //   } else {
          //     Fluttertoast.showToast(
          //         msg: "QR CODE Bermasalah, Scan Kembali",
          //         toastLength: Toast.LENGTH_LONG,
          //         gravity: ToastGravity.CENTER);
          //   }
          // } else
          if (widget.Tipe == 'Transfer2') {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return confirm(
                id_pengirim: widget.id_user!,
                namapengirim: widget.namapengirim!,
                id_user: barcode.code!,
                nominal: widget.nominal!,
              );
            }));
            // var response = await Transferservices.Transferjs(
            //     widget.id_user, barcode.code, widget.nominal);
            // print(response);
            // if (response['status'] == 'success') {
            //   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //     return SuccessPage();
            //   }));
          } else if (widget.Tipe == 'Jual Sampah') {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return confirmjs(
                  id_user: barcode.code!, listSampah: widget.listSampah!);
            }));
            // print("masok jual sampah");
            // var response = await jualsampahJson.jualsampahjs(
            //     barcode.code, widget.listSampah);
            // print(response);
            // if (response['status'] == 'success') {
            //   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //     return SuccessPage();
            //   }));
            // } else {
            //   Fluttertoast.showToast(
            //       msg: "QR CODE Bermasalah, Scan Kembali",
            //       toastLength: Toast.LENGTH_LONG,
            //       gravity: ToastGravity.CENTER);
            // }
          } else {
            Fluttertoast.showToast(
                msg: "QR CODE Bermasalah, Scan Kembali",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER);
          }
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
