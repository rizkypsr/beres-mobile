import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/Transaction_page.dart';
import 'package:ovo_ui/Screen/Home/Component/productview.dart';
import 'package:ovo_ui/Screen/Home/Component/umkm_page.dart';
import 'package:ovo_ui/Screen/TopUp/InstantTopUp/InstanTopUp.dart';
import 'package:ovo_ui/features/jual_sampah/presentations/jual_sampah_product_screen.dart';
import 'package:ovo_ui/features/ppob/presentations/ppob_screen.dart';
import 'package:ovo_ui/features/umkm/presentations/umkm_screen.dart';

class TopUpService extends StatelessWidget {
  const TopUpService({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(19, 24, 19, 17),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: Offset(2, 2),
                blurRadius: 10),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TopupBTN(
            iconpath: "assets/images/bin.png",
            text: "Jual Sampah",
            ontap: () {
              Get.to(() => JualSampahProductScreen());
            },
          ),
          TopupBTN(
            iconpath: "assets/images/cart.png",
            text: "UMKM Kita",
            ontap: () {
              Get.to(() => UMKMScreen());
            },
          ),
          TopupBTN(
            iconpath: "assets/images/ppob.png",
            text: "PPOB",
            ontap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return InstantTopUp();
              // }));
              Get.to(() => PpobScreen());
            },
          ),
        ],
      ),
    );
  }
}

class TopupBTN extends StatelessWidget {
  final Function? ontap;
  final String? iconpath;
  final String? text;
  //final String icon2;
  //final String icon;

  const TopupBTN({
    Key? key,
    //this.icon2,
    this.iconpath,
    this.text,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap!();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 12),
        child: Container(
          color: Colors.white,
          width: (MediaQuery.of(context).size.width - 38) / 4,
          child: Column(
            children: <Widget>[
              // SvgPicture.asset(
              //   iconpath,
              //   height: 26,
              //   // color: Colors.teal[400],
              // ),
              Image.asset(
                iconpath!,
                height: 26,
              ),
              SizedBox(height: 8),
              Text(
                text!,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: darkpurple),
              )
            ],
          ),
        ),
      ),
    );
  }
}
