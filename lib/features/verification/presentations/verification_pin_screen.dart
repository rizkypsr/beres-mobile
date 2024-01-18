import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/features/verification/controllers/pin_verification_controller.dart';
import 'package:ovo_ui/features/verification/widgets/text_field_with_icon.dart';
import 'package:ovo_ui/features/verification/widgets/verification_button.dart';

class VerificationPinScreen extends StatelessWidget {
  VerificationPinScreen({Key? key}) : super(key: key);

  final PinCheckController pinCheckController = Get.put(PinCheckController());
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final int challengeId = Get.arguments['challengeId'];
    final int userId = Get.arguments['userId'];

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
            child: Obx(() {
              final isLoading = pinCheckController.isLoading.value;

              return Column(
                children: [
                  const SizedBox(
                    height: 42.0,
                  ),
                  Text(
                    'Verifikasi User',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFieldWithIcon(
                    keyboardType: TextInputType.number,
                    controller: pinController,
                    icon: Icons.lock,
                    hintText: 'Pin',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  isLoading
                      ? CircularProgressIndicator()
                      : VerificationButton(
                          label: "Verifikasi",
                          onPressed: () {
                            if (pinController.text.isEmpty) {
                              Get.snackbar(
                                'Error',
                                'Pin tidak boleh kosong',
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                              return;
                            }

                            pinCheckController.checkPin(
                              userId: userId.toString(),
                              pin: pinController.text,
                            );
                          },
                        )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
