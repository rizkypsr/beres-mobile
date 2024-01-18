import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/features/verification/presentations/verification_pin_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class VerificationQrScreen extends StatelessWidget {
  VerificationQrScreen({Key? key, this.needPin = true}) : super(key: key);

  final qrKey = GlobalKey(debugLabel: 'QR');
  final bool needPin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: (QRViewController controller) {
              controller.scannedDataStream.listen(
                (barcode) async {
                  Map<String, dynamic> decodedData = jsonDecode(barcode.code!);

                  int userId = decodedData['user_id'];

                  controller.stopCamera();
                  controller.dispose();

                  if (!needPin) {
                    Get.back(result: userId);
                    return;
                  }

                  final isVerified =
                      await Get.to(() => VerificationPinScreen(), arguments: {
                    'userId': userId,
                  });

                  if (isVerified != null) {
                    Get.back(result: isVerified);
                  }
                },
              );
            },
            overlay: QrScannerOverlayShape(
              borderRadius: 10,
              borderLength: 20,
              borderWidth: 10,
              cutOutSize: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white24,
            ),
            child: Text(
              'Scan a code',
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
