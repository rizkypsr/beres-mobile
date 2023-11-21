import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/OVO_Cash.dart';
import 'package:ovo_ui/Screen/Home/Component/pinpass.dart';
import 'package:ovo_ui/Screen/Home/Component/response.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:ovo_ui/Screen/Home/Component/userpayment.dart';

class ScannerJS extends StatefulWidget {
  const ScannerJS({
    Key? key,
  }) : super(key: key);

  @override
  _ScannerJS createState() => _ScannerJS();
}

class _ScannerJS extends State<ScannerJS> {
  final qrKey = GlobalKey(debugLabel: 'QR');
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
          buildQrView(context),
          Positioned(bottom: 10, child: buildResult())
        ],
      ),
    );
  }

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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SuccessPage();
            //UserPayment(/*user: barcode.code,*/);
          }));
        }
      },
    );
  }
}
