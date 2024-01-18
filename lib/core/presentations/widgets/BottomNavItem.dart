import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovo_ui/Constant/Color.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.title,
    required this.svgPath,
    required this.isCurrentIndex,
  }) : super(key: key);

  final String title;
  final String svgPath;
  final bool isCurrentIndex;

  @override
  Widget build(BuildContext context) {
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
        message: title,
        child: Container(
          // height: 56,
          // width: MediaQuery.of(context).size.width / 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                svgPath,
                height: 19,
                color: isCurrentIndex ? darkpurple : greyicon,
              ),
              SizedBox(height: 3),
              Text(
                title,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isCurrentIndex ? darkpurple : greyicon),
              )
            ],
          ),
        ),
      ),
    );
  }
}
