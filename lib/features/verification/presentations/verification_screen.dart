import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/features/verification/presentations/verification_qr_screen.dart';
import 'package:ovo_ui/features/verification/presentations/verification_user_id.screen.dart';
import 'package:ovo_ui/features/verification/widgets/verification_button.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key, this.needPin = true}) : super(key: key);

  final bool needPin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0e8e83),
              Color(0xFF0e8e83),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 42.0,
                ),
                Text(
                  'User ID',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                VerificationButton(
                  label: "Verifikasi dengan Barcode",
                  onPressed: () async {
                    final isVerified = await Get.to(() => VerificationQrScreen(
                          needPin: needPin,
                        ));

                    if (isVerified != null) {
                      Get.back(result: isVerified);
                    }
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                VerificationButton(
                  label: "Verifikasi dengan User ID",
                  onPressed: () async {
                    final isVerified =
                        await Get.to(() => VerificationUserIdScreen(
                              needPin: needPin,
                            ));

                    if (isVerified != null) {
                      Get.back(result: isVerified);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
