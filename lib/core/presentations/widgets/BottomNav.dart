import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Screen/Home/Component/InputIdOption.dart';
import 'package:ovo_ui/Screen/Home/Component/Qr_Scanner.dart';
import 'package:ovo_ui/core/presentations/widgets/BottomNavItem.dart';
import 'package:ovo_ui/features/logs/presentations/logs_screen.dart';
import 'package:ovo_ui/features/transfer/presentations/transfer_screen.dart';
import 'package:ovo_ui/features/verification/presentations/verification_qr_screen.dart';
import 'package:ovo_ui/features/verification/presentations/verification_screen.dart';

import 'package:share_plus/share_plus.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key, required this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  _BottomNavState createState() => _BottomNavState();
}

int currentIndex = 0;

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 10,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: BottomNavItem(
              title: 'Home',
              svgPath: "assets/icons/home.svg",
              isCurrentIndex: currentIndex == 0,
            ),
          ),
          InkWell(
            onTap: () async {
              final result = await Get.to(() => VerificationQrScreen());

              if (result != null) {
                Get.to(() => LogsScreen(
                      id: result['userId'],
                    ));
              }
            },
            child: BottomNavItem(
              title: "Logs",
              svgPath: "assets/icons/history_icon.svg",
              isCurrentIndex: currentIndex == 1,
            ),
          ),
          InkWell(
            onTap: () async {
              final result = await Get.to(() => VerificationScreen());

              if (result != null) {
                Get.to(
                  () => TransferScreen(
                    id: result['userId'],
                  ),
                );
              }
            },
            child: BottomNavItem(
              title: "Transfer",
              svgPath: "assets/icons/transfer_icon.svg",
              isCurrentIndex: currentIndex == 2,
            ),
          ),
          InkWell(
            onTap: () {
              _onShare(context);
            },
            child: BottomNavItem(
              title: "Share",
              svgPath: "assets/icons/profile.svg",
              isCurrentIndex: currentIndex == 2,
            ),
          ),
        ],
      ),
    );
  }
}

void _onShare(BuildContext context) async {
  final box = context.findRenderObject() as RenderBox;

  await Share.share(
      'Install Our App https://play.google.com/store/apps/details?id=com.beres.app',
      subject: "coba",
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}
