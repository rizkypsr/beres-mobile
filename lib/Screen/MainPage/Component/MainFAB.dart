import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/Qr_Scanner.dart';
import 'package:ovo_ui/features/logs/presentations/logs_screen.dart';
import 'package:ovo_ui/features/transfer/presentations/transfer_screen.dart';
import 'package:ovo_ui/features/verification/presentations/verification_qr_screen.dart';
import 'package:ovo_ui/features/verification/presentations/verification_screen.dart';

//import 'package:qrscan/qrscan.dart' as scanner;
//import 'package:qr_code_scanner/qr_code_scanner.dart' as scanner;
class MainFAB extends StatelessWidget {
  const MainFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.135,
      height: size.width * 0.135,
      child: FloatingActionButton(
        onPressed: () async {
          final result = await Get.to(() => VerificationQrScreen());

          if (result != null) {
            Get.to(
              () => TransferScreen(
                id: result['userId'],
              ),
            );
          }
        },
        child: SvgPicture.asset(
          "assets/icons/scan.svg",
          height: 21,
        ),
        backgroundColor: darkpurple,
        elevation: 0,
      ),
    );
  }
}
