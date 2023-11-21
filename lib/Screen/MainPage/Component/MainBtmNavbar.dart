import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/InputIdOption.dart';
import 'package:ovo_ui/Screen/Home/Component/Logs.dart';
import 'package:ovo_ui/Screen/Home/Component/Qr_Scanner.dart';
import 'package:ovo_ui/Screen/Home/Component/transfer.dart';

import 'package:share_plus/share_plus.dart';

class MainBottomNavBar extends StatefulWidget {
  final PageController? pageController;
  const MainBottomNavBar({
    Key? key,
    this.pageController,
  }) : super(key: key);

  @override
  _MainBottomNavBarState createState() => _MainBottomNavBarState();
}

int currindex = 0;

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: iconBTMAppbar(
                "assets/icons/home.svg",
                "Home",
                0,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return QrScanner(
                    Tipe: 'Logs',
                  );
                }));
              },
              child: iconBTMAppbar(
                "assets/icons/history_icon.svg",
                "Logs",
                1,
              ),
            ),
            // iconBTMAppbar(
            //   "assets/icons/history_icon.svg",
            //   "Logs",
            //   1,
            // ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 8),
              height: 56,
              width: MediaQuery.of(context).size.width / 5,
              child: Text(
                "Scan",
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w600, color: greyicon),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return InputIdOption(
                    Tipe: 'Transfer',
                  );
                }));
              },
              child: iconBTMAppbar(
                "assets/icons/transfer_icon.svg",
                "Transfer",
                2,
              ),
            ),
            InkWell(
                onTap: () {
                  //print("ke klik");
                  _onShare(context);
                },
                child: Tooltip(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(8),
                  message: "share",
                  child: Container(
                    color: Colors.white,
                    height: 56,
                    width: MediaQuery.of(context).size.width / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/profile.svg",
                          height: 19,
                          color: greyicon,
                        ),
                        SizedBox(height: 3),
                        Text(
                          "share",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: greyicon),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final box = context.findRenderObject() as RenderBox;

    await Share.share(
        'Install Our App https://play.google.com/store/apps/details?id=com.beres.app',
        subject: "coba",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  Widget iconBTMAppbar(String svgpath, String text, int index) {
    return Container(
      // onTap: () {
      //   setState(() {
      //     // print("ke klik");
      //     currindex = index;
      //     widget.pageController.jumpToPage(0);
      //     //uncomment this when using Deals page(1), Finance page(2),Profile page(3)
      //     //widget.pageController.jumpToPage(index);
      //   });
      // },
      child: Tooltip(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(8),
        message: text,
        child: Container(
          color: Colors.white,
          height: 56,
          width: MediaQuery.of(context).size.width / 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                svgpath,
                height: 19,
                color: currindex == index ? darkpurple : greyicon,
              ),
              SizedBox(height: 3),
              Text(
                text,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: currindex == index ? darkpurple : greyicon),
              )
            ],
          ),
        ),
      ),
    );
  }
}
